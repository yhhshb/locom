## CSF

./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -b 0 -o dummy/output/Sakaik10_simple #--logging dummy/results/Sakaik10.log.txt
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -b 0 -o dummy/output/Sakaik11_simple #--logging dummy/results/Sakaik11.log.txt
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -b 0 -o dummy/output/Sakaik12_simple #--logging dummy/results/Sakaik12.log.txt
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -b 0 -o dummy/output/Sakaik13_simple #--logging dummy/results/Sakaik13.log.txt
./playground/locom/locom.py build -i dummy/Sakaik15.count.txt -r dummy/results/Sakaik15.csv -b 0 -o dummy/output/Sakaik15_simple #--logging dummy/results/Sakaik15.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -b 0 -o dummy/output/Sakaik18_simple #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -b 0 -o dummy/output/Sakaik21_simple #--logging dummy/results/Sakaik21.log.txt

./playground/locom/locom.py ttest -i dummy/Sakaik10.count.txt -r dummy/results/ -o dummy/output/Sakaik10_simple -s 50
./playground/locom/locom.py ttest -i dummy/Sakaik11.count.txt -r dummy/results/ -o dummy/output/Sakaik11_simple -s 50
./playground/locom/locom.py ttest -i dummy/Sakaik12.count.txt -r dummy/results/ -o dummy/output/Sakaik12_simple -s 50
./playground/locom/locom.py ttest -i dummy/Sakaik13.count.txt -r dummy/results/ -o dummy/output/Sakaik13_simple -s 50
./playground/locom/locom.py ttest -i dummy/Sakaik15.count.txt -r dummy/results/ -o dummy/output/Sakaik15_simple -s 50
./playground/locom/locom.py ttest -i dummy/Sakaik18.count.txt -r dummy/results/ -o dummy/output/Sakaik18_simple -s 50
./playground/locom/locom.py ttest -i dummy/Sakaik21.count.txt -r dummy/results/ -o dummy/output/Sakaik21_simple -s 50

## BCSF

./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -o dummy/output/Sakaik10_bcsf #--logging dummy/results/Sakaik10.log.txt
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -o dummy/output/Sakaik11_bcsf #--logging dummy/results/Sakaik11.log.txt
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -o dummy/output/Sakaik12_bcsf #--logging dummy/results/Sakaik12.log.txt
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -o dummy/output/Sakaik13_bcsf #--logging dummy/results/Sakaik13.log.txt
./playground/locom/locom.py build -i dummy/Sakaik15.count.txt -r dummy/results/Sakaik15.csv -o dummy/output/Sakaik15_bcsf #--logging dummy/results/Sakaik15.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -o dummy/output/Sakaik18_bcsf #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -o dummy/output/Sakaik21_bcsf #--logging dummy/results/Sakaik21.log.txt

./playground/locom/locom.py ttest -i dummy/Sakaik10.count.txt -r dummy/results/ -o dummy/output/Sakaik10_bcsf -s 50
./playground/locom/locom.py ttest -i dummy/Sakaik11.count.txt -r dummy/results/ -o dummy/output/Sakaik11_bcsf -s 50
./playground/locom/locom.py ttest -i dummy/Sakaik12.count.txt -r dummy/results/ -o dummy/output/Sakaik12_bcsf -s 50
./playground/locom/locom.py ttest -i dummy/Sakaik13.count.txt -r dummy/results/ -o dummy/output/Sakaik13_bcsf -s 50
./playground/locom/locom.py ttest -i dummy/Sakaik15.count.txt -r dummy/results/ -o dummy/output/Sakaik15_bcsf -s 50
./playground/locom/locom.py ttest -i dummy/Sakaik18.count.txt -r dummy/results/ -o dummy/output/Sakaik18_bcsf -s 50
./playground/locom/locom.py ttest -i dummy/Sakaik21.count.txt -r dummy/results/ -o dummy/output/Sakaik21_bcsf -s 50

## AMB 1 layer

./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -m 9 10 #--logging dummy/results/Sakaik10.log.txt
./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -m 8 10 #--logging dummy/results/Sakaik10.log.txt
./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -m 7 10 #--logging dummy/results/Sakaik10.log.txt
./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -m 6 10 #--logging dummy/results/Sakaik10.log.txt
./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -m 5 10 #--logging dummy/results/Sakaik10.log.txt
./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -m 4 10 #--logging dummy/results/Sakaik10.log.txt
./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -m 3 10 #--logging dummy/results/Sakaik10.log.txt
./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -m 2 10 #--logging dummy/results/Sakaik10.log.txt
./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -m 1 10 -o dummy/output/Sakaik10_1_amb #--logging dummy/results/Sakaik10.log.txt

