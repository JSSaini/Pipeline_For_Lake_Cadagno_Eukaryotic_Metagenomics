# Pipeline for Eukaryotic Metagenomics of Lake Cadagno. 

## 1. Pre-processing and assembly of reads
- Preprosessing including Quality check and normalization of raw reads using BBDuk and BBnorm using BBTools package.
- Assembled using SPAdes (version 3.15.0)

```spades.py -1 R1.fastq -2 R2.fastq -o name_of_output_folder -t 32 --meta``` 

##
