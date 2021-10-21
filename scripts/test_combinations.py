import sys
import subprocess

locom = "./playground/locom/locom.py"
def run_amb(input_file: str, output_file: str, results_file: str, minimizers: list, delta: int, sep: str, seed: int):
    input_opt = ["-i", input_file]
    output_opt = ["-o", output_file] if output_file else []
    results_opt = ["-r", results_file] if results_file else []
    minimizers_opt = ["-m"] + list(map(str, minimizers))
    delta_opt = ["-d", str(delta)]
    sep_opt = ["--sep", sep]
    seed_opt = ["--seed", str(seed)]
    out = subprocess.run([locom, "build"] + input_opt + output_opt + results_opt + minimizers_opt + delta_opt + sep_opt + seed_opt, stdout=sys.stdout, stderr=sys.stderr)
    if out.returncode != 0: raise RuntimeError("locom build failed")

def run_fil(input_file: str, output_file: str, results_file: str, minimizers: list, sep: str, seed: int):
    input_opt = ["-i", input_file]
    output_opt = ["-o", output_file] if output_file else []
    results_opt = ["-r", results_file] if results_file else []
    minimizers_opt = ["-m"] + list(map(str, minimizers))
    sep_opt = ["--sep", sep]
    seed_opt = ["--seed", str(seed)]
    out = subprocess.run([locom, "fil"] + input_opt + output_opt + results_opt + minimizers_opt + sep_opt + seed_opt, stdout=sys.stdout, stderr=sys.stderr)
    if out.returncode != 0: raise RuntimeError("locom fil failed")

def amb2l(lengths: list, name: str):
    print("Starting 2 Layer AMB for ", name)
    for k in lengths:
        for m in range(1, k):
            table_name = "{}k{}.count.txt".format(name, k)
            result_name = "{}.csv".format(name)
            run_amb(table_name, "", result_name, [m, k], 0, ' ', 42)
        print("finished processing k = " + str(k))

def amb3l(lengths: list, name: str, lb0: int = 1, lb1d: int = 1):
    print("Starting 3 Layer AMB for ", name)
    for k in lengths:
        for m0 in range(lb0, k-1):
            if m0 > lb0: lb1d = 1 # activate shift only for first run (resume function)
            for m1 in range(m0+lb1d, k):
                table_name = "{}k{}.count.txt".format(name, k)
                result_name = "{}.csv".format(name)
                run_amb(table_name, "", result_name, [m0, m1, k], 0, ' ', 42)
        print("finished processing k = " + str(k))

def fil2l(lengths: list, name: str):
    print("Starting 2 Layer FIL for ", name)
    for k in lengths:
        for m in range(1, k):
            table_name = "{}k{}.count.txt".format(name, k)
            result_name = "{}.csv".format(name)
            run_fil(table_name, "", result_name, [m, k], ' ', 42)
        print("finished processing k = " + str(k))

def fil3l(lengths: list, name: str, lb0: int = 1, lb1d: int = 1):
    print("Starting 3 Layer FIL for ", name)
    for k in lengths:
        for m0 in range(lb0, k-1):
            if m0 > lb0: lb1d = 1 # activate shift only for first run (resume function)
            for m1 in range(m0+lb1d, k):
                table_name = "{}k{}.count.txt".format(name, k)
                result_name = "{}.csv".format(name)
                run_fil(table_name, "", result_name, [m0, m1, k], ' ', 42)
        print("finished processing k = " + str(k))

sakai = "dummy/Sakai"
mixture = "dummy/mixture"
dfcoli = "dummy/df"
ks = [10, 11, 12, 13, 15, 18, 21]

#amb2l(ks, sakai)
#amb3l(ks, sakai)
#fil2l(ks, sakai)
#fil3l(ks, sakai)

#amb2l(ks, mixture)
#amb3l(ks, mixture)
#fil2l(ks, mixture)
#fil3l(ks, mixture)

#amb2l(ks, dfcoli)
amb3l([21], dfcoli, 8, 3)
#fil2l(ks, dfcoli)
#fil3l(ks, dfcoli)