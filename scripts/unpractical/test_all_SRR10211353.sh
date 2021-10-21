source ~/miniconda3/etc/profile.d/conda.sh
conda activate locom #activating locom environment with python=3.6.7 and pyhash from pip

## CSF

python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k10.count.txt -r tmp/dummy/results/SRR10211353k10.csv -b 0 -o tmp/dummy/output/SRR10211353k10_simple
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k11.count.txt -r tmp/dummy/results/SRR10211353k11.csv -b 0 -o tmp/dummy/output/SRR10211353k11_simple
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k12.count.txt -r tmp/dummy/results/SRR10211353k12.csv -b 0 -o tmp/dummy/output/SRR10211353k12_simple
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/SRR10211353k13.csv -b 0 -o tmp/dummy/output/SRR10211353k13_simple
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -b 0 -o tmp/dummy/output/SRR10211353k15_simple
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -b 0 -o tmp/dummy/output/SRR10211353k18_simple
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -b 0 -o tmp/dummy/output/SRR10211353k21_simple

python3 playground/locom/locom.py ttest -i tmp/dummy/SRR10211353k10.count.txt -r tmp/dummy/results/ -o tmp/dummy/output/SRR10211353k10_simple -s 50
python3 playground/locom/locom.py ttest -i tmp/dummy/SRR10211353k11.count.txt -r tmp/dummy/results/ -o tmp/dummy/output/SRR10211353k11_simple -s 50
python3 playground/locom/locom.py ttest -i tmp/dummy/SRR10211353k12.count.txt -r tmp/dummy/results/ -o tmp/dummy/output/SRR10211353k12_simple -s 50
python3 playground/locom/locom.py ttest -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/ -o tmp/dummy/output/SRR10211353k13_simple -s 50
python3 playground/locom/locom.py ttest -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/ -o tmp/dummy/output/SRR10211353k15_simple -s 50
python3 playground/locom/locom.py ttest -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/ -o tmp/dummy/output/SRR10211353k18_simple -s 50
python3 playground/locom/locom.py ttest -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/ -o tmp/dummy/output/SRR10211353k21_simple -s 50

## BCSF

python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k10.count.txt -r tmp/dummy/results/SRR10211353k10.csv -o tmp/dummy/output/SRR10211353k10_bcsf
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k11.count.txt -r tmp/dummy/results/SRR10211353k11.csv -o tmp/dummy/output/SRR10211353k11_bcsf
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k12.count.txt -r tmp/dummy/results/SRR10211353k12.csv -o tmp/dummy/output/SRR10211353k12_bcsf
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/SRR10211353k13.csv -o tmp/dummy/output/SRR10211353k13_bcsf
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -o tmp/dummy/output/SRR10211353k15_bcsf
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -o tmp/dummy/output/SRR10211353k18_bcsf
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -o tmp/dummy/output/SRR10211353k21_bcsf

python3 playground/locom/locom.py ttest -i tmp/dummy/SRR10211353k10.count.txt -r tmp/dummy/results/ -o tmp/dummy/output/SRR10211353k10_bcsf -s 50
python3 playground/locom/locom.py ttest -i tmp/dummy/SRR10211353k11.count.txt -r tmp/dummy/results/ -o tmp/dummy/output/SRR10211353k11_bcsf -s 50
python3 playground/locom/locom.py ttest -i tmp/dummy/SRR10211353k12.count.txt -r tmp/dummy/results/ -o tmp/dummy/output/SRR10211353k12_bcsf -s 50
python3 playground/locom/locom.py ttest -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/ -o tmp/dummy/output/SRR10211353k13_bcsf -s 50
python3 playground/locom/locom.py ttest -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/ -o tmp/dummy/output/SRR10211353k15_bcsf -s 50
python3 playground/locom/locom.py ttest -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/ -o tmp/dummy/output/SRR10211353k18_bcsf -s 50
python3 playground/locom/locom.py ttest -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/ -o tmp/dummy/output/SRR10211353k21_bcsf -s 50

## AMB 1 layer

