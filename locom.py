#!/usr/bin/python3

import os
import sys
import math
import string
import random
import operator
import shutil
import subprocess
import pyhash

import kmer
import bloom
from kmer import smart_numeric_cast #quick hack
from readfq import readfq
from ZipfGenerator import ZipfGenerator

pwd = os.path.dirname(os.path.realpath(__file__))
parent = os.path.dirname(pwd)

GV3 = "Sux4JTest/target/Sux4JTest-0.0.1-jar-with-dependencies.jar"
TT3 = "GV3/test_locom_speed"
jar_exec = os.path.join(pwd, GV3)
speed_exec = os.path.join(pwd, TT3)

def run_GOV3(ifile: str, ofile: str):
    out = subprocess.run(["java", "-jar", jar_exec, ifile, ofile], stdout = subprocess.PIPE, stderr = sys.stderr)
    if (out.returncode != 0): raise RuntimeError("problem with GOV3")

def run_time_test(th, components: list):
    out = subprocess.Popen([speed_exec] + components, stdin = th, stdout = subprocess.PIPE, stderr = subprocess.PIPE)
    #if (out.returncode != 0): raise RuntimeError("problem with speed test")
    return out

def get_random_name(extension: str, size=20, chars=string.ascii_uppercase + string.digits):
    return ''.join(random.choice(chars) for _ in range(size)) +'.'+extension

def isempty(file: str):
    try:
        with open(file, "r") as csvh:
            csvh.seek(0, os.SEEK_END)
            if not csvh.tell(): write_header = True
            else: write_header = False
    except FileNotFoundError as e:
        write_header = True
    return write_header

policies = ["minimum", "majority"]

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

def countpa_main(args):
    import gzip
    assert(len(args.input) < 63)
    df_table = dict()
    i = 0
    for fxfile in args.input:
        if (fxfile and fxfile.endswith(".gz")): fd = gzip.open(fxfile, "rt")
        elif fxfile: fd = open(fxfile, "r")
        else: raise ValueError("stdin input not supported")
        dummy_table = dict()
        for _, seq, _ in readfq(fd): kmer.count(dummy_table, args.k, seq, False)
        fd.close()
        for km, _ in dummy_table.items():
            paval = int(2**i)
            if km in df_table and df_table[km] < paval: df_table[km] += paval
            else: df_table[km] = paval
        i += 1
    if (args.output): fd = open(args.output, "w")
    else: fd = sys.stdout
    for k, v in df_table.items(): fd.write("{} {}\n".format(k, v))
    fd.close()

def countdf_main(args):
    import gzip
    assert(len(args.input) < 63)
    df_table = dict()
    for fxfile in args.input:
        if (fxfile and fxfile.endswith(".gz")): fd = gzip.open(fxfile, "rt")
        elif fxfile: fd = open(fxfile, "r")
        else: raise ValueError("stdin input not supported")
        dummy_table = dict()
        for _, seq, _ in readfq(fd): kmer.count(dummy_table, args.k, seq, False)
        fd.close()
        for km, _ in dummy_table.items():
            if km in df_table: df_table[km] += 1
            else: df_table[km] = 1
    if (args.output): fd = open(args.output, "w")
    else: fd = sys.stdout
    for k, v in df_table.items(): fd.write("{} {}\n".format(k, v))
    fd.close()

def histo_main(args):
    if (args.i and args.t): raise RuntimeError("Options -i and -t are incompatible to each other")
    if args.t:
        fd = open(args.t, "r")
        sp = kmer.Spectrum()
        for line in fd:
            line = line.strip()
            if line:
                cval, count = line.split(args.sep)
                sp.histogram[smart_numeric_cast(cval)] = smart_numeric_cast(count)
        fd.close()
    else:
        if (args.i): fd = open(args.i, "r")
        else: fd = sys.stdin
        sp = kmer.Spectrum()
        sp.addFromFile(fd, args.sep)
        fd.close()
    sys.stderr.write("entropy: {} | tail sum: {} | head sum: {}\n".format(sp.entropy(), sp.L0Norm() - sp.getMaxColumn(), sp.getMaxColumn()))
    keys = sorted(list(sp.histogram.keys()))
    if (args.o): fd = open(args.o, "w")
    else: fd = sys.stdout
    for key in keys: fd.write("{} {}\n".format(key, sp.histogram[key]))

def csf_main(args):
    run_GOV3(args.input, args.output)
    if (args.result):
        csf_size = os.stat(args.output).st_size
        sp = kmer.Spectrum()
        with open(args.input, "r") as th:
            k = kmer.length(th)
            sp.addFromFile(th, args.sep)
        H0 = sp.entropy()
        L0 = sp.L0Norm()
        write_header = isempty(args.result)
        with open(args.result, "a") as csvh:
            if write_header: csvh.write("k,epsilon,L0,total_size\n")
            csvh.write("{},{},{},{}\n".format(k, H0, L0, csf_size * 8 / sp.L0Norm()))

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
    csf_size_bits = csf_size*8/N
    os.remove(zipf_tmp)
    os.remove(csf_tmp)
    #epsilon = (1.44/csf_size_bits) * sp.getOptimalEpsilon()
    #bfok = ((1.0 - math.log(epsilon, 2)) * epsilon) < 1
    return "{},{},{},{},{},{},{}".format(N, L, alpha, len(histo), round(H0,2), csf_size, round(csf_size_bits, 2))

