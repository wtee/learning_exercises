import argparse
import three_way_compare

parser = argparse.ArgumentParser()
parser.add_argument('files', nargs=3)
args = parser.parse_args()

seq1 = three_way_compare.load_text(args.files[0])
seq2 = three_way_compare.load_text(args.files[1])
seq3 = three_way_compare.load_text(args.files[2])

three_way_compare.make_comparison(seq1, seq2, seq3)