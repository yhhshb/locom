# locom
Compress k-mer counting tables using minimizers and Compressed Static Functions

# ATTENTION
As of now this repository is not neither production ready nor usable without fiddling around.
Code is written in python and needs a complete rewrite in C for performance improvements.

It is research code made public for reproducibility purposes (for those who know what is going on).
It will be likely replaced with a newer branch with better code.

Code is splitted into three different folders:
1. locom: the main program folder, as the name suggests
2. GV3: C code for query GV3 CSFs and perform time benchmarks.
3. Sux4JTest: Java program using GV3CompressedFunction from Sux4J package to build a CSF from a k-mer counting table (in txt format)