def simulate_bloom_filter(N: int, L: int, alpha: float):#FIXME UNUSED
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
    epsilon = sp.getOptimalEpsilon()
    light_items = sp.L0Norm() - sp.getMaxColumn()
    blf = bloom.BloomFilter(light_items, epsilon, random.Random(), pyhash.murmur3_x64_128)
    blf_size = blf.getBytesMemory()
    blf_size_bits = blf_size * 8 / light_items
    return "{},{},{},{},{},{},{}".format(N, L, alpha, len(histo), round(H0,2), blf_size, round(blf_size_bits, 2))

def simulate_csf_main(args):
    fo = open(args.o, "w") if args.o else sys.stdout
    fo.write("N,L,alpha,TL,H0,size,bpe\n")
    for alpha in args.a:
        for nl in args.l:
            fo.write("{}\n".format(simulate_csf(args.n, nl, alpha)))
    fo.close()

class MinBucketArray:
    def __init__(self, delta):
        self.buckets = dict()
        self.delta = delta

    def add(self, value: int, minimizer: str):
        if minimizer in self.buckets:
            bval = self.buckets[minimizer]
            if (bval != None):
                bval[0] = min(bval[0], value)
                bval[1] = max(bval[1], value)
                if (bval[1] - bval[0] > self.delta): self.buckets[minimizer] = None
                else: self.buckets[minimizer] = bval
        else: self.buckets[minimizer] = [value, value]
    
    def finalize(self):
        for key in self.buckets.keys():
            if self.buckets[key]:
                self.buckets[key] = self.buckets[key][0]
            else:
                self.buckets[key] = 0

class MajorityBucketArray:
    def __init__(self, delta):
        self.buckets = dict()
        self.delta = delta

    def _majority(self, bucket: list):
        histo = dict()
        mam = mim = bucket[0]
        for elem in bucket:
            mim = min(mim, elem)
            mam = max(mam, elem)
            if elem in histo: histo[elem] += 1
            else: histo[elem] = 1
        if (mam - mim > self.delta): return 0
        else: return max(histo.items(), key=operator.itemgetter(1))[0]

    def add(self, value: int, minimizer: str):
        if minimizer in self.buckets: self.buckets[minimizer].append(value)
        else: self.buckets[minimizer] = [value]
    
    def finalize(self):
        for key in self.buckets.keys(): self.buckets[key] = self._majority(self.buckets[key])

def build_bucket_layer(input_table: str, bucket_table: str, filtered_table: str, sep: str, m: int, delta: int, hasher, majority, difference_table_handle):
    """Constructs a single minimizer bucketing layer for the given input counting table.

    Representatives are chosen as the minimum value in each non colliding bucket
    """
    kmcount = 0
    if majority: barray = MajorityBucketArray(delta)
    else: barray = MinBucketArray(delta)
    with open(input_table, "r") as ith:
        for line in ith:#bucketing
            km, count = line.split(sep)
            mm = kmer.minimizer(m, km, hasher)
            count = int(count)
            barray.add(count, mm)
            kmcount += 1
        barray.finalize()

        ith.seek(0)
        with open(filtered_table, "w") as oth:#filtering
            for line in ith:
                km, count = line.split(sep)
                mm = kmer.minimizer(m, km, hasher)
                count = int(count)
                if(barray.buckets[mm] == 0):#k-mer pass to the next layer
                    oth.write("{}{}{}\n".format(km, sep, count))
                elif difference_table_handle:#save correction factor to the final catch-all table
                    diff = count-barray.buckets[mm]
                    difference_table_handle.write("{}{}{}\n".format(km, sep, diff if diff >= 0 else (diff + 2**63-1)))
    bucket_spectrum = kmer.Spectrum()
    with open(bucket_table, "w") as bth:#save bucket table
        for mm, representative in barray.buckets.items():
            if(representative):
                bth.write("{}{}{}\n".format(mm, sep, representative))
                bucket_spectrum.add(representative)
            else:
                bth.write("{}{}{}\n".format(mm, sep, 0))
                bucket_spectrum.add(0)
    return kmcount, bucket_spectrum

def estimate_csf_space(entropy: float):
    if 0 <= entropy < 2: return 0.22101251*(entropy**2) + 0.18137832*entropy + 1.16503358
    elif 2 <= entropy: return entropy + 0.1*int(entropy) + 0.2
    else: raise ValueError("entropy cannot be negative")

