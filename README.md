
#   Pipeline for Eukaryotic Metagenomics of Lake Cadagno.

##  Metagenomics provides a near-complete genome of microbial eukaryote Chlorella from a high alpine meromictic lake and reveals its potential for carbon, sulphur and nitrogen metabolism


### 1. Pre-processing, and assembly of raw reads

- Pre-prosessing including Quality check and normalization of raw reads using BBDuk and BBnorm using BBTools package.
- Assembled using SPAdes (version 3.15.0) 

  ```spades.py -1 R1.fastq -2 R2.fastq -o name_of_output_folder -t 32 --meta```
  
- Contig names were simplified using Anvio with minimum length of 1KB 

  ```anvi-script-reformat-fasta ./spades.contigs.fasta -o ./renamed.contigs.fa --min-len 1000 --simplify-names --report ./Spades_13m/name_conversions.txt```

### 2. Mapping and Binning from Assemblies

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

### 3. Classification and Quality Assessment Eukaryotic and Prokaryotic MAGs

- 3.1 CAT BAT Taxonomic Classification
      
      Step 3.1.1 CAT bins -b /folder_containing_bins/ -s .fa -d ../CAT_database.2021-07-24/ -t ../CAT_taxonomy.2021-07-24/ -n 16 --block_size 20 --index_chunks 1
      
      Step 3.1.2 CAT add_names -i  out.BAT.bin2classification.txt -o GT_tax.txt -t ../CAT_taxonomy.2021-07-24/ --only_official

- 3.2 Quality Assessment of MAGs using BUSCO
      
      Step 3.2.1 busco --in /folder_containing_bins/ --mode genome --cpu 16 --out busco_output_folder
      
 ## 4. Extracting raw reads specific to eukaryotic genome and re-assembling
 
       #Refinement includes re-assembly and re-binning of raw reads extracted using concatenated eukaryotic MAGs from same species. Following are the steps:
       
 - 4.1 Renaming prefix to contigs of each eukaryotic MAG of interest
      
       Step 4.1.1 sed ’s/^>/>PREFIX_/g’ Euk_Bin1.fna > Euk_Bin1_modified.fna
     
       Step 4.1.2 cat Euk_Bin1_modified.fna Euk_Bin2_modified.fna Euk_Bin3_modified.fna Euk_Bin4_modified.fna > compiled_eukaryotic_MAGs_of_interest.fa

