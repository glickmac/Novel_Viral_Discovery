#!/usr/bin/env Rscript
# make this script executable by doing 'chmod +x VirFindr_Script.R'
help =
  "
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Help text here
Arguments in this order:
1) Path to Contigs File

./VirFindr_Script.R /Path/to/TSV/Biom/Table
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
\n\n"

# Read options from command line
args = commandArgs(trailingOnly = TRUE)
if(is.element("--help", args) | is.element("-h", args) | is.element("-help", args) | is.element("--h", args)){
  cat(help,sep="\n")
  stop("\nHelp requested.")
}

## Load required libraries
library(VirFinder)

## Read in FA file
predResult = VF.pred(inFaFile = args[1])

## Calculate adsjusted P-Value
predResult$adj_p = p.adjust(predResult$pvalue, method = "fdr")

#### (2.3) sort sequences by q-value in ascending order
predResult = predResult[order(predResult$adj_p),]

signif_predResult = predResult[predResult$adj_p < 0.05,]
##p_value_sig = predResult[predResult$pvalue < 0.05,]

## Place the output in the same folder as the contigs
path = args[1]
sep_path = c(strsplit(path, "/"))
char_path = sep_path[[1]]
folder = char_path[-length(char_path)]
file_name = paste(c(folder, "Significant_Headers.txt"), collapse = "/")

## Write table with significant viral hits
write(as.character(signif_predResult$name), file = file_name)