#NOTE recursively constructing multiple bloom filters doesn't help because 1 is always the most abundant frequency
def csf_compress(table_name: str, csf_basename: str, sep: str, seed: int, bloom_layers: int, spectrum: kmer.Spectrum = None):
    """Compress a counting table using its entropy to decide between Simple CSF or Bloom Filter + CSF.

    In case of Bloom Filter + CSF epsilon is automatically chosen to minimize their aggregate memory.
    """
    if not spectrum:
        spectrum = kmer.Spectrum()
        spectrum.addFromFile(table_name, sep)
    if spectrum.empty(): return 0, 0, [], None

    gen = random.Random()
    gen.seed(seed)
    if not csf_basename:
        cleanup = True
        csf_basename = get_random_name("")
    else:
        cleanup = False
    tmp_name = table_name
    out_name = table_name

    entropy = spectrum.entropy()
    c_csf = estimate_csf_space(entropy)
    epsilon = spectrum.getOptimizedEpsilon(c_csf)

    layer_index = 0
    blf_total_memory = 0
    heavy_elements = list()
    while (epsilon < 1 and layer_index < bloom_layers): #(1 - math.log(epsilon)) * epsilon < 1
        #sys.stderr.write("{}\n".format(spectrum.histogram))
        light_items = spectrum.L0Norm() - spectrum.getMaxColumn()
        blf = bloom.BloomFilter(light_items, epsilon, gen, pyhash.xx_64)
        out_name = get_random_name("txt")
        heavy_element = spectrum.getMaxCount()
        blf.setFilteredValue(heavy_element)
        heavy_elements.append(heavy_element)
        collisions = 0
        with open(out_name, "w") as toh:
            with open(tmp_name, "r") as tih:#populating bloom filter and filtering
                for line in tih:
                    km, count = line.split(sep)
                    count = smart_numeric_cast(count)
                    if count != heavy_element:#add light items to bloom filter
                        toh.write("{}{}{}\n".format(km, sep, count))
                        blf.add(km)
            spectrum.removeCount(heavy_element)#remove heaviest element from the spectrum
            with open(tmp_name, "r") as tih:#false positives
                for line in tih:
                    km, count = line.split(sep)
                    count = smart_numeric_cast(count)
                    if count == heavy_element and (km in blf):#check heavy items only for collisions
                        spectrum.add(count)#re-add heavy element to the spectrum
                        toh.write("{}{}{}\n".format(km, sep, count))#save it in the collision table
                        collisions += 1
        if not cleanup:
            bloom_name = csf_basename + ".{}.bloom.txt".format(layer_index)
            blf.dump(bloom_name)
        blf_size = blf.getBytesMemory()
        #sys.stderr.write("layer: {} | epsilon: {} | heavy frequency: {} | bloom filter size: {}\n".format(layer_index, epsilon, heavy_element, blf_size))
        entropy = spectrum.entropy()
        c_csf = estimate_csf_space(entropy)
        epsilon = spectrum.getOptimizedEpsilon(c_csf)
        if tmp_name != table_name: os.remove(tmp_name)
        tmp_name = out_name
        blf_total_memory += blf_size
        layer_index += 1
    
    csf_name = csf_basename + ".csf.bin"
    run_GOV3(out_name, csf_name)
    if out_name != table_name: os.remove(out_name)
    csf_size = os.stat(csf_name).st_size
    if cleanup: os.remove(csf_name)
    #sys.stderr.write("Effective number of bloom filters: {} | CSF size: {}\n".format(layer_index, csf_size))
    #sys.stderr.write("bloom filter memory = {}, CSF memory = {}\n".format(blf_total_memory, csf_size))
    return blf_total_memory, csf_size, heavy_elements, epsilon

def build_main(args):
    """Compress a k-mer counting table by frequency locality and CSF
    locom.py build -i <input> -o <basename> -r <results.csv>                                             ---- "Bloom + CSF" method
    locom.py build -i <input> -o <basename> -r <results.csv> -d <max error> -m <m0, m1, m2, ..., k>      ---- "multiple" method
    locom.py build -i <input> -o <basename> -r <results.csv> -d <max error> -m <m0, m1, m2, ..., (mf<k)> ---- "multiple" but with "Bloom + CSF" as final layer
    locom.py build -i <input> -o <basename> -r <results.csv> -d inf -m <m> -c -j                         ---- "mm + Bloom" method
    """
    assert args.opt_layers < 2
    assert args.bloom_layers < 2
    if not args.output and not args.result: return #No output required
    if args.delta == "inf": args.delta = math.inf
    else: args.delta = smart_numeric_cast(args.delta)
    args.minimizers.sort()
    size_of_buckets = 0

    norms = list()
    remelem = list()
    if args.minimizers:
        temp_input_table_name = args.input
        temp_output_table_name = get_random_name("count.txt")
        final_table_name = get_random_name("diff.txt")
        mmhash = pyhash.xx_64(args.seed)
        with open(final_table_name, "w") as fth:
            for m in args.minimizers:
                bucket_table_name = args.output + ".m{}.txt".format(m) if args.output else get_random_name("m{}.txt".format(m))
                if args.correct: L0, sp = build_bucket_layer(temp_input_table_name, bucket_table_name, temp_output_table_name, args.sep, m, args.delta, mmhash, args.majority, fth)
                else: L0, sp = build_bucket_layer(temp_input_table_name, bucket_table_name, temp_output_table_name, args.sep, m, args.delta, mmhash, args.majority, None)
                norms.append(L0)
                #sys.stderr.write("m = {}: ".format(m))
                blf_total_memory, csf_size, hel, _ = csf_compress(bucket_table_name, args.output + ".m{}".format(m) if args.output else None, args.sep, args.seed, args.opt_layers, sp)
                bucket_size = blf_total_memory + csf_size
                remelem.append(hel)
                if not args.keep:
                    os.remove(bucket_table_name)
                    if temp_input_table_name != args.input: os.remove(temp_input_table_name)
                temp_input_table_name = temp_output_table_name
                temp_output_table_name = get_random_name("count.txt")
                size_of_buckets += bucket_size
        
        if (args.correct):#concatenate remaining k-mers to diff table
            with open(final_table_name, "ab") as fth:
                with open(temp_input_table_name, "rb") as kth:
                    shutil.copyfileobj(kth, fth)
            if not args.keep and temp_input_table_name != args.input: os.remove(temp_input_table_name)
        else:#we discard the (empty) difference file
            if not args.keep: os.remove(final_table_name)
            final_table_name = temp_input_table_name
    else:
        final_table_name = args.input
    
    sp = kmer.Spectrum()
    sp.addFromFile(final_table_name, args.sep)
    nofk = norms[0] if norms else sp.L0Norm()
    #sys.stderr.write("difference layer: ")
    blf_total_memory, csf_size, hel, _ = csf_compress(final_table_name, args.output, args.sep, args.seed, args.bloom_layers, sp)#NOTE: sp is passed by REFERENCE (because, ugh, python). csf_compress() could modify the histogram
    final_table_size = blf_total_memory + csf_size
    remelem.append(hel)
    if not args.keep and final_table_name != args.input: os.remove(final_table_name)

    if args.logging:
        with open(args.logging, "a") as log:
            log.write("{}\n".format(remelem))

    if args.result:
        with open(args.input, "r") as tbh: k = kmer.length(tbh, args.sep)
        mmlengths = '-'.join(map(str, args.minimizers)) if args.minimizers else '0'
        size_of_buckets_bits = size_of_buckets * 8 / nofk
        final_table_size_bits = final_table_size * 8 / nofk
        total_size_bpe = (size_of_buckets + final_table_size) * 8 / nofk
        write_header = isempty(args.result)

        with open(args.result, "a") as csvh:
            if write_header: csvh.write("k,minimizers,delta,correct,opt_layers,majority,bloom_layers,buckets_size,blcsf_size,total_size\n")
            csvh.write("{},{},{},{},{},{},{},{},{},{}\n".format(k, mmlengths, args.delta, args.correct, args.opt_layers, args.majority, args.bloom_layers, size_of_buckets_bits, final_table_size_bits, total_size_bpe))