- 4.2 Mapping to raw reads
      
      Step 4.2.1 bowtie2-build ./compiled_eukaryotic_MAGs_of_interest.fa ./compiled_eukaryotic_MAGs_of_interest
      
      Step 4.2.2 bowtie2 --threads 16 -x ./compiled_eukaryotic_MAGs_of_interest -1 R1.fastq -2 R2.fastq -S output_file.sam

      Step 4.2.3 samtools view -F 4 -bS ./output_file.sam > ./output_file-RAW.bam
      
 - 4.3 Extracting raw reads (R1 and R2) from BAM files
      
       Step 4.3.1 bamToFastq -i output_file-RAW.bam -fq lib_13m_mapped.1.fastq -fq2 lib_13m_mapped.2.fastq
 
 - 4.4 Assembling Eukaryotic Genome of Interest raw reads 
   
   -Only raw reads from two samples was taken.
      
       Step 4.4.1 spades.py -1 lib_13m_mapped.1.fastq -2 lib_13m_mapped.2.fastq -1 lib_15_5m_mapped.1.fastq -2 lib_15_5m_mapped.2.fastq  -o ./Anvio2/Spades_13_15p5_Map_GBII

         
  ## 5. Manual Refinement of Eukaryotic Genome Assembly through Anvio & Command line
  
  - 5.1 Anvio steps to generate contigs and profile database from Eukaryotic Genome Assembly 
  
        Step 5.1.1 anvi-gen-contigs-database -f ./Spades_13_15p5_Map_GBII/Anvio_13_15p5_GBII.contigs.fa -o ./mapping2/contigs_Anvio13m_run2.db -n 'An example contigs database'
        
        Step 5.1.2 anvi-run-hmms -c ./mapping2/contigs_Anvio13m_run2.db
        
        Step 5.1.3 anvi-profile -i ./mapping2/lib_13m_mapped_F_13_15p5.bam -c ./mapping2/contigs_Anvio13m_run2.db -o ./mapping2/P_An_13_w13_run2 -T 16
                   anvi-profile -i ./mapping2/lib_15mw_mapped_F_13_15p5.bam -c ./mapping2/contigs_Anvio13m_run2.db -o ./mapping2/P_An_13_w13_15mw_run2 -T 16
                   anvi-profile -i ./mapping2/lib_15_5m_mapped_F_13_15p5.bam -c ./mapping2/contigs_Anvio13m_run2.db -o ./mapping2/P_An_13_15p5_run2 -T 4
                   anvi-profile -i ./mapping2/lib_15mm_mapped_F_13_15p5.bam -c ./mapping2/contigs_Anvio13m_run2.db -o ./mapping2/P_An_13_15mm_run2 -T 16
        
        Step 5.1.4 anvi-merge ./mapping2/P_An_13_w13_run2/PROFILE.db ./mapping2/P_An_13_w13_15mw_run2/PROFILE.db ./mapping2/P_An_13_15p5_run2/PROFILE.db ./mapping2/P_An_13_15mm_run2/PROFILE.db -o ./mapping2/SAMPLES-MERGED_run2 -c ./mapping2/contigs_Anvio13m_run2.db
        
        Step 5.1.5  anvi-refine -p ./mapping2/SAMPLES-MERGED_run2/PROFILE.db -c ./mapping2/contigs_Anvio13m_run2.db --server-only -P 8080
        
        #Command line refining
        Step 5.1.6  #filter contigs with no hits
        
        filterbyname.sh in=Chlophyta_2ksfiltered_bin.fa out=Chlophyta_2ks_nohit_filtered_bin.fa names=c_000000000762,c_000000000733,
        c_000000000503,c_000000000488,c_000000000717,c_000000000753,c_000000000834,c_000000000754,c_000000000786,c_000000000711,
        c_000000000784,c_000000000836,c_000000000832,c_000000000779,c_000000000781,c_000000000633,c_000000000726,c_000000000773,
        c_000000000683,c_000000000795,c_000000000725,c_000000000837,c_000000000770,c_000000000621,c_000000000742,c_000000000830,
        c_000000000748,c_000000000755,c_000000000732,c_000000000701,c_000000000330,c_000000000746,c_000000000602,c_000000000661,
        c_000000000769,c_000000000768,c_000000000715,c_000000000819,c_000000000841,c_000000000588,c_000000000644,c_000000000827,
        c_000000000844,c_000000000232,c_000000000824,c_000000000718,c_000000000817,
        c_000000000806,c_000000000314,c_000000000758,c_000000000774,c_000000000838,c_000000000804,c_000000000767,
        c_000000000678,c_000000000820,c_000000000568,c_000000000818 include=f

        Step 5.1.7  #filter minimum length 2500
        reformat.sh in=Chlophyta_2ks_nohit_filtered_bin.fa out=Chlophyta_2ks_nohit_filtered_bin2.fa minlength=2500
        
   ## 6. Eukaryotic Genome visualization through BlobTools
   - 6.1 Generating BAM files with reads from 13 m and 15.5 m samples
          
          #Creating BAM files
          Step 6.1.1 bowtie2-build /home/users/s/saini7/scratch/MS2/Spades_13_15p5_Map/Anvio_13_15p5.fasta ./Spades.contigs_13_15p5m
          Step 6.1.2 bowtie2 --threads 16 -x ./Spades.contigs_13_15p5m -1 ../lib_13m_mapped.1.fastq -2 ../lib_13m_mapped.2.fastq -1 ../lib_15_5m_mapped.1.fastq -2 ../lib_15_5m_mapped.2.fastq -S lib_13_15_5m_mapped_F_13_15p5.sam
          Step 6.1.3 samtools view -F 4 -bS ./lib_13_15_5m_mapped_F_13_15p5.sam > ./lib_13_15_5m_mapped_F_13_15p5-RAW.bam
          Step 6.1.4 anvi-init-bam ./lib_13_15_5m_mapped_F_13_15p5-RAW.bam -o ./lib_13_15_5m_mapped_F_13_15p5.bam

   - 6.2 Performing Blastx required for blobtools. 
          
          diamond blastx -query /Refined_Eukaryotic_genome.fa --db ./nr_Final2.dmnd --outfmt 6 qseqid staxids bitscore qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue --sensitive --max-target-seqs 1 --evalue 1e-25 --threads 16 > /home/users/s/saini7/scratch/MS2/Anvio_P/Refined_Eukaryotic_genome_dmnd.blastx.out

   - 6.3 Blobtools command line
          
           ~/blobtoolkit/blobtools2/blobtools create --fasta ../Chlophyta_2ks_nohit_filtered_bin/Chlophyta_2ks_nohit_filtered_bin2.fa  --cov ../lib_13_15_5m_mapped_F_13_15p5_filter_nohit.bam --hits ../Chlophyta_2ks_nohit_filtered_bin/Chlophyta_2ks_nohit_filtered_blast.out --taxdump ~/blobtoolkit/taxdump --threads 4 --replace /home/users/s/saini7/scratch/MS2/Anvio2/refined_bin/bin_by_bin/Chlorophyta_1/busco_chlo2k/busco/blob2
           