./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -m 10 11 #--logging dummy/results/Sakaik11.log.txt
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -m 9 11 #--logging dummy/results/Sakaik11.log.txt
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -m 8 11 #--logging dummy/results/Sakaik11.log.txt
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -m 7 11 #--logging dummy/results/Sakaik11.log.txt
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -m 6 11 #--logging dummy/results/Sakaik11.log.txt
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -m 5 11 #--logging dummy/results/Sakaik11.log.txt
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -m 4 11 #--logging dummy/results/Sakaik11.log.txt
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -m 3 11 #--logging dummy/results/Sakaik11.log.txt
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -m 2 11 #--logging dummy/results/Sakaik11.log.txt
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -m 1 11 -o dummy/output/Sakaik11_1_amb #--logging dummy/results/Sakaik11.log.txt

./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -m 11 12 #--logging dummy/results/Sakaik12.log.txt
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -m 10 12 #--logging dummy/results/Sakaik12.log.txt
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -m 9 12 #--logging dummy/results/Sakaik12.log.txt
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -m 8 12 #--logging dummy/results/Sakaik12.log.txt
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -m 7 12 #--logging dummy/results/Sakaik12.log.txt
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -m 6 12 #--logging dummy/results/Sakaik12.log.txt
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -m 5 12 #--logging dummy/results/Sakaik12.log.txt
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -m 4 12 -o dummy/output/Sakaik12_4_amb #--logging dummy/results/Sakaik12.log.txt
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -m 3 12 #--logging dummy/results/Sakaik12.log.txt
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -m 2 12 #--logging dummy/results/Sakaik12.log.txt
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -m 1 12 #--logging dummy/results/Sakaik12.log.txt

./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -m 12 13 #--logging dummy/results/Sakaik13.log.txt
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -m 11 13 #--logging dummy/results/Sakaik13.log.txt
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -m 10 13 #--logging dummy/results/Sakaik13.log.txt
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -m 9 13 #--logging dummy/results/Sakaik13.log.txt
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -m 8 13 #--logging dummy/results/Sakaik13.log.txt
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -m 7 13 #--logging dummy/results/Sakaik13.log.txt
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -m 6 13 #--logging dummy/results/Sakaik13.log.txt
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -m 5 13 #--logging dummy/results/Sakaik13.log.txt
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -m 4 13 #--logging dummy/results/Sakaik13.log.txt
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -m 3 13 -o dummy/output/Sakaik13_3_amb #--logging dummy/results/Sakaik13.log.txt
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -m 2 13 #--logging dummy/results/Sakaik13.log.txt
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -m 1 13 #--logging dummy/results/Sakaik13.log.txt

./playground/locom/locom.py build -i dummy/Sakaik15.count.txt -r dummy/results/Sakaik15.csv -m 14 15 ##--logging dummy/results/Sakaik15.log.txt
./playground/locom/locom.py build -i dummy/Sakaik15.count.txt -r dummy/results/Sakaik15.csv -m 13 15 -o dummy/output/Sakaik15_13_amb #--logging dummy/results/Sakaik15.log.txt
./playground/locom/locom.py build -i dummy/Sakaik15.count.txt -r dummy/results/Sakaik15.csv -m 12 15 #--logging dummy/results/Sakaik15.log.txt
./playground/locom/locom.py build -i dummy/Sakaik15.count.txt -r dummy/results/Sakaik15.csv -m 11 15 #--logging dummy/results/Sakaik15.log.txt
./playground/locom/locom.py build -i dummy/Sakaik15.count.txt -r dummy/results/Sakaik15.csv -m 10 15 #--logging dummy/results/Sakaik15.log.txt
./playground/locom/locom.py build -i dummy/Sakaik15.count.txt -r dummy/results/Sakaik15.csv -m 9 15 #--logging dummy/results/Sakaik15.log.txt
./playground/locom/locom.py build -i dummy/Sakaik15.count.txt -r dummy/results/Sakaik15.csv -m 8 15 #--logging dummy/results/Sakaik15.log.txt

./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -m 17 18 #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -m 16 18 #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -m 15 18 #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -m 14 18 #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -m 13 18 -o dummy/output/Sakaik18_13_amb #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -m 12 18 #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -m 11 18 #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -m 10 18 #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -m 9 18 #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -m 8 18 #--logging dummy/results/Sakaik18.log.txt