python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k10.count.txt -r tmp/dummy/results/SRR10211353k10.csv -m 1 10
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k10.count.txt -r tmp/dummy/results/SRR10211353k10.csv -m 2 10
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k10.count.txt -r tmp/dummy/results/SRR10211353k10.csv -m 3 10
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k10.count.txt -r tmp/dummy/results/SRR10211353k10.csv -m 4 10
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k10.count.txt -r tmp/dummy/results/SRR10211353k10.csv -m 5 10
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k10.count.txt -r tmp/dummy/results/SRR10211353k10.csv -m 6 10
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k10.count.txt -r tmp/dummy/results/SRR10211353k10.csv -m 7 10
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k10.count.txt -r tmp/dummy/results/SRR10211353k10.csv -m 8 10
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k10.count.txt -r tmp/dummy/results/SRR10211353k10.csv -m 9 10

python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k11.count.txt -r tmp/dummy/results/SRR10211353k11.csv -m 1 11
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k11.count.txt -r tmp/dummy/results/SRR10211353k11.csv -m 2 11
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k11.count.txt -r tmp/dummy/results/SRR10211353k11.csv -m 3 11
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k11.count.txt -r tmp/dummy/results/SRR10211353k11.csv -m 4 11
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k11.count.txt -r tmp/dummy/results/SRR10211353k11.csv -m 5 11
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k11.count.txt -r tmp/dummy/results/SRR10211353k11.csv -m 6 11
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k11.count.txt -r tmp/dummy/results/SRR10211353k11.csv -m 7 11
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k11.count.txt -r tmp/dummy/results/SRR10211353k11.csv -m 8 11
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k11.count.txt -r tmp/dummy/results/SRR10211353k11.csv -m 9 11
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k11.count.txt -r tmp/dummy/results/SRR10211353k11.csv -m 10 11

python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k12.count.txt -r tmp/dummy/results/SRR10211353k12.csv -m 1 12
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k12.count.txt -r tmp/dummy/results/SRR10211353k12.csv -m 2 12
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k12.count.txt -r tmp/dummy/results/SRR10211353k12.csv -m 3 12
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k12.count.txt -r tmp/dummy/results/SRR10211353k12.csv -m 4 12
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k12.count.txt -r tmp/dummy/results/SRR10211353k12.csv -m 5 12
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k12.count.txt -r tmp/dummy/results/SRR10211353k12.csv -m 6 12
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k12.count.txt -r tmp/dummy/results/SRR10211353k12.csv -m 7 12
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k12.count.txt -r tmp/dummy/results/SRR10211353k12.csv -m 8 12
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k12.count.txt -r tmp/dummy/results/SRR10211353k12.csv -m 9 12
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k12.count.txt -r tmp/dummy/results/SRR10211353k12.csv -m 10 12
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k12.count.txt -r tmp/dummy/results/SRR10211353k12.csv -m 11 12

python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/SRR10211353k13.csv -m 1 13
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/SRR10211353k13.csv -m 2 13
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/SRR10211353k13.csv -m 3 13
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/SRR10211353k13.csv -m 4 13
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/SRR10211353k13.csv -m 5 13
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/SRR10211353k13.csv -m 6 13
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/SRR10211353k13.csv -m 7 13
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/SRR10211353k13.csv -m 8 13
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/SRR10211353k13.csv -m 9 13
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/SRR10211353k13.csv -m 10 13
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/SRR10211353k13.csv -m 11 13
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/SRR10211353k13.csv -m 12 13

python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -m 1 15
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -m 2 15
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -m 3 15
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -m 4 15
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -m 5 15
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -m 6 15
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -m 7 15
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -m 8 15
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -m 9 15
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -m 10 15
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -m 11 15 
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -m 12 15
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -m 13 15 
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -m 14 15 

python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 1 18
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 2 18
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 3 18
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 4 18
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 5 18
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 6 18
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 7 18
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 8 18
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 9 18
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 10 18
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 11 18
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 12 18
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 13 18
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 14 18
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 15 18
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 16 18
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 17 18

python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 1 21
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 2 21
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 3 21
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 4 21
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 5 21
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 6 21
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 7 21
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 8 21
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 9 21
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 10 21
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 11 21
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 12 21
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 13 21
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 14 21
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 15 21
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 16 21
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 17 21
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 18 21
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 19 21
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 20 21

