
"""
Very simple implementation of a Bloom Filter in pure python.
""" 

import math
import random

class BloomFilter:

    def __init__(self, N: int, epsilon: float, rndgen, hash_generator_x64):
        assert(epsilon > 0)
        assert(epsilon <=1)
        self.hashes = list()
        self.R = math.ceil(-math.log(epsilon, 2)) #number of hash functions
        self.seeds = [rndgen.randint(0, 2**31-1) for _ in range(self.R)]
        for seed in self.seeds: self.hashes.append(hash_generator_x64(seed))
        self.size = math.ceil(-(N*math.log(epsilon)) / math.log(2)**2) #bloom filter size (in bits)
        self.data = [False for _ in range(self.size)]
        self.filtered_value = None

    def __contains__(self, s: str):
        q = True
        i = 0
        while(q and i < self.R): 
            q = q and self.data[self.hashes[i](s.encode()) % self.size]
            i += 1
        #for h in self.hashes: q = q and self.data[h(s) % self.size]
        return q

    def add(self, s: str):
        for h in self.hashes:
            self.data[h(s.encode()) % self.size] = True

    def getBytesMemory(self):
        return math.ceil(self.size / 8)

    def setFilteredValue(self, val: int):
        self.filtered_value = val

    def dump(self, path: str):
        with open(path, "w") as dh:
            dh.write("{}\n".format(self.R))
            for seed in self.seeds: dh.write("{}\n".format(seed))
            dh.write("{}\n".format(self.size))
            dh.write("{}\n".format(self.filtered_value))
            for bit in self.data: dh.write("{}".format(int(bit)))
