# Novel Viral Discovery

## Table of Contents

[What is Novel Viral Discovery (NVD)?](#intro)    
[Why is this important?](#importance)    
[Workflow](#workflow)    
[Quickstart](#quickstart)    
[Installing NVD and Dependancies](#install)    
[NVD Usage](#usage)    
[NVD Testing and Validation](#testing_and_validation)    
[Additional Functionality](#additional)    

## <a name="intro"></a>What is NVD?


## <a name="importance"></a>Why is this important?


## <a name="workflow"></a>NVD Workflow


#### Magic-BLAST

[BLAST Command Line Manual](https://www.ncbi.nlm.nih.gov/books/NBK279690/)    
[Magic-BLAST GitHub repo](https://github.com/boratyng/magicblast)    
[Magic-BLAST NCBI Insights](https://ncbiinsights.ncbi.nlm.nih.gov/2016/10/13/introducing-magic-blast/)    

#### MEGAHIT

[MEGAHIT GitHub repo](https://github.com/voutcn/megahit)    
[MEGAHIT Paper](https://www.ncbi.nlm.nih.gov/pubmed/25609793)    

## <a name="install"></a>Installing NVD

Required software
+ Magic-BLAST: [download](https://ftp.ncbi.nlm.nih.gov/blast/executables/magicblast/LATEST) [documentation](https://boratyng.github.io/magicblast/)
+ [BLAST+](https://blast.ncbi.nlm.nih.gov/Blast.cgi?PAGE_TYPE=BlastDocs&DOC_TYPE=Download)
+ [MEGAHIT](https://github.com/voutcn/megahit)


## <a name="usage"></a><a name="quickstart"></a>NVD Usage

#### Example usage

```
viruspy.sh [-d] [-f viral_genomes.fasta/-b viral_db] -s SRR1553459 -o output_folder
```

#### Required arguments:

| Option     | Description                                     |
|------------|-------------------------------------------------|
| **-s**   | SRR acession number from SRA database           |
| **-o**   | Folder to be used for pipeline output |

#### Optional arguments:

| Option    | Description |
|-----------|-------------|
| **-f**    |FASTA file containing viral sequences to be used in construction of a BLAST database. If neither this argument nor -b are used, ViruSpy will default to using the Refseq viral genome database.|
| **-b**    |BLAST database with viral sequences to be used with Magic-BLAST. If neither this argument nor -f are used, ViruSpy will default to using the Refseq viral genome database.|
| **-d**    |Determines signature of viruses that are integrated into a host genome (runs the BUD algorithm)|

## <a name="testing_and_validation"></a>NVD Testing and Validation

## <a name="additional"></a>Additional Functionality
