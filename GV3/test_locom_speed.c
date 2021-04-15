#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <inttypes.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>
#include <assert.h>
#include <time.h>

#include "xxhash.h"
#include "csf3.h"

#define MY32MAX 0xFFFFFFFF
#define MY64MAX 0xFFFFFFFFFFFFFFFF
#define MY63MAX 0x7FFFFFFFFFFFFFFF
#define NTHRHLD 0x3FFFFFFFFFFFFFFF
#define FALSE 0
#define TRUE  1

const unsigned char mask[8] = {0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80};

typedef struct {
    unsigned int mm_len;
    unsigned int R;
    unsigned int* blf_seeds;
    unsigned long int blf_size;
    unsigned char* blf;
    unsigned long blf_value;
    csf_t* csf;
} layer_t;

typedef struct {
    unsigned long long mm_time;
    unsigned long long bloom_time;
    unsigned long long csf_time;
} ltm_t;

int convert(char *st, unsigned long int* res) {
    char *x;
    for (x = st ; *x ; x++) {
        if (*x == '\n') {
            *x = '\0';
            break;
        } else if (!isdigit(*x)) return 0;
    }
    *res = strtoul(st, NULL, 10);
    return 1;
}

/*csf name must be in <base>.m<m>.csf.bin format*/
unsigned int m_from_name(char* s) {
    int i, len, prev, ok;
    unsigned long int m;
    len = strlen(s);
    prev = 0;
    for(i = 0; i < len; ++i) {
        if(s[i] == '.') {
            s[i] = '\0';
            ok = s[prev] == 'm' && convert(&s[prev+1], &m);
            s[i] = '.';
            if (ok) return m;
            prev = i+1;
        }
    }
    return MY32MAX;
}

char* get_minimizer(unsigned char m, char* kmer, unsigned char k, uint64_t seed) {
    int i;
    char *p = NULL;
    XXH64_hash_t minh, hval;
    if (k < m) return NULL;
    minh = MY64MAX;
    for(i = 0; i < k-m+1; ++i) {
        hval = XXH64((void*)(&kmer[i]), m, seed);
        if (minh > hval) {
            minh = hval;
            p = (kmer + i);
        }
    }
    return p;
}

int read_next_ulint(FILE* fh, unsigned long int* res) {
    char* line = NULL;
    size_t len = 0;
    ssize_t read;
    int ret;
    if((read = getline(&line, &len, fh)) != -1) {
        /*fprintf(stderr, "line read from the bloom filter file: %s\n", line);*/
        if(!convert(line, res)) ret = 0;
        else ret = 1;
    } else {
        ret = 0;
    }
    if(line) free(line);
    return ret;
}

void print_layer(FILE* out, layer_t* layer) {
    fprintf(out, "mlen = %u\nR = %u\nblf size = %lu\nblf value = %lu\n", layer->mm_len, layer->R, layer->blf_size, layer->blf_value);
}

int load_layer(char* bl_name, char* csf_name, layer_t* layer)
{
    assert(bl_name);
    assert(csf_name);
    assert(layer);
    char c;
    int i, ch;
    FILE* blh;
    unsigned long int lval = MY64MAX;
    layer->mm_len = m_from_name(csf_name);
    if(strcmp(bl_name, "-") != 0) {
        if((blh = fopen(bl_name, "r")) == NULL) return -1;
        if(!read_next_ulint(blh, &lval)) return -2;
        layer->R = (unsigned int)lval;
        if((layer->blf_seeds = malloc(layer->R * sizeof(*(layer->blf_seeds)))) == NULL) return -1;
        for(i = 0; i < layer->R; ++i) {
            if(!read_next_ulint(blh, &lval)) return -2;
            layer->blf_seeds[i] = (unsigned int) lval;
        }
        if(!read_next_ulint(blh, &layer->blf_size)) return -2;
        if(!read_next_ulint(blh, &layer->blf_value)) return -2;
        if((layer->blf = malloc(layer->blf_size / 8 + 1)) == NULL) return -1;
        i = 0;
        while((c = fgetc(blh)) != EOF) {
            if(c == '0') layer->blf[i/8] &= ~mask[i%8];
            else if (c == '1') layer->blf[i/8] |= mask[i%8];
            else return -3;
            ++i;
        }
        fclose(blh);
    } else {
        layer->R = 0;
        layer->blf_seeds = NULL;
        layer->blf_size = 0;
        layer->blf = NULL;
        layer->blf_value = 0;
    }
    /*load csf*/
    ch = open(csf_name, O_RDONLY);
    layer->csf = load_csf(ch);
    close(ch);
    return 1;
}

