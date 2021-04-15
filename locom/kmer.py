import math

base_for = "ACGT"
base_rev = "TGCA"
comp_tab = str.maketrans(base_for, base_rev)

def smart_numeric_cast(s):
    def is_number(s: str):
        try:
            float(s)
            return True
        except ValueError:
            return False
    if is_number(s):
        n = float(s)
        if n.is_integer(): return int(s)#with large numbers casting float gives an approximation error, better to use the original string
        else: return n
    else:
        return s

def count(table: dict, k: int, seq: str, canonical: bool = True):
    l = len(seq)
    if l < k: return
    for i in range(l - k + 1):
        kmer = seq[i:(i+k)]
        if 'N' in kmer: continue
        if(canonical):
            kmer_rev = kmer.translate(comp_tab)[::-1]
            if kmer > kmer_rev: kmer = kmer_rev
        if kmer in table: table[kmer] += 1
        else: table[kmer] = 1

def length(obj, sep=' '):
    import io
    if isinstance(obj, str):
        return len(obj)
    elif isinstance(obj, io.TextIOWrapper):
        kmer, _ = obj.readline().split(sep)
        obj.seek(0)
        return len(kmer)
    else:
        raise TypeError("Cannot handle object of type {}".format(type(obj)))

def minimizer(m: int, seq: str, hasher):
    l = len(seq)
    if l < m: return None
    minh = math.inf
    mini = None
    for i in range(l - m + 1):
        hval = hasher(seq[i:(i+m)].encode())
        if minh > hval: 
            minh = hval
            mini = i
    return seq[mini:(mini+m)]

class Spectrum:
    
    def __init__(self):
        self.histogram = dict()
        
    def add(self, count: int):
        if count in self.histogram: self.histogram[count] += 1
        else: self.histogram[count] = 1

    def addFromDict(self, table: dict):
        for _, count in table.items():
            if count in self.histogram: self.histogram[count] += 1
            else: self.histogram[count] = 1

    def addFromFile(self, file, sep: str):
        if isinstance(file, str):
            file_handle = open(file, "r")
            close = True
        else: 
            file_handle = file
            close = False
        for line in file_handle:
            _, count = line.split(sep)
            count = smart_numeric_cast(count)
            if count in self.histogram: self.histogram[count] += 1
            else: self.histogram[count] = 1
        if close: file_handle.close()

    def empty(self):
        return not bool(self.histogram)

    def L0Norm(self):
        return sum(list(self.histogram.values()))

    def L1Norm(self):
        L1 = 0
        for k, v in self.histogram.items(): L1 += smart_numeric_cast(k) * smart_numeric_cast(v)
        return L1

    def entropy(self):
        #L1 = self.L1Norm()
        L0 = self.L0Norm()
        H0 = 0
        for _, column in self.histogram.items():
            p = column/L0
            H0 += -p*math.log(p,2)
        return H0

    def getMaxColumn(self):
        return max(list(self.histogram.values()))

    def getMaxCount(self):
        mcounts = list()
        colmax = self.getMaxColumn()
        for count, column in self.histogram.items():
            if column == colmax: mcounts.append(count)
        mcounts.sort()
        return mcounts[0]

    def getOptimalEpsilon(self):
        L0 = self.L0Norm()
        N = self.getMaxColumn()
        return (L0 - N) / N
        #if N == None:
        #    self.getMaxCount()
        #    N = self._L1light
        #L1 = self.L1Norm()
        #return N / (L1 - N)

    def getOptimizedEpsilon(self, c_csf: float):
        L0 = self.L0Norm()
        N = self.getMaxColumn()
        c_bf = 1/math.log(2)
        epsilon = c_bf/c_csf * ((L0 - N)/N) * math.log(math.e, 2)
        if epsilon == 0: epsilon = math.inf #raise RuntimeError("epsilon = 0 | L0 = {} | N = {} | c_csf = {}".format(L0, N, c_csf))
        return epsilon

    def removeCount(self, count: int):
        if count in self.histogram: 
            del self.histogram[count]

    """
    L1_light = 0
    max_labels = list()
    max_column = sp.getMaxColumn()
    for label, cc in histo.items():
        if cc == max_column: max_labels.append(label)
        else: L1_light += int(label) * cc
    heavy_element = sorted(max_labels)[0]
    """