./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 20 21 #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 19 21 #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 18 21 #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 17 21 #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 16 21 #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 15 21 #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 14 21 -o dummy/output/Sakaik21_14_amb #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 13 21 #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 12 21 #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 11 21 #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 10 21 #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 9 21 #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 8 21 #--logging dummy/results/Sakaik21.log.txt

./playground/locom/locom.py ttest -i dummy/Sakaik10.count.txt -r dummy/results/ -m 1 10 -o dummy/output/Sakaik10_1_amb -s 50
./playground/locom/locom.py ttest -i dummy/Sakaik11.count.txt -r dummy/results/ -m 1 11 -o dummy/output/Sakaik11_1_amb -s 50
./playground/locom/locom.py ttest -i dummy/Sakaik12.count.txt -r dummy/results/ -m 4 12 -o dummy/output/Sakaik12_4_amb -s 50
./playground/locom/locom.py ttest -i dummy/Sakaik13.count.txt -r dummy/results/ -m 3 13 -o dummy/output/Sakaik13_3_amb -s 50
./playground/locom/locom.py ttest -i dummy/Sakaik15.count.txt -r dummy/results/ -m 13 15 -o dummy/output/Sakaik15_13_amb -s 50
./playground/locom/locom.py ttest -i dummy/Sakaik18.count.txt -r dummy/results/ -m 13 18 -o dummy/output/Sakaik18_13_amb -s 50
./playground/locom/locom.py ttest -i dummy/Sakaik21.count.txt -r dummy/results/ -m 14 21 -o dummy/output/Sakaik21_14_amb -s 50

## AMB 2 layers

./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -m 1 9 10
./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -m 1 8 10
./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -m 1 7 10
./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -m 1 6 10
./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -m 1 5 10
./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -m 1 4 10
./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -m 1 3 10
./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -m 1 2 10 -o dummy/output/Sakaik10_1_2_amb

./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -m 1 10 11
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -m 1 9 11
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -m 1 8 11
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -m 1 7 11
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -m 1 6 11
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -m 1 5 11
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -m 1 4 11
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -m 1 3 11
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -m 1 2 11 -o dummy/output/Sakaik11_1_2_amb

./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -m 4 11 12
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -m 4 10 12
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -m 4 9 12
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -m 4 8 12
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -m 4 7 12
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -m 4 6 12
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -m 4 5 12 -o dummy/output/Sakaik12_4_5_amb

./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -m 3 12 13
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -m 3 11 13
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -m 3 10 13
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -m 3 9 13
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -m 3 8 13
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -m 3 7 13
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -m 3 6 13
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -m 3 5 13
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -m 3 4 13 -o dummy/output/Sakaik13_3_4_amb

./playground/locom/locom.py build -i dummy/Sakaik15.count.txt -r dummy/results/Sakaik15.csv -m 13 14 15 -o dummy/output/Sakaik15_13_14_amb #--logging dummy/results/Sakaik15.log.txt

./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -m 13 17 18 #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -m 13 16 18 #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -m 13 15 18 -o dummy/output/Sakaik18_13_15_amb #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -m 13 14 18 #--logging dummy/results/Sakaik18.log.txt

./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 14 20 21 #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 14 19 21 #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 14 18 21 #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 14 17 21 -o dummy/output/Sakaik21_14_17_amb #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 14 16 21 #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 14 15 21 #--logging dummy/results/Sakaik21.log.txt

./playground/locom/locom.py ttest -i dummy/Sakaik10.count.txt -r dummy/results/ -m 1 2 10 -o dummy/output/Sakaik10_1_2_amb -s 50
./playground/locom/locom.py ttest -i dummy/Sakaik11.count.txt -r dummy/results/ -m 1 2 11 -o dummy/output/Sakaik11_1_2_amb -s 50
./playground/locom/locom.py ttest -i dummy/Sakaik12.count.txt -r dummy/results/ -m 4 5 12 -o dummy/output/Sakaik12_4_5_amb -s 50
./playground/locom/locom.py ttest -i dummy/Sakaik13.count.txt -r dummy/results/ -m 3 4 13 -o dummy/output/Sakaik13_3_4_amb -s 50
./playground/locom/locom.py ttest -i dummy/Sakaik15.count.txt -r dummy/results/ -m 13 14 15 -o dummy/output/Sakaik15_13_14_amb -s 50
./playground/locom/locom.py ttest -i dummy/Sakaik18.count.txt -r dummy/results/ -m 13 15 18 -o dummy/output/Sakaik18_13_15_amb -s 50
./playground/locom/locom.py ttest -i dummy/Sakaik21.count.txt -r dummy/results/ -m 14 17 21 -o dummy/output/Sakaik21_14_17_amb -s 50