# FIL 1 layer

python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k10.count.txt -r tmp/dummy/results/SRR10211353k10.csv -m 1 10
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k10.count.txt -r tmp/dummy/results/SRR10211353k10.csv -m 2 10
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k10.count.txt -r tmp/dummy/results/SRR10211353k10.csv -m 3 10
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k10.count.txt -r tmp/dummy/results/SRR10211353k10.csv -m 4 10
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k10.count.txt -r tmp/dummy/results/SRR10211353k10.csv -m 5 10
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k10.count.txt -r tmp/dummy/results/SRR10211353k10.csv -m 6 10
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k10.count.txt -r tmp/dummy/results/SRR10211353k10.csv -m 7 10
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k10.count.txt -r tmp/dummy/results/SRR10211353k10.csv -m 8 10
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k10.count.txt -r tmp/dummy/results/SRR10211353k10.csv -m 9 10

python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k11.count.txt -r tmp/dummy/results/SRR10211353k11.csv -m 1 11
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k11.count.txt -r tmp/dummy/results/SRR10211353k11.csv -m 2 11
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k11.count.txt -r tmp/dummy/results/SRR10211353k11.csv -m 3 11
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k11.count.txt -r tmp/dummy/results/SRR10211353k11.csv -m 4 11
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k11.count.txt -r tmp/dummy/results/SRR10211353k11.csv -m 5 11
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k11.count.txt -r tmp/dummy/results/SRR10211353k11.csv -m 6 11
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k11.count.txt -r tmp/dummy/results/SRR10211353k11.csv -m 7 11
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k11.count.txt -r tmp/dummy/results/SRR10211353k11.csv -m 8 11
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k11.count.txt -r tmp/dummy/results/SRR10211353k11.csv -m 9 11
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k11.count.txt -r tmp/dummy/results/SRR10211353k11.csv -m 10 11

python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k12.count.txt -r tmp/dummy/results/SRR10211353k12.csv -m 1 12
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k12.count.txt -r tmp/dummy/results/SRR10211353k12.csv -m 2 12
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k12.count.txt -r tmp/dummy/results/SRR10211353k12.csv -m 3 12
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k12.count.txt -r tmp/dummy/results/SRR10211353k12.csv -m 4 12
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k12.count.txt -r tmp/dummy/results/SRR10211353k12.csv -m 5 12
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k12.count.txt -r tmp/dummy/results/SRR10211353k12.csv -m 6 12
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k12.count.txt -r tmp/dummy/results/SRR10211353k12.csv -m 7 12
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k12.count.txt -r tmp/dummy/results/SRR10211353k12.csv -m 8 12
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k12.count.txt -r tmp/dummy/results/SRR10211353k12.csv -m 9 12
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k12.count.txt -r tmp/dummy/results/SRR10211353k12.csv -m 10 12
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k12.count.txt -r tmp/dummy/results/SRR10211353k12.csv -m 11 12

python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/SRR10211353k13.csv -m 1 13
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/SRR10211353k13.csv -m 2 13
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/SRR10211353k13.csv -m 3 13
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/SRR10211353k13.csv -m 4 13
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/SRR10211353k13.csv -m 5 13
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/SRR10211353k13.csv -m 6 13
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/SRR10211353k13.csv -m 7 13
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/SRR10211353k13.csv -m 8 13
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/SRR10211353k13.csv -m 9 13
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/SRR10211353k13.csv -m 10 13
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/SRR10211353k13.csv -m 11 13
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/SRR10211353k13.csv -m 12 13

python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -m 1 15
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -m 2 15
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -m 3 15
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -m 4 15
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -m 5 15
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -m 6 15
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -m 7 15
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -m 8 15
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -m 9 15
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -m 10 15
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -m 11 15 
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -m 12 15
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -m 13 15 
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -m 14 15 

python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 1 18
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 2 18
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 3 18
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 4 18
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 5 18
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 6 18
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 7 18
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 8 18
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 9 18
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 10 18
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 11 18
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 12 18
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 13 18
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 14 18
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 15 18
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 16 18
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 17 18

