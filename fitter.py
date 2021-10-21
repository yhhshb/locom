import sys
import pandas as pd
from scipy import optimize

def get_separator(option) -> str:
    if option == "comma": return ','
    elif option == "space": return ' '
    elif option == "tab": return '\t'

def squared(x, a, b, c):
    return a*x**2 + b*x + c

def fit_main(args):
    separator = get_separator(args.sep)
    table = pd.DataFrame(pd.read_csv(args.i, sep=separator, header=args.header))
    opt_pars, _ = optimize.curve_fit(squared, table[args.x], table[args.y])
    print(opt_pars)

def main(args):
    if (args.command == "fit"): return fit_main(args)
    else: sys.stderr.write("-h to list available subcommands\n")

def parser_init():
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("__default")
    subparsers = parser.add_subparsers(dest="command")

    parser_tplot = subparsers.add_parser("fit", help="fit variables")
    parser_tplot.add_argument("-i", help="input table", type=str, required=True)
    parser_tplot.add_argument("--header", help="read file with headers", type=int, required=True)
    parser_tplot.add_argument("-x", help="x variable (use numbers if headerless)", type=str, required=True)
    parser_tplot.add_argument("-y", help="y variable (use numbers if headerless)", type=str, required=True)
    parser_tplot.add_argument("--sep", "-s", help="separator [comma, space, tab]", type=str, required=True)

    return parser

if __name__ == "__main__":
    parser = parser_init()
    args = parser.parse_args(sys.argv)
    main(args)