## AMB with deltas

./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -d 1 -m 1 10
./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -d 2 -m 1 10
./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -d 3 -m 1 10
./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -d 4 -m 1 10
./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -d 5 -m 1 10

./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -d 1 -m 1 11
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -d 2 -m 1 11
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -d 3 -m 1 11
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -d 4 -m 1 11
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -d 5 -m 1 11

./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -d 1 -m 4 12
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -d 2 -m 4 12
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -d 3 -m 4 12
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -d 4 -m 4 12
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -d 5 -m 4 12

./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -d 1 -m 3 13
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -d 2 -m 3 13
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -d 3 -m 3 13
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -d 4 -m 3 13
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -d 5 -m 3 13

./playground/locom/locom.py build -i dummy/Sakaik15.count.txt -r dummy/results/Sakaik15.csv -d 1 -m 13 15
./playground/locom/locom.py build -i dummy/Sakaik15.count.txt -r dummy/results/Sakaik15.csv -d 2 -m 13 15
./playground/locom/locom.py build -i dummy/Sakaik15.count.txt -r dummy/results/Sakaik15.csv -d 3 -m 13 15
./playground/locom/locom.py build -i dummy/Sakaik15.count.txt -r dummy/results/Sakaik15.csv -d 4 -m 13 15
./playground/locom/locom.py build -i dummy/Sakaik15.count.txt -r dummy/results/Sakaik15.csv -d 5 -m 13 15

./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -d 1 -m 13 18
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -d 2 -m 13 18
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -d 3 -m 13 18
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -d 4 -m 13 18
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -d 5 -m 13 18

./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -d 1 -m 14 21
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -d 2 -m 14 21
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -d 3 -m 14 21
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -d 4 -m 14 21
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -d 5 -m 14 21

./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -d 1 -m 1 2 10
./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -d 2 -m 1 2 10
./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -d 3 -m 1 2 10
./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -d 4 -m 1 2 10
./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -d 5 -m 1 2 10

./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -d 1 -m 1 2 11
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -d 2 -m 1 2 11
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -d 3 -m 1 2 11
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -d 4 -m 1 2 11
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -d 5 -m 1 2 11

./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -d 1 -m 4 5 12 #--logging dummy/results/Sakaik12.log.txt
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -d 2 -m 4 5 12 #--logging dummy/results/Sakaik12.log.txt
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -d 3 -m 4 5 12 #--logging dummy/results/Sakaik12.log.txt
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -d 4 -m 4 5 12 #--logging dummy/results/Sakaik12.log.txt
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -d 5 -m 4 5 12 #--logging dummy/results/Sakaik12.log.txt

./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -d 1 -m 3 4 13
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -d 2 -m 3 4 13
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -d 3 -m 3 4 13
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -d 4 -m 3 4 13
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -d 5 -m 3 4 13

./playground/locom/locom.py build -i dummy/Sakaik15.count.txt -r dummy/results/Sakaik15.csv -d 1 -m 13 14 15 #--logging dummy/results/Sakaik15.log.txt
./playground/locom/locom.py build -i dummy/Sakaik15.count.txt -r dummy/results/Sakaik15.csv -d 2 -m 13 14 15 #--logging dummy/results/Sakaik15.log.txt
./playground/locom/locom.py build -i dummy/Sakaik15.count.txt -r dummy/results/Sakaik15.csv -d 3 -m 13 14 15 #--logging dummy/results/Sakaik15.log.txt
./playground/locom/locom.py build -i dummy/Sakaik15.count.txt -r dummy/results/Sakaik15.csv -d 4 -m 13 14 15 #--logging dummy/results/Sakaik15.log.txt
./playground/locom/locom.py build -i dummy/Sakaik15.count.txt -r dummy/results/Sakaik15.csv -d 5 -m 13 14 15 #--logging dummy/results/Sakaik15.log.txt

./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -d 1 -m 13 15 18 #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -d 2 -m 13 15 18 #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -d 3 -m 13 15 18 #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -d 4 -m 13 15 18 #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -d 5 -m 13 15 18 #--logging dummy/results/Sakaik18.log.txt

./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -d 1 -m 14 18 21 #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -d 2 -m 14 18 21 #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -d 3 -m 14 18 21 #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -d 4 -m 14 18 21 #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -d 5 -m 14 18 21 #--logging dummy/results/Sakaik21.log.txt