python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 1 21
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 2 21
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 3 21
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 4 21
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 5 21
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 6 21
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 7 21
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 8 21
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 9 21
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 10 21
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 11 21
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 12 21
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 13 21
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 14 21
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 15 21
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 16 21
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 17 21
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 18 21
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 19 21
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 20 21

# AMB 2 layers

python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k10.count.txt -r tmp/dummy/results/SRR10211353k10.csv -m 8 9 10
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k11.count.txt -r tmp/dummy/results/SRR10211353k11.csv -m 8 9 10 11
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k12.count.txt -r tmp/dummy/results/SRR10211353k12.csv -m 9 10 11 12
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/SRR10211353k13.csv -m 10 11 12 13
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -m 12 13 14 15
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 15 16 17 18
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 15 16 17 21

# FIL 2 layers

python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k10.count.txt -r tmp/dummy/results/SRR10211353k10.csv -m 8 9 10
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k11.count.txt -r tmp/dummy/results/SRR10211353k11.csv -m 8 9 10 11
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k12.count.txt -r tmp/dummy/results/SRR10211353k12.csv -m 9 10 11 12
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/SRR10211353k13.csv -m 10 11 12 13
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -m 12 13 14 15
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -m 15 16 17 18
python3 playground/locom/locom.py fil -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -m 15 16 17 21

# AMB 1 layer + delta != 0

python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k10.count.txt -r tmp/dummy/results/SRR10211353k10.csv -d 1 -m 9 10
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k10.count.txt -r tmp/dummy/results/SRR10211353k10.csv -d 2 -m 9 10
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k10.count.txt -r tmp/dummy/results/SRR10211353k10.csv -d 3 -m 9 10
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k10.count.txt -r tmp/dummy/results/SRR10211353k10.csv -d 4 -m 9 10
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k10.count.txt -r tmp/dummy/results/SRR10211353k10.csv -d 5 -m 9 10

python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k11.count.txt -r tmp/dummy/results/SRR10211353k11.csv -d 1 -m 10 11
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k11.count.txt -r tmp/dummy/results/SRR10211353k11.csv -d 2 -m 10 11
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k11.count.txt -r tmp/dummy/results/SRR10211353k11.csv -d 3 -m 10 11
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k11.count.txt -r tmp/dummy/results/SRR10211353k11.csv -d 4 -m 10 11
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k11.count.txt -r tmp/dummy/results/SRR10211353k11.csv -d 5 -m 10 11

python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k12.count.txt -r tmp/dummy/results/SRR10211353k12.csv -d 1 -m 11 12
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k12.count.txt -r tmp/dummy/results/SRR10211353k12.csv -d 2 -m 11 12
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k12.count.txt -r tmp/dummy/results/SRR10211353k12.csv -d 3 -m 11 12
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k12.count.txt -r tmp/dummy/results/SRR10211353k12.csv -d 4 -m 11 12
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k12.count.txt -r tmp/dummy/results/SRR10211353k12.csv -d 5 -m 11 12

python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/SRR10211353k13.csv -d 1 -m 12 13
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/SRR10211353k13.csv -d 2 -m 12 13
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/SRR10211353k13.csv -d 3 -m 12 13
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/SRR10211353k13.csv -d 4 -m 12 13
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k13.count.txt -r tmp/dummy/results/SRR10211353k13.csv -d 5 -m 12 13

python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -d 1 -m 14 15
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -d 2 -m 14 15
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -d 3 -m 14 15
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -d 4 -m 14 15
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k15.count.txt -r tmp/dummy/results/SRR10211353k15.csv -d 5 -m 14 15

python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -d 1 -m 15 18
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -d 2 -m 15 18
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -d 3 -m 15 18
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -d 4 -m 15 18
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k18.count.txt -r tmp/dummy/results/SRR10211353k18.csv -d 5 -m 15 18

python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -d 1 -m 16 21
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -d 2 -m 16 21
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -d 3 -m 16 21
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -d 4 -m 16 21
python3 playground/locom/locom.py build -i tmp/dummy/SRR10211353k21.count.txt -r tmp/dummy/results/SRR10211353k21.csv -d 5 -m 16 21
