#!/usr/bin/python3

import os
import sys
import math
import string
import random
import operator
import subprocess
import pyhash

import kmer
import bloom
from kmer import smart_numeric_cast #quick hack
from readfq import readfq
from ZipfGenerator import ZipfGenerator

parent = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
GV3 = "Sux4JTest/target/Sux4JTest-0.0.1-jar-with-dependencies.jar"
jar_exec = os.path.join(parent, GV3)

hasher = pyhash.xx_32()

def run_GOV3(ifile: str, ofile: str):
    out = subprocess.run(["java", "-jar", jar_exec, ifile, ofile], stdout = subprocess.PIPE, stderr = sys.stderr)
    if (out.returncode != 0): raise RuntimeError("problem with GOV3")

def get_random_name(extension: str, size=12, chars=string.ascii_uppercase + string.digits):
    return ''.join(random.choice(chars) for _ in range(size)) +'.'+extension

def group_func(table_handle, minimizer_length: int, collapse_policy: str, delta: int, replacement: str) -> dict:
    def majority(bucket: list):
        histo = dict()
        for elem in bucket:
            if elem in histo: histo[elem] += 1
            else: histo[elem] = 1
        return max(histo.items(), key=operator.itemgetter(1))[0]
    buckets = dict()
    for line in table_handle:
        km, count = line.split()
        mm = kmer.minimizer(minimizer_length, km, hasher)
        count = int(count)
        if mm in buckets: buckets[mm].append(count)
        else: buckets[mm] = [count]
    
    if (collapse_policy == "min"): collapse = min
    elif (collapse_policy == "avg"): collapse = lambda l: sum(l)/len(l)
    elif (collapse_policy == "max"): collapse = max
    elif (collapse_policy == "set"): collapse = set
    elif (collapse_policy == "maj"): collapse = majority
    elif (collapse_policy == "id"): collapse = lambda l: l
    else: raise ValueError("collapsing method not recognised")
    for mm, freqs in buckets.items():
        if (not delta or (max(freqs) - min(freqs)) < delta): buckets[mm] = collapse(freqs)
        else: buckets[mm] = args.r
    return buckets

#------------------------------------------------------------------------------------------------------------

def count_main(args):
    import gzip
    if (args.i and args.i.endswith(".gz")): fd = gzip.open(args.i, "rt")
    elif (args.i): fd = open(args.i, "r")
    else: fd = sys.stdin
    table = dict()
    for _, seq, _ in readfq(fd):
        kmer.count(table, args.k, seq, False)
    fd.close()
    if (args.o): fd = open(args.o, "w")
    else: fd = sys.stdout
    for k, v in table.items(): fd.write("{} {}\n".format(k, v))
    fd.close()

def histo_main(args):
    if (args.i): fd = open(args.i, "r")
    else: fd = sys.stdin
    sp = kmer.Spectrum()
    sp.addFromFile(fd)
    fd.close()
    keys = sorted(list(sp.histogram.keys()))
    if (args.o): fd = open(args.o, "w")
    else: fd = sys.stdout
    for key in keys: fd.write("{} {}\n".format(key, sp.histogram[key]))

def csf_main(args):
    run_GOV3(args.i, args.o)
    if (args.l):
        size = os.stat(args.o).st_size
        sp = kmer.Spectrum()
        with open(args.i, "r") as td:
            k = kmer.length(td)
            sp.addFromFile(td, ' ')
            H0 = sp.entropy()
            L0 = sp.L0Norm()
        with open(args.l, "a") as of:
            of.write("{},{},{},{},{}\n".format(k, round(H0,2), L0, round(H0*L0/8,2), size))

def zipfian_main(args):
    if(args.a < 0 or args.l < 0 or args.n < 0): raise ValueError("All parameters must be positive")
    zipf = ZipfGenerator(args.l, args.a)
    ln = 0
    while(ln < args.n):
        sys.stdout.write("{} {}\n".format(ln, zipf.next()))
        ln += 1