def test_xxhash_main(args):
    hashers = [pyhash.xx_64(s) for s in args.seed]
    with open(args.output, "w") as toh:
        with open(args.input, "r") as tih:
            for line in tih:
                km, count = line.split(args.sep)
                hvals = [str(hasher(km.encode())) for hasher in hashers]
                toh.write(','.join(hvals) + '\n')

def test_speed_main(args):
    import io
    args.minimizers.sort()

    components = list()
    for m in args.minimizers:
        basename = args.output + ".m{}".format(m)
        blf_name = basename + ".0.bloom.txt"
        cbt = basename + ".csf.bin"
        components.append(blf_name if os.path.isfile(blf_name) else "-")
        components.append(cbt)
    blf_name = args.output + ".0.bloom.txt"
    cbt = args.output + ".csf.bin"
    if(os.path.isfile(cbt)):#last layer if exists
        components.append(blf_name if os.path.isfile(blf_name) else "-")
        components.append(cbt)
    nchannels = smart_numeric_cast(len(components)/2*3) + 1
    hist_channels = [dict() for _ in range(nchannels)]
    stat_channels = [[2**64-1, 0, 0] for _ in range(nchannels)]
    MIN, AVG, MAX = [0, 1, 2]
    line_count = 0
    
    with open(args.input, "r") as tih:
        proc = run_time_test(tih, components)
        for line in io.TextIOWrapper(proc.stdout, encoding="utf-8"):
            measurements = line.strip().split(',')
            for i in range(nchannels):
                measurement = smart_numeric_cast(measurements[i])
                bucket = int(measurement / args.bsize) * args.bsize
                if bucket in hist_channels[i]: hist_channels[i][bucket] += 1
                else: hist_channels[i][bucket] = 1
                if(measurement < stat_channels[i][MIN]): stat_channels[i][MIN] = measurement
                stat_channels[i][AVG] += measurement
                if(measurement > stat_channels[i][MAX]): stat_channels[i][MAX] = measurement
            line_count += 1
    for col in stat_channels:
        col[AVG] = round(col[AVG]/line_count)

    out_prefix = os.path.basename(args.output.strip('/'))
    res_folder = os.path.join(args.result, out_prefix)
    try: os.makedirs(res_folder)
    except FileExistsError: pass
    layer_types = ["hash", "bloom", "csf"]
    with open(os.path.join(res_folder, "stats.csv"), "w") as sh:
        sh.write("layer,min,avg,max\n")
        i = 0
        for m in args.minimizers:
            for prefix in layer_types:
                sh.write("{},{}\n".format("{}_{}".format(prefix, m), ','.join(map(str, stat_channels[i]))))
                i += 1
        if len(stat_channels) - i == 4:
            for prefix in layer_types:
                sh.write("{},{}\n".format("{}_{}".format(prefix, "final"), ','.join(map(str, stat_channels[i]))))
                i += 1
        sh.write("{},{}\n".format("total", ','.join(map(str, stat_channels[i]))))

    i = 0
    for m in args.minimizers:
        for prefix in layer_types:
            with open(os.path.join(res_folder, "{}_{}.csv".format(prefix, m)), "w") as hh:
                hh.write("t,val\n")
                rows = map(lambda pair: "{},{}".format(pair[0],pair[1]), sorted(hist_channels[i].items(), key=lambda item: item[0]))
                hh.write('\n'.join(rows))
                hh.write('\n')
            i += 1
    if len(hist_channels) - i == 4:
        for prefix in layer_types:
            with open(os.path.join(res_folder, "{}_{}.csv".format(prefix, "final")), "w") as hh:
                hh.write("t,val\n")
                rows = map(lambda pair: "{},{}".format(pair[0],pair[1]), sorted(hist_channels[i].items(), key=lambda item: item[0]))
                hh.write('\n'.join(rows))
                hh.write('\n')
            i += 1
    with open(os.path.join(res_folder, "total.csv"), "w") as hh:
        hh.write("t,val\n")
        rows = map(lambda pair: "{},{}".format(pair[0],pair[1]), sorted(hist_channels[i].items(), key=lambda item: item[0]))
        hh.write('\n'.join(rows))
        hh.write('\n')

    for line in io.TextIOWrapper(proc.stderr, encoding="utf-8"):
        dmin, davg, dmax = line.strip().split(',')
        sys.stderr.write("{},{},{}\n".format(int(dmin), round(float(davg), 2), int(dmax)))

