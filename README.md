`locom`:Compressing k-mer count tables through minimizers and Compressed Static Functions
=========

`locom` is a `CSF`-based algorithm for efficiently represent k-mer counts.

## Rationale

Similar to MPHFs (Minimal Perfect Hash Functions) `locom` ignores k-mers and it only provides a map between each k-mer and its frequency.
Because the set of k-mers is usually known (from the input sequences), and there are many specialized methods supporting presence/absence queries, the fact of not having the actual k-mers inside the mapping is hardly a problem in practice.

`locom` augments the current available implementation of CSF with:
1. Bloom Filters to deal with very skewed distributions: CSF -> BCSF
2. minimizers to bucket similar counts together and reduce space further

## Dependencies

* pyhash (https://pypi.org/project/pyhash/)
* Sux4J (https://github.com/vigna/Sux4J) through `maven`

## Installation
1. Clone the repository `git clone https://www.github.com/yhhshb/locom`
2. `cd locom`
3. `make`

## Discalimer

In our paper (to appear in WABI) we presented two algorithms, FIL and AMB. AMB is the most efficient of the two and the following instructions will focus on it.

Note that in the paper we used AMB with infinite delta and majority rule to implement FIL with 2 layers. 
A more specialized version of FIL, supporting more than 2 layers can be constructed with (`locom.py fil`) but it is still worse than the much simpler AMB so no utility to measure time/queries is provided.

## Input

`locom` takes a single k-mer count table in text format in input. Each line must contain a single k-mer with its integer counter value. The separator can be a single space, comma or tabulation.

## Output

One (B)CSF (bloom filter + CSF) for each layer.

## Quickstart

Build count table from file.fa using k=21:

`locom.py count -i file.fa -o table.count.txt -k 21`

Build an exact AMB map from table using minimizer lengths [13, 14, 15]:

`locom.py build -i table.count.txt -o basename -r results.csv -m 13 14 15 21`

Test the constructed map, output a time histogram with buckets of span 50 ns:

`locom.py ttest -i table.count.txt -o basename -r results.csv -m 13 14 15 21 -s 50`

### Important things to note

* One must put k as the last minimizer length to be able to retrieve all the counters.
* By default build outputs an exact map.
* ttest has the same syntax as build with the only addition of option -s
* ttest reports the min,avg,max errors across all k-mers. For an exact build, they are all 0.

## Main commands

* Get help `locom.py -h`
* Construct a k-mer count table from a Fasta file: `locom.py count -i <input.fa> -o <table.count.txt> -k <k-mer length>`
* Construct a document frequency table from multiple fasta files: `locom.py dfcount -i <input1.fa> <input2.fa> ... <inputN.fa> -o <dftable.count.txt> -k <k-mer length>`
* Construct a GV3 CSF from count table `locom.py gv3 -i <input.count.txt> -o <output.csf.bin> -r <results.csv>`
* Build AMB-compressed map: `locom.py build -i <input.count.txt> -o <basename> -r <results.csv> -m <m1> <m2> ... <mn> -d <delta>`
* Build FIL-compressed map: `locom.py fil -i <input.count.txt> -o <basename> -r <results.csv> -m <m1> <m2> ... <mn>`
* test query time `locom.py ttest -i <input.count.txt> -o <basename> -r <output folder> -s <bucket size of the time histograms> -m <m1> <m2> ... <mn>`

## Additional commands

* Compute k-mer histogram from a k-mer count table: `locom.py histo -i <input.count.txt> -o <output.histo.txt>`
* Simulate zipfian: `locom.py zipfian -n <samples> -l <number of labels to draw from> -a <skew> > simtable.count.txt`
* Apply GV3 on multiple simulated zipfians: `locom.py -N <samples> -l <list of labels to draw from> -a <list of skews> -o <results.csv>`

## Code structure overview

`locom` is made of three major components:

1. A Java [module](Sux4JTest/src/main/java/dnacsf/CSFTest.java) using the Compressed Static Function Implementation found in the package Sux4J [1].
2. The python [script](locom.py) implementing our algorithms.
3. A simple C [utility](GV3/test_locom_speed.c) for querying our data structure and to measure time.

Note that both the Java and C programs are called from inside locom.py which provide the main interface.