## FIL 

./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -m 9 -d inf -c -j #--logging dummy/results/Sakaik11.log.txt
./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -m 8 -d inf -c -j #--logging dummy/results/Sakaik11.log.txt
./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -m 7 -d inf -c -j #--logging dummy/results/Sakaik11.log.txt
./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -m 6 -d inf -c -j #--logging dummy/results/Sakaik11.log.txt
./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -m 5 -d inf -c -j #--logging dummy/results/Sakaik11.log.txt
./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -m 4 -d inf -c -j #--logging dummy/results/Sakaik11.log.txt
./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -m 3 -d inf -c -j #--logging dummy/results/Sakaik11.log.txt
./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -m 2 -d inf -c -j #--logging dummy/results/Sakaik11.log.txt
./playground/locom/locom.py build -i dummy/Sakaik10.count.txt -r dummy/results/Sakaik10.csv -m 1 -d inf -c -j #--logging dummy/results/Sakaik11.log.txt

./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -m 10 -d inf -c -j #--logging dummy/results/Sakaik11.log.txt
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -m 9 -d inf -c -j #--logging dummy/results/Sakaik11.log.txt
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -m 8 -d inf -c -j #--logging dummy/results/Sakaik11.log.txt
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -m 7 -d inf -c -j #--logging dummy/results/Sakaik11.log.txt
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -m 6 -d inf -c -j #--logging dummy/results/Sakaik11.log.txt
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -m 5 -d inf -c -j #--logging dummy/results/Sakaik11.log.txt
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -m 4 -d inf -c -j #--logging dummy/results/Sakaik11.log.txt
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -m 3 -d inf -c -j #--logging dummy/results/Sakaik11.log.txt
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -m 2 -d inf -c -j #--logging dummy/results/Sakaik11.log.txt
./playground/locom/locom.py build -i dummy/Sakaik11.count.txt -r dummy/results/Sakaik11.csv -m 1 -d inf -c -j #--logging dummy/results/Sakaik11.log.txt

./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -m 11 -d inf -c -j #--logging dummy/results/Sakaik12.log.txt
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -m 10 -d inf -c -j #--logging dummy/results/Sakaik12.log.txt
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -m 9 -d inf -c -j #--logging dummy/results/Sakaik12.log.txt
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -m 8 -d inf -c -j #--logging dummy/results/Sakaik12.log.txt
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -m 7 -d inf -c -j #--logging dummy/results/Sakaik12.log.txt
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -m 6 -d inf -c -j #--logging dummy/results/Sakaik12.log.txt
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -m 5 -d inf -c -j #--logging dummy/results/Sakaik12.log.txt
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -m 4 -d inf -c -j #--logging dummy/results/Sakaik12.log.txt
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -m 3 -d inf -c -j #--logging dummy/results/Sakaik12.log.txt
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -m 2 -d inf -c -j #--logging dummy/results/Sakaik12.log.txt
./playground/locom/locom.py build -i dummy/Sakaik12.count.txt -r dummy/results/Sakaik12.csv -m 1 -d inf -c -j #--logging dummy/results/Sakaik12.log.txt

./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -m 12 -d inf -c -j #--logging dummy/results/Sakaik13.log.txt
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -m 11 -d inf -c -j #--logging dummy/results/Sakaik13.log.txt
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -m 10 -d inf -c -j #--logging dummy/results/Sakaik13.log.txt
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -m 9 -d inf -c -j #--logging dummy/results/Sakaik13.log.txt
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -m 8 -d inf -c -j #--logging dummy/results/Sakaik13.log.txt
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -m 7 -d inf -c -j #--logging dummy/results/Sakaik13.log.txt
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -m 6 -d inf -c -j #--logging dummy/results/Sakaik13.log.txt
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -m 5 -d inf -c -j #--logging dummy/results/Sakaik13.log.txt
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -m 4 -d inf -c -j #--logging dummy/results/Sakaik13.log.txt
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -m 3 -d inf -c -j #--logging dummy/results/Sakaik13.log.txt
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -m 2 -d inf -c -j #--logging dummy/results/Sakaik13.log.txt
./playground/locom/locom.py build -i dummy/Sakaik13.count.txt -r dummy/results/Sakaik13.csv -m 1 -d inf -c -j #--logging dummy/results/Sakaik13.log.txt