def test_mm_bucketing(args):
    MINIMUM = policies[0]
    MAJORITY = policies[1]
    hasher = pyhash.xx_64(args.seed)
    if args.policy == MINIMUM: barray = MinBucketArray(0)
    elif args.policy == MAJORITY: barray = MajorityBucketArray(math.inf)
    else: raise ValueError("Error: unrecognized policy")
    input_spectrum = kmer.Spectrum()
    with open(args.input, "r") as ith:
        for line in ith:
            km, count = line.split(args.sep)
            mm = kmer.minimizer(args.minimizer, km, hasher)
            count = int(count)
            input_spectrum.add(count)
            barray.add(count, mm)
    if args.dump:
        with open(args.dump, "w") as dh:
            for mm, counts in barray.buckets.items():
                dh.write("{} -> {}\n".format(mm, counts))
    barray.finalize()
    bucket_spectrum = kmer.Spectrum()
    for _, bval in barray.buckets.items(): bucket_spectrum.add(bval)
    passing_spectrum = kmer.Spectrum()
    ambiguous_minimizers = set()
    with open(args.input, "r") as ith:
        for line in ith:
            km, count = line.split(args.sep)
            mm = kmer.minimizer(args.minimizer, km, hasher)
            count = int(count)
            estimate = barray.buckets[mm]
            if(count != estimate):#k-mer pass to the next layer
                passing_spectrum.add(count-estimate)
                ambiguous_minimizers.add(mm)

    total_number_of_kmers = input_spectrum.L0Norm()
    input_entropy = input_spectrum.entropy()
    number_of_buckets = number_of_minimizers = bucket_spectrum.L0Norm()
    number_of_ambiguous_buckets = number_of_ambiguous_minimizers = len(ambiguous_minimizers)
    bucket_entropy = bucket_spectrum.entropy()
    first_csf_be_size = estimate_csf_space(bucket_entropy)
    first_csf_bit_size = first_csf_be_size * number_of_buckets
    total_number_of_passing_kmers = passing_spectrum.L0Norm()
    passing_entropy = passing_spectrum.entropy()
    sys.stdout.write("Method: --> ")
    if args.policy == MINIMUM: sys.stdout.write("AMB")
    elif args.policy == MAJORITY: sys.stdout.write("FIL")
    sys.stdout.write(' <--\n')
    sys.stdout.write("Total number of k-mers (n): {}\n".format(total_number_of_kmers))
    sys.stdout.write("\twith entropy: {}\n".format(round(input_entropy, 5)))
    sys.stdout.write("Number of buckets (minimizers): {}\n".format(number_of_buckets))
    sys.stdout.write("\tof which ambiguous: {}\n".format(number_of_ambiguous_buckets))
    sys.stdout.write("\twith entropy: {}\n".format(round(bucket_entropy, 5)))
    sys.stdout.write("Estimated size of first CSF: {} bits/element (= {} bits in total)\n".format(round(first_csf_be_size, 4), round(first_csf_bit_size, 2)))
    sys.stdout.write("Number of propagated k-mers by the first bucket array (p): {} (number of filtered k-mers (n-p): {})\n".format(total_number_of_passing_kmers, total_number_of_kmers - total_number_of_passing_kmers))
    sys.stdout.write("\twith entropy: {}\n".format(round(passing_entropy, 5)))
    il_blf_bit_size = 0
    if args.policy == MAJORITY:
        alpha = (total_number_of_kmers - total_number_of_passing_kmers) / total_number_of_kmers
        il_bf_epsilon = (1.0 - alpha) / alpha
        il_blf = bloom.BloomFilter(total_number_of_passing_kmers, il_bf_epsilon, random.Random(), pyhash.xx_64)
        il_blf_bit_size = il_blf.getBytesMemory() * 8
        approx_passing_kmers = total_number_of_passing_kmers + (total_number_of_kmers - total_number_of_passing_kmers) * il_bf_epsilon
        passing_spectrum.histogram[0] = int((total_number_of_kmers - total_number_of_passing_kmers) * il_bf_epsilon)
        total_number_of_passing_kmers = passing_spectrum.L0Norm()
        passing_entropy = passing_spectrum.entropy()
        #for count, column in input_spectrum.histogram.items():
        #    to_add = round(column * il_bf_epsilon)
        #    if to_add > 0:
        #        if count in passing_spectrum.histogram: passing_spectrum.histogram[count] += to_add
        #        else: passing_spectrum.histogram[count] = to_add
        sys.stdout.write("alpha = {}{}\n".format(round(alpha, 4), "" if alpha >= 0.5 else " (Warning, alpha < 0.5)"))
        sys.stdout.write("epsilon = {}\n".format(il_bf_epsilon))
        sys.stdout.write("bloom filter size = {}\n".format(il_blf_bit_size))
        #sys.stdout.write("[DEBUG] ({}, {})\n".format(approx_passing_kmers, total_number_of_kmers - approx_passing_kmers))
        sys.stdout.write("Number of propagated k-mers by the bloom filter = {} (number of filtered k-mers by bloom filter = {})\n".format(total_number_of_passing_kmers, total_number_of_kmers - total_number_of_passing_kmers))
        sys.stdout.write("\twith entropy: {}\n".format(round(passing_entropy, 5)))
    second_csf_be_size = estimate_csf_space(passing_entropy)
    second_csf_bit_size = second_csf_be_size * total_number_of_passing_kmers
    sys.stdout.write("Estimated size of second CSF: {} bits/element (= {} bits in total)\n".format(round(second_csf_be_size, 4), round(second_csf_bit_size, 2)))
    total_bit_size = first_csf_bit_size + il_blf_bit_size + second_csf_bit_size
    total_be_size = total_bit_size / total_number_of_kmers
    sys.stdout.write("Total space = {} bits/element ({} bits in total)\n".format(round(total_be_size, 4), round(total_bit_size, 2)))

