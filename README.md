# Pipeline for Eukaryotic Metagenomics of Lake Cadagno. 

## 1. Pre-processing, and assembly of raw reads

- Pre-prosessing including Quality check and normalization of raw reads using BBDuk and BBnorm using BBTools package.
- Assembled using SPAdes (version 3.15.0) 

  - ```spades.py -1 R1.fastq -2 R2.fastq -o name_of_output_folder -t 32 --meta``` 
- Contig names were simplified using Anvio with minimum length of 1KB 

  - ```anvi-script-reformat-fasta ./spades.contigs.fasta -o ./renamed.contigs.fa --min-len 1000 --simplify-names --report ./Spades_13m/name_conversions.txt```

## 2. Mapping and Binning from Assemblies

- 2.1 Mapping

      Step 2.1.1 bowtie2-build ./renamed.contigs.fa ./output_file

      Step 2.1.2 bowtie2 --threads 16 -x ./output_file -1 R1.fastq -2 R2.fastq -S output_file.sam

      Step 2.1.3 samtools view -F 4 -bS ./output_file.sam > ./output_file-RAW.bam

      Step 2.1.4 anvi-init-bam ./output_file-RAW.bam -o ./output_file.bam

- 2.2 CONCOCT Binning: Non-competitive

      Step 2.2.1 cut_up_fasta.py ./renamed.contigs.fa -c 10000 -o 0 --merge_last -b renamed.contigs_10k.bed > renamed.contigs_10k.fa

      Step 2.2.2 concoct_coverage_table.py renamed.contigs_10k.bed ./output_file.bam > coverage_table.tsv

      Step 2.2.3 concoct --composition_file renamed.contigs_10k.fa --coverage_file coverage_table.tsv  -b ./output_folder_name/ -t 8

      Step 2.2.4 merge_cutup_clustering.py ./output_folder_name/clustering_gt1000.csv > ./output_folder_name/clustering_merged.csv

      Step 2.2.5 extract_fasta_bins.py ./renamed.contigs.fa ./output_folder_name/clustering_merged.csv --output_path ./output_folder_name/




