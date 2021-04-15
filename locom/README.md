# Frequency table compression through minimizer locality

This project is a proof-of-concept (POC) written in python3.
It should be run only on small input files because it is not optimized.

## Dependencies

python3 (obviously)
pyhash

To install pyhash with pip3:

```sh
pip3 install pyhash
```

## Idea

The goal of this method is to group k-mers together by their minimizer similarly to what KMC or DSK already do.
Instead of using this binning procedure to swap bins between primary and secondary memory to save RAM,
here we only save the (maximum? average?) of the frequencies in each of the bins.
Hopefully, k-mers with similar frequencies will end up in the same bucket.
Outliers will be handled separately by tuning the error-memory trade-off.

## Usage

To build a 11-mer counting table from a file named myfasta.fa:
```sh
locom.py count -k 11 -i myfasta.fa -o counts.txt
```

To bucket each 11-mer frequency inside the buckets of 8-mer minimizers:
```sh
locom.py mgroup -m 8 -i counts.txt -o buckets.txt
```

It is possible to replace each list of frequencies with a representative value:
```sh
locom.py collapse -i buckets.txt -o collapsed.txt
```
By default the collapsing is made by average but a max option is also available:
```sh
locom.py collapse -d max -i buckets.txt -o collapsed.txt
```

Finally, to compute the collapsing error:
```sh
locom.py check -i counts.txt -b collapsed.txt
```

Additionally, to compute a histogram of a counting table:
```sh
locom.py histo -i counts.txt -o histo.txt
```

## First phase

Implement the minimizer bucketing algorithm. DONE
Look at the frequency sets into each bucket (number of different frequencies, other statistics). DONE
Compute errors for replacing a set with a representative value (max or avg). DONE

As expected for large ks it kind of works but for smaller ks it doesn't.