def fil_main(args):
    if not args.output and not args.result: return #No output required
    if not args.minimizers: return
    args.minimizers.sort()
    gen = random.Random()
    gen.seed(args.seed)
    hasher = pyhash.xx_64(args.seed)
    spectrum = kmer.Spectrum()
    input_table = args.input
    spectrum.addFromFile(input_table, args.sep)
    nofk = spectrum.L0Norm()
    if args.dbg: sys.stderr.write("Total number of k-mers: {}, with entropy: {}\n".format(nofk, spectrum.entropy()))
    infos = list()
    i = 0
    while(not spectrum.empty()):
        m = args.minimizers[i]
        filtered_table = get_random_name("count.txt")
        barray = MajorityBucketArray(math.inf)
        number_of_kmers = 0
        with open(input_table, "r") as ith:
            for line in ith:#bucketing
                km, count = line.split(args.sep)
                mm = kmer.minimizer(m, km, hasher)
                count = int(count)
                barray.add(count, mm)
                number_of_kmers += 1
            barray.finalize()
            ith.seek(0)
            spectrum = kmer.Spectrum()
            colliding_minimizers = set()
            with open(filtered_table, "w") as oth:#filtering
                for line in ith:
                    km, count = line.split(args.sep)
                    mm = kmer.minimizer(m, km, hasher)
                    count = int(count)
                    if(count != barray.buckets[mm]):#k-mer pass to the next layer
                        spectrum.add(count)
                        oth.write("{}{}{}\n".format(km, args.sep, count-barray.buckets[mm]))
                        if args.dbg:
                            colliding_minimizers.add(mm)
            if(not spectrum.empty()):
                alpha = (number_of_kmers - spectrum.L0Norm()) / number_of_kmers
                if alpha > 1 or alpha < 0: raise RuntimeError("unbounded alpha: alpha = "+str(alpha))
                epsilon = (1.0-alpha) / alpha
                if epsilon > 1: epsilon = 1
                if epsilon < 0: raise RuntimeError("epsilon < 0")
                blf = bloom.BloomFilter(spectrum.L0Norm(), epsilon, gen, pyhash.xx_64)
                with open(filtered_table, "r") as fth:
                    for line in fth:
                        km, _ = line.split(args.sep)
                        blf.add(km)
                ith.seek(0)
                with open(filtered_table, "a") as fth:
                    for line in ith: #ith is the original input table, do not change it!
                        km, count = line.split(args.sep)
                        mm = kmer.minimizer(m, km, hasher)
                        count = int(count)
                        if(count == barray.buckets[mm] and (km in blf)):
                            fth.write("{}{}{}\n".format(km, args.sep, count-barray.buckets[mm]))
                if args.output:
                    blf.dump(args.output + ".m{}.bloom.txt".format(m))

        bucket_spectrum = kmer.Spectrum()
        bucket_table = args.output + ".m{}.txt".format(m) if args.output else get_random_name("m{}.txt".format(m))
        with open(bucket_table, "w") as bth:#save bucket table
            for mm, representative in barray.buckets.items():
                bth.write("{}{}{}\n".format(mm, args.sep, representative))
                bucket_spectrum.add(representative)
        bfs, csfs, jvals, beps = csf_compress(bucket_table, args.output + ".m{}".format(m) if args.output else None, args.sep, args.seed, 1, bucket_spectrum)
        bsize = bfs + csfs
        if not args.keep: os.remove(bucket_table)
        if not args.keep and input_table != args.input: os.remove(input_table)
        input_table = filtered_table
        infos.append((bsize, blf.getBytesMemory() if not spectrum.empty() else 0, alpha))
        if args.dbg:
            sys.stderr.write("Number of buckets for layer m={}: {}\n\tof which ambiguous: {}.\n\tentropy = {}\n\tepsilon = {}\n\tCSF majority values: {}\n\tbloom size = {} bytes\n\tcsf size = {} bytes\n".format(m, bucket_spectrum.L0Norm(), len(colliding_minimizers), bucket_spectrum.entropy(), beps, jvals, bfs, csfs))
            if not spectrum.empty(): sys.stderr.write("inter-layer bloom filter:\n\tNumber of k-mers = {}\n\talpha = {}\n\tepsilon = {}\n\tsize = {} bits\n".format(spectrum.L0Norm(), alpha, epsilon, blf.getBytesMemory()*8))
        i = i + 1
    if input_table != args.input: os.remove(input_table)
    total_size = 0
    size_of_buckets = 0
    final_table_size = 0
    for ba_size, blf_size, _ in infos:
        size_of_buckets += ba_size
        total_size += ba_size + blf_size
    if args.result:
        with open(args.input, "r") as tbh: k = kmer.length(tbh, args.sep)
        mmlengths = '-'.join(map(str, args.minimizers)) if args.minimizers else '0'
        size_of_buckets_bits = size_of_buckets * 8 / nofk
        final_table_size_bits = final_table_size * 8 / nofk
        total_size_bpe = total_size * 8 / nofk
        write_header = isempty(args.result)

        with open(args.result, "a") as csvh:
            if write_header: csvh.write("k,minimizers,delta,correct,opt_layers,majority,bloom_layers,buckets_size,blcsf_size,total_size\n")
            csvh.write("{},{},{},{},{},{},{},{},{},{}\n".format(k, mmlengths, "inf", True, 1, True, 1, size_of_buckets_bits, final_table_size_bits, total_size_bpe))
            #rh.write("{},{},{}\n".format(str(infos), total_size, total_size_bpe))
            