def simulate_csf(N: int, L: int, alpha: float):
    histo = dict()
    zipf_tmp = get_random_name("txt")
    with open(zipf_tmp, "w") as tmp_table:
        ln = 0
        zipf = ZipfGenerator(L, alpha)
        while(ln < N):
            val = zipf.next()
            if val in histo: histo[val] += 1
            else: histo[val] = 1
            tmp_table.write("{} {}\n".format(ln, val))
            ln += 1
    sp = kmer.Spectrum()
    sp.histogram = histo
    H0 = sp.entropy()
    csf_tmp = get_random_name("bin")
    run_GOV3(zipf_tmp, csf_tmp)
    csf_size = os.stat(csf_tmp).st_size
    os.remove(csf_tmp)
    return "{},{},{},{},{},{},{}".format(N, L, alpha, len(histo), round(H0,2), csf_size, round(csf_size*8/N, 2))

def simulate_main(args):
    fo = open(args.o, "w") if args.o else sys.stdout
    for alpha in args.a:
        for nl in args.l:
            fo.write("{}\n".format(simulate_csf(args.n, nl, alpha)))
    fo.close()

def bloom_main(args):
    gen = random.Random()
    gen.seed(args.seed)
    sp = kmer.Spectrum()
    sp.addFromFile(args.i, " ")
    heavy_element = sp.getMaxCount()
    if (args.e == None): args.e = sp.getOptimalEpsilon()#sp._L1light)
    light_items = sp.L0Norm() - sp.getMaxColumn()
    blf = bloom.BloomFilter(light_items, args.e, gen, pyhash.murmur3_x64_128)
    tmp_name = get_random_name("txt")
    with open(tmp_name, "w") as tmp:
        collisions = 0
        with open(args.i, "r") as th:#populating bloom filter and filtering
            k = kmer.length(th)
            for line in th:
                km, count = line.split()
                count = smart_numeric_cast(count)
                if count != heavy_element:#add light items to bloom filter
                    tmp.write("{} {}\n".format(km, count))
                    blf.add(km)
        with open(args.i, "r") as th:#false positives
            for line in th:
                km, count = line.split()
                count = smart_numeric_cast(count)
                if count == heavy_element and (km in blf):#check heavy items only for collisions
                    tmp.write("{} {}\n".format(km, count))
                    collisions += 1#save it in the collision table
    cmp_name = get_random_name("bin")
    run_GOV3(tmp_name, cmp_name)
    csf_size = os.stat(cmp_name).st_size
    os.remove(cmp_name)
    os.remove(tmp_name)
    with open(args.o, "a") as of:
        of.write("{},{},{},{},{},{}\n".format(k, args.e, blf.getBytesMemory(), csf_size, blf.getBytesMemory() + csf_size, collisions))

def get_difference(counter, representative):
    diff = counter - representative
    if diff < 0: return diff + 2**32
    return diff

