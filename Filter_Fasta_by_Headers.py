#!/usr/bin/python
import argparse
from Bio import SeqIO

## Make commandline arguments with ArgParse
parser = argparse.ArgumentParser()
parser.add_argument("-f", "-fasta_path", help="Provide the path to the fasta sequence to be filtered")
parser.add_argument("-p", "-headers", help="Provide the path to the headers")
args = parser.parse_args()

## Save fasta sequences as python dictionary
fasta_sequences = SeqIO.to_dict(SeqIO.parse(open(args.f), 'fasta'))

## Save significant headers as a list
f = open(args.p, 'r')
header_list = f.readlines()


## Manipulate header file to get contig id
my_list = []
for i in header_list:
    rest = i.split(" ", 1)[0]
    my_list.append(rest)

## Filter fasta dictionary by list of contig ids
filtered_dict = dict((k, fasta_sequences[k]) for k in my_list if k in fasta_sequences)

## Edit path to save updated contig file in the folder with the original contig file
path = args.f
folder = path.rsplit('/', 1)[0]
new_path = folder+"/"

## Write filtered contigs back to new file
with open(new_path+"Significant_filtered_contigs.fasta", "w") as handle:
    SeqIO.write(filtered_dict.values(), handle, "fasta")


def main():
    pass

if __name__ == "__main__":
    main()