void destroy_layer(layer_t* layer) {
    if(layer->blf_seeds) free(layer->blf_seeds);
    if(layer->blf) free(layer->blf);
    destroy_csf(layer->csf);
}

int query(layer_t layers[], int n, char* kmer, unsigned long k, unsigned long* retrieved, ltm_t times[], unsigned long long* total_time) {
    int j, i;
    char* mm;
    unsigned char query;
    int64_t diff;
    uint64_t hval, index;
    struct timespec start_time, end_time, start_total_time, end_total_time;

    /*fprintf(stderr, "checkpoint query: number of layers = %d\n", n);*/
    
    *retrieved = 0;
    i = 0;
    clock_gettime(CLOCK_MONOTONIC, &start_total_time);
    while(*retrieved == 0 && i < n && layers[i].mm_len != MY32MAX) {
        /*fprintf(stderr, "checkpoint query: while\n");*/
        clock_gettime(CLOCK_MONOTONIC, &start_time);/*minimizer time*/
        mm = get_minimizer(layers[i].mm_len, kmer, k, 42); /*BUG save args.seed somewhere from python*/
        clock_gettime(CLOCK_MONOTONIC, &end_time);
        times[i].mm_time = (end_time.tv_sec - start_time.tv_sec) * 1000 * 1000 * 1000 + (end_time.tv_nsec - start_time.tv_nsec);
        /*fprintf(stderr, "checkpoint query: minimizer\n");*/
        query = TRUE;
        clock_gettime(CLOCK_MONOTONIC, &start_time);/*bloom query time*/
        if (layers[i].R) {
            for(j = 0; query && j < layers[i].R; ++j) {
                hval = XXH64((void*)mm, layers[i].mm_len, layers[i].blf_seeds[j]);
                index = hval%layers[i].blf_size;
                query = query && ((layers[i].blf[index/8] & mask[index%8]) != 0 ? TRUE : FALSE);
            }
        }
        clock_gettime(CLOCK_MONOTONIC, &end_time);
        times[i].bloom_time = (end_time.tv_sec - start_time.tv_sec) * 1000 * 1000 * 1000 + (end_time.tv_nsec - start_time.tv_nsec);
        /*fprintf(stderr, "checkpoint query: bloom\n");*/
        clock_gettime(CLOCK_MONOTONIC, &start_time);/*csf/default time*/
        if(query) *retrieved = csf3_get_byte_array(layers[i].csf, mm, layers[i].mm_len);
        else *retrieved = layers[i].blf_value;
        clock_gettime(CLOCK_MONOTONIC, &end_time);
        times[i].csf_time = (end_time.tv_sec - start_time.tv_sec) * 1000 * 1000 * 1000 + (end_time.tv_nsec - start_time.tv_nsec);
        /*fprintf(stderr, "checkpoint query: csf\n");*/
        ++i;
    }
    /*fprintf(stderr, "checkpoint query: middle\n");*/
    if(layers[n-1].mm_len == MY32MAX) {
        /*fprintf(stderr, "checkpoint query: correction enabled\n");*/
        query = TRUE;
        clock_gettime(CLOCK_MONOTONIC, &start_time);/*bloom query time*/
        if (layers[n-1].R) {
            for(j = 0; query && j < layers[n-1].R; ++j) {
                hval = XXH64((void*)kmer, k, layers[n-1].blf_seeds[j]);
                index = hval%layers[n-1].blf_size;
                query = query && ((layers[n-1].blf[index/8] & mask[index%8]) != 0 ? TRUE : FALSE );
            }
        }
        clock_gettime(CLOCK_MONOTONIC, &end_time);
        times[n-1].bloom_time = (end_time.tv_sec - start_time.tv_sec) * 1000 * 1000 * 1000 + (end_time.tv_nsec - start_time.tv_nsec);
        
        clock_gettime(CLOCK_MONOTONIC, &start_time);/*correction time*/
        if(query) diff = csf3_get_byte_array(layers[n-1].csf, kmer, k);
        else diff = layers[n-1].blf_value;
        if(diff > NTHRHLD) diff -= MY63MAX;
        *retrieved = (int64_t)(*retrieved) + diff;
        clock_gettime(CLOCK_MONOTONIC, &end_time);
        times[i].csf_time = (end_time.tv_sec - start_time.tv_sec) * 1000 * 1000 * 1000 + (end_time.tv_nsec - start_time.tv_nsec);
        /*fprintf(stderr, "checkpoint query: correction done\n");*/
    }
    clock_gettime(CLOCK_MONOTONIC, &end_total_time);
    *total_time = (end_total_time.tv_sec - start_total_time.tv_sec) * 1000 * 1000 * 1000 + (end_total_time.tv_nsec - start_total_time.tv_nsec);
    /*fprintf(stderr, "checkpoint query: end\n");*/
    return 1;
}