./playground/locom/locom.py build -i dummy/Sakaik15.count.txt -r dummy/results/Sakaik15.csv -m 14 -d inf -c -j #--logging dummy/results/Sakaik15.log.txt
./playground/locom/locom.py build -i dummy/Sakaik15.count.txt -r dummy/results/Sakaik15.csv -m 13 -d inf -c -j #--logging dummy/results/Sakaik15.log.txt
./playground/locom/locom.py build -i dummy/Sakaik15.count.txt -r dummy/results/Sakaik15.csv -m 12 -d inf -c -j #--logging dummy/results/Sakaik15.log.txt
./playground/locom/locom.py build -i dummy/Sakaik15.count.txt -r dummy/results/Sakaik15.csv -m 11 -d inf -c -j #--logging dummy/results/Sakaik15.log.txt
./playground/locom/locom.py build -i dummy/Sakaik15.count.txt -r dummy/results/Sakaik15.csv -m 10 -d inf -c -j #--logging dummy/results/Sakaik15.log.txt
./playground/locom/locom.py build -i dummy/Sakaik15.count.txt -r dummy/results/Sakaik15.csv -m 9 -d inf -c -j #--logging dummy/results/Sakaik15.log.txt
./playground/locom/locom.py build -i dummy/Sakaik15.count.txt -r dummy/results/Sakaik15.csv -m 8 -d inf -c -j #--logging dummy/results/Sakaik15.log.txt
./playground/locom/locom.py build -i dummy/Sakaik15.count.txt -r dummy/results/Sakaik15.csv -m 7 -d inf -c -j #--logging dummy/results/Sakaik15.log.txt
./playground/locom/locom.py build -i dummy/Sakaik15.count.txt -r dummy/results/Sakaik15.csv -m 6 -d inf -c -j #--logging dummy/results/Sakaik15.log.txt
./playground/locom/locom.py build -i dummy/Sakaik15.count.txt -r dummy/results/Sakaik15.csv -m 5 -d inf -c -j #--logging dummy/results/Sakaik15.log.txt
./playground/locom/locom.py build -i dummy/Sakaik15.count.txt -r dummy/results/Sakaik15.csv -m 4 -d inf -c -j #--logging dummy/results/Sakaik15.log.txt
./playground/locom/locom.py build -i dummy/Sakaik15.count.txt -r dummy/results/Sakaik15.csv -m 3 -d inf -c -j #--logging dummy/results/Sakaik15.log.txt
./playground/locom/locom.py build -i dummy/Sakaik15.count.txt -r dummy/results/Sakaik15.csv -m 2 -d inf -c -j #--logging dummy/results/Sakaik15.log.txt
./playground/locom/locom.py build -i dummy/Sakaik15.count.txt -r dummy/results/Sakaik15.csv -m 1 -d inf -c -j #--logging dummy/results/Sakaik15.log.txt

./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -m 17 -d inf -c -j #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -m 16 -d inf -c -j #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -m 15 -d inf -c -j #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -m 14 -d inf -c -j #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -m 13 -d inf -c -j #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -m 12 -d inf -c -j #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -m 11 -d inf -c -j #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -m 10 -d inf -c -j #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -m 9 -d inf -c -j #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -m 8 -d inf -c -j #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -m 7 -d inf -c -j #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -m 6 -d inf -c -j #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -m 5 -d inf -c -j #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -m 4 -d inf -c -j #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -m 3 -d inf -c -j #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -m 3 -d inf -c -j #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -m 2 -d inf -c -j #--logging dummy/results/Sakaik18.log.txt
./playground/locom/locom.py build -i dummy/Sakaik18.count.txt -r dummy/results/Sakaik18.csv -m 1 -d inf -c -j #--logging dummy/results/Sakaik18.log.txt

./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 20 -d inf -c -j #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 19 -d inf -c -j #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 18 -d inf -c -j #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 17 -d inf -c -j #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 16 -d inf -c -j #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 15 -d inf -c -j #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 14 -d inf -c -j #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 13 -d inf -c -j #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 12 -d inf -c -j #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 11 -d inf -c -j #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 10 -d inf -c -j #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 9 -d inf -c -j #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 8 -d inf -c -j #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 7 -d inf -c -j #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 6 -d inf -c -j #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 5 -d inf -c -j #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 4 -d inf -c -j #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 3 -d inf -c -j #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 2 -d inf -c -j #--logging dummy/results/Sakaik21.log.txt
./playground/locom/locom.py build -i dummy/Sakaik21.count.txt -r dummy/results/Sakaik21.csv -m 1 -d inf -c -j #--logging dummy/results/Sakaik21.log.txt