def blfmm_main(args):
    gen = random.Random()
    gen.seed(args.seed)
    #sp = kmer.Spectrum()
    #sp.addFromFile(args.i)
    with open(args.i, "r") as th: buckets = group_func(th, args.m, "maj", None, None)#filling buckets by majority vote, no threshold, no replacement

    buckets_file = get_random_name("txt")
    with open(buckets_file, "w") as bktsh:
        for mm, collapsed in buckets.items():
            bktsh.write("{} {}\n".format(mm, collapsed))

    #begin new bloom filter for buckets
    bloom_output = get_random_name("csv")
    class MyArgs:
        def __init__(self):
            self.i = self.o = self.e = self.seed = None
    myargs = MyArgs()
    myargs.i = buckets_file
    myargs.o = bloom_output
    myargs.seed = args.seed
    bloom_main(myargs)
    with open(bloom_output, "r") as blod: content = blod.readline()
    os.remove(bloom_output)
    bloom_output = content.strip().split(',')
    buckets_size = int(bloom_output[4])
    #end

    #compressed_buckets_file = get_random_name("bin")
    #run_GOV3(buckets_file, compressed_buckets_file)
    #buckets_size = os.stat(compressed_buckets_file).st_size
    #os.remove(compressed_buckets_file)
    os.remove(buckets_file)
    
    with open(args.i, "r") as th:#compute histogram of the deltas
        k = kmer.length(th)
        delta_histo = dict()
        for line in th:
            km, count = line.split()
            mm = kmer.minimizer(args.m, km, hasher)
            #diff = abs(int(count) - buckets[mm])
            diff = get_difference(int(count), buckets[mm])
            if diff in delta_histo: delta_histo[diff] += 1
            else: delta_histo[diff] = 1
    mdelta = max(delta_histo.values())
    """
    L1_light = 0
    with open(args.i, "r") as th:#compute L1 norm of light deltas
        for line in th:
            km, count = line.split()
            mm = kmer.minimizer(args.m, km, hasher)
            #diff = abs(int(count) - buckets[mm])
            diff = get_difference(int(count), buckets[mm])
            if delta_histo[diff] != mdelta:
                L1_light += smart_numeric_cast(count)#the L1 norm depends on the k-mer counts, not the deltas!
    if (args.e == None): args.e = sp.getOptimalEpsilon(L1_light)
    """
    L1_light = sum(delta_histo.values()) - mdelta
    if (args.e == None): args.e = L1_light / (sum(delta_histo.values()) - L1_light)
    blf = bloom.BloomFilter(L1_light, args.e, gen, pyhash.murmur3_x64_128)
    #sys.stderr.write("L1 norm: {}\nepsilon: {}\nL1 norm of light items: {}\nbloom filter size: {}\n".format(sp.L1Norm(), args.e, L1_light, blf.size))
    with open(args.i, "r") as th:#populate filter
        for line in th:
            km, count = line.split()
            mm = kmer.minimizer(args.m, km, hasher)
            #diff = abs(int(count) - buckets[mm])
            diff = get_difference(int(count), buckets[mm])
            if diff != 0:
                blf.add(km)

    tmp_name = get_random_name("txt")
    fp = 0
    with open(tmp_name, "w") as tmp:
        with open(args.i, "r") as th:#check false positives + non-zero elements
            for line in th:
                km, count = line.split()
                mm = kmer.minimizer(args.m, km, hasher)
                #diff = abs(int(count) - buckets[mm])
                diff = get_difference(int(count), buckets[mm])
                if diff == 0:
                    if km in blf:
                        tmp.write("{} {}\n".format(km, diff))
                        fp += 1
                else:
                    tmp.write("{} {}\n".format(km, diff))
    sys.stderr.write("light items: {} | False positives: {}\n".format(L1_light, fp))
    csf_name = get_random_name("bin")
    run_GOV3(tmp_name, csf_name)
    csf_size = os.stat(csf_name).st_size
    os.remove(tmp_name)
    os.remove(csf_name)
    with open(args.o, "a") as appout:
        appout.write("{},{},{},{},{},{},{}\n".format(k, args.m, args.e, buckets_size, blf.getBytesMemory(), csf_size, buckets_size+blf.getBytesMemory()+csf_size))