/*
 * cat intable.count.txt | ./test_locom <bloom_0> <csf_0> ... <bloom_n> <csf_n> <last_bloom> <last csf>
 * if a layer doesn't have a bloom filter, use - 
 * 
 * tm[0] -> minimizer computation
 * tm[1] -> bloom filter query
 * tm[2] -> csf
 * tm[3] -> total
*/
int main(int argc, char** argv) {
    int i, num_layers, err;
    layer_t* layers;
    char *line, *kmer;
    unsigned long k, count, rcount, total_kmers;
    unsigned long long total_time;
    ltm_t* measurements;
    long delta, delta_max, delta_min;
    double delta_avg;
    size_t line_buf_len;
    ssize_t read;
    FILE* fp;

    num_layers = (argc - 1) / 2;
    layers = malloc(num_layers * sizeof(layer_t));
    /*fprintf(stderr, "checkpoint: layers array allocated\n");*/
    for(i = 0; i < num_layers; ++i) {
        if((err = load_layer(argv[i*2 + 1], argv[i*2 + 2], &layers[i])) != 1) {
            fprintf(stderr, "Unable to load layer %d, error code = %d\n", i, err);
            return 1;
        }
    }
    /*fprintf(stderr, "checkpoint: layers loaded\n");*/
    k = 0;
    count = MY64MAX;
    total_kmers = 0;
    if((measurements = calloc(num_layers, sizeof(ltm_t))) == NULL) {
        fprintf(stderr, "Unable to allocate time vector\n");
        return 2;
    };
    delta_min = MY63MAX;
    delta_avg = 0;
    delta_max = 0;
    kmer = NULL;
    line_buf_len = 0;
    fp = stdin;
    while ((read = getline(&kmer, &line_buf_len, fp)) != -1) {/*for each k-mer of the original k-mer table from stdin:*/
        if(read != 1) {/*skip line but do not exit the loop*/
            /*fprintf(stderr, "checkpoint: just read line %s of length %lu\n", kmer, read);*/
            for(line = kmer, i = 0; *line; ++line) {
                if(*line == ' ') {
                    k = i;
                    *line = '\0';
                }
                if(*line == '\n') {
                    *line = '\0';
                    if(!convert(kmer+k+1, &count)) {
                        fprintf(stderr, "Unable to read the (k-mer,count) pair\n");
                        return 1;
                    }
                }
                ++i;
            }
            /*fprintf(stderr, "checkpoint: before query, k = %lu\n", k);*/
            query(layers, num_layers, kmer, k, &rcount, measurements, &total_time);/*find its (estimated) frequency and TODO measure query time for each layer (bloom, csf)*/
            /*fprintf(stderr, "checkpoint: after query\n");*/
            /*fprintf(stdout, "%s,%lu,%lu,", kmer, count, rcount);*/
            for(i=0; i < num_layers; ++i) {
                if(i != num_layers-1) fprintf(stdout, "%llu,%llu,%llu,", measurements[i].mm_time, measurements[i].bloom_time, measurements[i].csf_time);
                else fprintf(stdout, "%llu,%llu,%llu,", measurements[i].mm_time, measurements[i].bloom_time, measurements[i].csf_time);
            }
            fprintf(stdout, "%llu\n", total_time);
            delta = (long)count - (long)rcount;/*compute delta*/
            delta_avg += delta >= 0 ? delta : -delta;
            if(delta < delta_min) delta_min = delta;
            if(delta > delta_max) delta_max = delta;
            ++total_kmers;
        }
    }
    free(measurements);
    if(kmer) free(kmer);
    for(i = 0; i < num_layers; ++i) destroy_layer(&layers[i]);
    free(layers);

    fprintf(stderr, "%ld,%f,%ld\n", delta_min, delta_avg / total_kmers, delta_max);
    return 0;
}
