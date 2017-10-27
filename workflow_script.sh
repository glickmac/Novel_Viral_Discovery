#!/bin/bash
show_help() {
cat << EOF
Usage: ${0##*/} [-f <Path to Contig File>] [-p <Path to Significant Headers>] [-h <help>]…
Do stuff with FILE and write the result to standard output. With no FILE or when FILE is -, read standard input.
	-h          display this help and exit
	-f 	    Path to contig fasta file
	-p          Path to reads

EOF
}

while getopts “:h:f:” o; do
    case "${o}" in
	h)  
	    show_help;
            exit 1
            ;;
        f)
            f=${OPTARG}
            ;;
        *)
            show_help >&2;
	    exit 1
            ;;
    esac
done

shift "$((OPTIND-1))"

megahit -r $f -o ${f%%.*}

./VirFindr_Script.R ${f%%.*}/final.contigs.fa

./Filter_Fasta_by_Headers.py -f ${f%%.*}/final.contigs.fa -p ${f%%.*}/Significant_Headers.txt

bwa index ${f%%.*}/Significant_filtered_contigs.fasta 
bwa aln -t 2 ${f%%.*}/Significant_filtered_contigs.fasta $f > ${f%%.*}/alignment.sai
bwa samse ${f%%.*}/Significant_filtered_contigs.fasta ${f%%.*}/alignment.sai $f > ${f%%.*}/alignment.sam

samtools view -bT $f ${f%%.*}/alignment.sam > ${f%%.*}/alignment.bam
samtools view -b -F 4 ${f%%.*}/alignment.bam > ${f%%.*}/mapped.bam
samtools view ${f%%.*}/mapped.bam | awk '{OFS="\t"; print ">"$1"\n"$10}' > ${f%%.*}/mapped_reads.fasta