def multiple_main(args):
    args.l.sort()
    with open(args.i, "r") as fi:
        k = kmer.length(fi)
        if (k < args.l[-1]): raise ValueError("minimizer length greater than k-mer length")
        if (k > args.l[-1]): args.l.append(k)
    temp_out = args.i
    fname = os.path.basename(args.i).split('.')[0]
    bucket_tables_csize = 0
    bucket_tables = []
    for q in args.l:
        with open(temp_out, "r") as ft:
            buckets = dict()
            for line in ft:#bucketing + min collapse
                km, count = line.split()
                mm = kmer.minimizer(q, km, hasher)
                count = int(count)
                if mm in buckets:
                    val = buckets[mm]
                    if (val != None):
                        val[0] = min(val[0], count)
                        val[1] = max(val[1], count)
                        if(val[1] - val[0] > args.d): buckets[mm] = None
                        else: buckets[mm] = val
                else: buckets[mm] = [count, count]
            ft.seek(0)
            if (not args.w and temp_out != args.i): os.remove(temp_out)
            temp_out = fname + '.t{}'.format(q) + '.txt'
            if (args.w): temp_out = os.path.join(args.w, temp_out)
            with open(temp_out, "w") as fo:#filtering
                for line in ft:
                    km, count = line.split()
                    mm = kmer.minimizer(q, km, hasher)
                    if(buckets[mm] == None): fo.write("{} {}\n".format(km, count))
            out_file = args.o + ".m{}".format(q) + ".txt"
            with open(out_file, "w") as bo:#save bucket table
                for mm, collapsed in buckets.items():
                    if(collapsed): bo.write("{} {}\n".format(mm, collapsed[0]))
                    else: bo.write("{} {}\n".format(mm, 0))#collapsed))
            bucket_tables.append(buckets)
            if(args.c):
                #begin new bloom filter for buckets
                bloom_output = get_random_name("csv")
                class MyArgs:
                    def __init__(self):
                        self.i = self.o = self.e = self.seed = None
                myargs = MyArgs()
                myargs.i = out_file
                myargs.o = bloom_output
                myargs.seed = args.seed
                bloom_main(myargs)
                with open(bloom_output, "r") as blod: content = blod.readline()
                os.remove(bloom_output)
                bloom_output = content.strip().split(',')
                bucket_tables_csize += int(bloom_output[4])
                #end
                #csf_tmp = get_random_name("bin")
                #run_GOV3(out_file, csf_tmp)
                #bucket_tables_csize += os.stat(csf_tmp).st_size
                #os.remove(csf_tmp)
    if (not args.w and temp_out != args.i): os.remove(temp_out)#remove last tmp file
    delta_file = args.o + ".delta.txt"
    with open(delta_file, "w") as dt:
        with open(args.i, "r") as ft:#delta table creation
            for line in ft:
                km, count = line.split()
                count = int(count)
                i = freq = 0
                while(not freq):
                    mm = kmer.minimizer(args.l[i], km, hasher)
                    freq = bucket_tables[i][mm]
                    i += 1
                #sys.stderr.write("{}\n".format(count))
                #sys.stderr.write("{}\n".format(freq))
                dt.write("{} {}\n".format(km, abs(count - freq[0])))
    if(args.c):
        csf_tmp = get_random_name("bin")
        run_GOV3(delta_file, csf_tmp)
        delta_size = os.stat(csf_tmp).st_size
        os.remove(csf_tmp)
        with open(args.c, "a") as appfile:
            appfile.write("{},{},{},{},{}\n".format(k, '-'.join(map(str, args.l)), args.d, bucket_tables_csize, delta_size))
    

def main(args):
    if (args.command == "count"): return count_main(args)
    elif (args.command == "histo"): return histo_main(args)
    elif (args.command == "csf"): return csf_main(args)
    elif (args.command == "zipfian"): return zipfian_main(args)
    elif (args.command == "simulate"): return simulate_main(args)
    elif (args.command == "bloom"): return bloom_main(args)
    elif (args.command == "blfmm"): return blfmm_main(args)
    elif (args.command == "multim"): return multiple_main(args)
    else: sys.stderr.write("-h to list available subcommands\n")