def main(args):
    if (args.command == "count"): return count_main(args)
    elif (args.command == "pacount"): return countpa_main(args)
    elif (args.command == "dfcount"): return countdf_main(args)
    elif (args.command == "histo"): return histo_main(args)
    elif (args.command == "csf"): return csf_main(args)
    elif (args.command == "zipfian"): return zipfian_main(args)
    elif (args.command == "simulate"): return simulate_csf_main(args)
    elif (args.command == "build"): return build_main(args)
    elif (args.command == "xxhash"): return test_xxhash_main(args)
    elif (args.command == "ttest"): return test_speed_main(args)
    elif (args.command == "mtest"): return test_mm_bucketing(args)
    elif (args.command == "fil"): return fil_main(args)
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

    parser_countpa = subparsers.add_parser("pacount", help="Assign presence/absence to each k-mer")
    parser_countpa.add_argument("--input", "-i", help="input files (fasta or fastq)", type=str, nargs='+', required=True)
    parser_countpa.add_argument("--output", "-o", help="output count table, each k-mer has a number where its ith bit corresponds to the ith file in input [stdout]", type=str)
    parser_countpa.add_argument("-k", help="k-mer length", type=int, required=True)

    parser_countdf = subparsers.add_parser("dfcount", help="Count document frequency of each k-mer")
    parser_countdf.add_argument("--input", "-i", help="input files (fasta or fastq)", type=str, nargs='+', required=True)
    parser_countdf.add_argument("--output", "-o", help="output count table, with each k-mer having its df count [stdout]", type=str)
    parser_countdf.add_argument("-k", help="k-mer length", type=int, required=True)

    parser_histo = subparsers.add_parser("histo", help="Compute histogram from k-mer counting table")
    parser_histo.add_argument("-i", help="counting table in input [stdin]", type=str)
    parser_histo.add_argument("-o", help="output file [stdout]", type=str)
    parser_histo.add_argument("--sep", "-s", help="separator used to separate k-mers from counters in the input file [space]", type=str, default=' ')
    parser_histo.add_argument("-t", help="input from al already computed histogram", type=str)

    parser_zipfian = subparsers.add_parser("zipfian", help="Simulate data following a zipfian distribution")
    parser_zipfian.add_argument("-n", help="numer of draws", type=int, required=True)
    parser_zipfian.add_argument("-l", help="number of values to draw from", type=int, required=True)
    parser_zipfian.add_argument("-a", help="skew", type=float, required=True)

    parser_csf = subparsers.add_parser("gv3", help="Construct a GV3 compressed static function from a counting table")
    parser_csf.add_argument("--input", "-i", help="counting table in input", type=str, required=True)
    parser_csf.add_argument("--output", "-o", help="output CSF", type=str, required=True)
    parser_csf.add_argument("--result", "-r", help="csv file to append results to", type=str, required=False)
    parser_csf.add_argument("--sep", "-s", help="separator used to separate k-mers from counters in the input file [space]", type=str, default=' ')

    parser_simulate = subparsers.add_parser("simulate", help="Simulate multiple zipfian distributions with CSF compression")
    parser_simulate.add_argument("-n", help="number of draws (common for all runs)", type=int, required=True)
    parser_simulate.add_argument("-l", help="list of values for the number of labels to draw from", type=int, required=True, nargs='+')
    parser_simulate.add_argument("-a", help="list of different skews", type=float, required=True, nargs='+')
    parser_simulate.add_argument("-o", help="output CSV file with columns: <N, L, alpha, true L, H0, CSF size, bits per element> [stdout]")

    parser_build = subparsers.add_parser("build", help="Compress a k-mer counting table")
    parser_build.add_argument("--input", "-i", help="counting table in input", type=str, required=True)
    parser_build.add_argument("--output", "-o", help="basename for all output files. You might want to use --result option if you don't need output files", type=str, required=False)
    parser_build.add_argument("--result", "-r", help="CSV file to append the results to", type=str, required=False)
    parser_build.add_argument("--minimizers", "-m", help="minimizer list to be used for recursive bucketing [0]", type=int, nargs='+', default=[])
    parser_build.add_argument("--delta", "-d", help="maximum absolute error allowed in each bucket [0]", type=str, default=0)
    parser_build.add_argument("--correct", "-c", help="store correction factors inside the final compressed structure [disabled by default]", action="store_true")
    parser_build.add_argument("--opt_layers", "-p", help="maximum number of bloom filters used for optimising the bucket storage [1]", type=int, default=1)
    parser_build.add_argument("--majority", "-j", help="activate representative by majority vote in each bucket [disabled by default]", action="store_true")
    parser_build.add_argument("--bloom_layers", "-b", help="maximum number of bloom filters for compressing the filter table [1]", type=int, default=1)
    parser_build.add_argument("--sep", help="separator used to separate k-mers from counters in the input file [space]", type=str, default=' ')
    parser_build.add_argument("--seed", help="random seed [42]", type=int, default=42)
    parser_build.add_argument("--keep", help="keep all intermidiate files [disabled by default]", action="store_true")
    parser_build.add_argument("--logging", help="log additional information to file", type=str)

    parser_test_xxhash = subparsers.add_parser("xxhash", help="test xxhash by computing hash value for each k-mer in table")
    parser_test_xxhash.add_argument("--input", "-i", help="counting table in input", type=str, required=True)
    parser_test_xxhash.add_argument("--output", "-o", help="output file", type=str, required=True)
    parser_test_xxhash.add_argument("--seed", help="random seed [42]", type=int, nargs='+', required=True)
    parser_test_xxhash.add_argument("--sep", help="separator used to separate k-mers from counters in the input file [space]", type=str, default=' ')

    parser_time_test = subparsers.add_parser("ttest", help="test compressed structure and measure time")
    parser_time_test.add_argument("--input", "-i", help="counting table in input", type=str, required=True)
    parser_time_test.add_argument("--output", "-o", help="basename for all output files given to the build command", type=str, required=False)
    parser_time_test.add_argument("--result", "-r", help="folder where to create a new folder named after the output to save all statistics", type=str, required=True)
    parser_time_test.add_argument("--bsize", "-s", help="bucket size for time histograms", type=int, required=True)
    parser_time_test.add_argument("--minimizers", "-m", help="minimizer list used for recursive bucketing", type=int, nargs='+', default=[])
    parser_time_test.add_argument("--sep", help="separator used to separate k-mers from counters in the input file [space]", type=str, default=' ')
    parser_time_test.add_argument("--seed", help="random seed [42]. ATTENTION: currently unused, using seeds different from 42 produce untestable results.", type=int, default=42)

    parser_mm_bucketing = subparsers.add_parser("mtest", help="test minimizer bucketing statistics")
    parser_mm_bucketing.add_argument("--input", "-i", help="counting table in input", type=str, required=True)
    parser_mm_bucketing.add_argument("--dump", "-u", help="dump each bucket explicitly", type=str)
    parser_mm_bucketing.add_argument("--minimizer", "-m", help="minimizer length used for bucketing", type=int, required=True)
    parser_mm_bucketing.add_argument("--policy", "-p", help="bucketing policy {}".format(policies), type=str, required=True)
    parser_mm_bucketing.add_argument("--sep", help="separator used to separate k-mers from counters in the input file [space]", type=str, default=' ')
    parser_mm_bucketing.add_argument("--seed", help="random seed [42]", type=int, default=42)

    parser_fil = subparsers.add_parser("fil", help="Compress a k-mer counting table")
    parser_fil.add_argument("--input", "-i", help="counting table in input", type=str, required=True)
    parser_fil.add_argument("--output", "-o", help="basename for all output files. You might want to use --result option if you don't need output files", type=str, required=False)
    parser_fil.add_argument("--result", "-r", help="CSV file to append the results to", type=str, required=False)
    parser_fil.add_argument("--minimizers", "-m", help="minimizer list to be used for recursive bucketing [0]", type=int, nargs='+', default=[])
    parser_fil.add_argument("--sep", help="separator used to separate k-mers from counters in the input file [space]", type=str, default=' ')
    parser_fil.add_argument("--seed", help="random seed [42]", type=int, default=42)
    parser_fil.add_argument("--keep", help="keep all intermidiate files [disabled by default]", action="store_true")
    parser_fil.add_argument("--logging", help="log additional information to file", type=str)
    parser_fil.add_argument("--dbg", help="print everything for debugging", action="store_true")

    return parser

if __name__ == "__main__":
    parser = parser_init()
    args = parser.parse_args(sys.argv)
    main(args)