## 7. Organelle (Chloroplast) hunting
         
         #Example code 
         CAT bins -b /MAG_folder/ -s .fa -d ../CAT_database.2021-07-24/ -t ../CAT_taxonomy.2021-07-24/  -n 16 --block_size 20 --index_chunks 1
         CAT add_names -i  out.BAT.bin2classification.txt -o name_of_output_fle.txt -t ../CAT_taxonomy.2021-07-24/ --only_official
 

/home/users/s/saini7/scratch/13m/norgal/NOVOPlasty/chloroplasts_cryptomonas/PP_cov

blastn -db ~/scratch/15_5m/Spades_15_5pm/Anvio.15_5m.S.contigs.fa -query GT_final_chloroplast_novoplasty.fa -outfmt 6 -max_target_seqs 1 > 15_5m_GT_chloroplast.out


printf "c_000000022062" | seqtk subseq ~/scratch/15mm/Spades_15mm/Anvio.15mm.S.contigs.fa  - > c_000000025377_GT_O_15mm
printf "c_000000000179" | seqtk subseq ~/scratch/Spades_15mw2/Anvio.15mw.S.contigs.fa - > c_000000000179_GT_O_15mw
printf "c_000000025377" | seqtk subseq ~/scratch/13m/Spades_13m/Anvio.13m.S.contigs.fa - > c_000000025377_GT_O_13m
printf "c_000000048963" | seqtk subseq ~/scratch/15_5m/Spades_15_5pm/Anvio.15_5m.S.contigs.fa - > c_000000048963_GT_O_15_5m


printf "c_000000000134" | seqtk subseq ~/scratch/15mm/Spades_15mm/Anvio.15mm.S.contigs.fa  - > c_000000000134_GT_15mm
printf "c_000000020454" | seqtk subseq ~/scratch/Spades_15mw2/Anvio.15mw.S.contigs.fa - > c_000000020454_GT_15mw
printf "c_000000003144" | seqtk subseq ~/scratch/13m/Spades_13m/Anvio.13m.S.contigs.fa - > c_000000025377_GT_13m
printf "c_000000000257" | seqtk subseq ~/scratch/15_5m/Spades_15_5pm/Anvio.15_5m.S.contigs.fa - > c_000000000257_GT_15_5m