def parser_init():
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("__default")
    subparsers = parser.add_subparsers(dest="command")

    parser_count = subparsers.add_parser("count", help="Count k-mers (can be replaced by KMC)")
    parser_count.add_argument("-i", help="input file (fasta or fastq) [stdin]", type=str)
    parser_count.add_argument("-o", help="output count table [stdout]", type=str)
    parser_count.add_argument("-k", help="k-mer length", type=int, required=True)

    parser_histo = subparsers.add_parser("histo", help="Compute histogram from k-mer counting table")
    parser_histo.add_argument("-i", help="counting table in input [stdin]", type=str)
    parser_histo.add_argument("-o", help="output file [stdout]", type=str)

    parser_zipfian = subparsers.add_parser("zipfian", help="Simulate data following a zipfian distribution")
    parser_zipfian.add_argument("-n", help="numer of draws", type=int, required=True)
    parser_zipfian.add_argument("-l", help="number of values to draw from", type=int, required=True)
    parser_zipfian.add_argument("-a", help="skew", type=float, required=True)

    parser_csf = subparsers.add_parser("csf", help="Construct a GV3 compressed static function from a counting table")
    parser_csf.add_argument("-i", help="counting table in input", type=str, required=True)
    parser_csf.add_argument("-o", help="output CSF", type=str, required=True)
    parser_csf.add_argument("-l", help="csv file to append results to", type=str, required=False)

    parser_simulate = subparsers.add_parser("simulate", help="Simulate multiple zipfian distributions with CSF compression")
    parser_simulate.add_argument("-n", help="number of draws (common for all runs)", type=int, required=True)
    parser_simulate.add_argument("-l", help="list of values for the number of labels to draw from", type=int, required=True, nargs='+')
    parser_simulate.add_argument("-a", help="list of different skew", type=float, required=True, nargs='+')
    parser_simulate.add_argument("-o", help="output CSV file with columns: <N, L, alpha, true L, H0, CSF size, bits per element> [stdout]")

    parser_bloom = subparsers.add_parser("bloom", help="Compress a counting table using a bloom filter + CSF")
    parser_bloom.add_argument("-i", help="counting table in input", type=str, required=True)
    parser_bloom.add_argument("-o", help="csv file to append to. Format: [k-mer length, optimal bloom size, size of CSF, number of FP]", type=str, required=True)
    parser_bloom.add_argument("-e", help="epsilon", type=float, required=False)
    parser_bloom.add_argument("-s", "--seed", help="random seed [42]", type=int, default=42)

    parser_blfmm = subparsers.add_parser("blfmm", help="Compress a counting table by minimizer bucketing + bloom filter (for the deltas) + CSF")
    parser_blfmm.add_argument("-i", help="counting table in input", type=str, required=True)
    parser_blfmm.add_argument("-o", help="csv file to append to. Format: [k-mer length, minimizer size, size of the buckets (CSF compressed), optimal bloom size, size of CSF, number of FP]", type=str, required=True)
    parser_blfmm.add_argument("-m", help="minimizer size", type=int, required=True)
    parser_blfmm.add_argument("-e", help="epsilon", type=float, required=False)
    parser_blfmm.add_argument("-s", "--seed", help="random seed [42]", type=int, default=42)

    multim_help = (
        "Build a minimizer frequency table based on (m, ..., k)-mers:\n" +
        "\tk is the k-mer length in the input frequency table,\n" +
        "\tm is the starting minimizer length,\n" +
        "\t... is a list of minimizer lengths between m and k used for recursively resolve collisions."
    )
    parser_multim = subparsers.add_parser("multim", help=multim_help)
    parser_multim.add_argument("-i", help="counting table in input", type=str, required=True)
    parser_multim.add_argument("-o", help="output file name prefix without extentions", type=str, required=True)
    parser_multim.add_argument("-d", help="maximum absolute approximation error", type=int, required=True)
    parser_multim.add_argument("-l", help="list of minimizer lengths to recursively try to solve collisions.", type=int, required=True, nargs='+')
    parser_multim.add_argument("-c", help="csf file to append to", type=str, required=False)
    parser_multim.add_argument("-w", help="working directory for the temporary files. If not specified all temporary files will be deleted", type=str, required=False)
    parser_multim.add_argument("-s", "--seed", help="random seed [42]", type=int, default=42)

    return parser

if __name__ == "__main__":
    parser = parser_init()
    args = parser.parse_args(sys.argv)
    main(args)