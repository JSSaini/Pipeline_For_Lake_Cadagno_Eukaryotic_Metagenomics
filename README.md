
#   Pipeline for Microbial Eukaryotic Metagenomics of Lake Cadagno.

##  *Metagenomics provides a near-complete genome of microbial eukaryote Chlorella from a high alpine meromictic lake and reveals its potential for carbon, sulphur and nitrogen metabolism*

### Following are the tools and steps with example used for Eukaryotic Metagenomics pipeline:

#### 1. Pre-processing, and assembly of raw reads

 - Step 1.1 Trimming of reads prior to assembly to remove low quality calls
   
            bbduk.sh in1=read1.fq in2=read2.fq out1=clean1.fq out2=clean2.fq

 - Step 1.2 Error-correction and normalization of reads
            
            bbnorm.sh in=<input> out=<reads to keep> outt=<reads to toss> hist=<histogram output>
 
 - Step 1.3 Assembly of raw reads using SPAdes 

            spades.py -1 R1.fastq -2 R2.fastq -o name_of_output_folder -t 32 --meta
  
 - Step 1.4 Contig names were simplified using Anvio with minimum length of 1KB 

            anvi-script-reformat-fasta ./spades.contigs.fasta -o ./renamed.contigs.fa --min-len 1000 --simplify-names --report ./Spades_13m/name_conversions.txt

#### 2. Mapping and Binning from Assemblies

 - Step 2.1  Mapping

             #Creating BAM file
             bowtie2-build ./renamed.contigs.fa ./output_file

             bowtie2 --threads 16 -x ./output_file -1 R1.fastq -2 R2.fastq -S output_file.sam

             samtools view -F 4 -bS ./output_file.sam > ./output_file-RAW.bam
       
             #Sorting and indexing BAM files
             anvi-init-bam ./output_file-RAW.bam -o ./output_file.bam

- Step 2.2 CONCOCT Non-competitive Binning

           cut_up_fasta.py ./renamed.contigs.fa -c 10000 -o 0 --merge_last -b renamed.contigs_10k.bed > renamed.contigs_10k.fa

           concoct_coverage_table.py renamed.contigs_10k.bed ./output_file.bam > coverage_table.tsv

           concoct --composition_file renamed.contigs_10k.fa --coverage_file coverage_table.tsv  -b ./output_folder_name/ -t 8

           merge_cutup_clustering.py ./output_folder_name/clustering_gt1000.csv > ./output_folder_name/clustering_merged.csv

           extract_fasta_bins.py ./renamed.contigs.fa ./output_folder_name/clustering_merged.csv --output_path ./output_folder_name/

#### 3. Classification and Quality Assessment Eukaryotic and Prokaryotic MAGs

- Step 3.1 CAT BAT Taxonomic Classification
           
           #Requires high memory: 250GB RAM with 16 cores
           CAT bins -b /folder_containing_bins/ -s .fa -d ../CAT_database.2021-07-24/ -t ../CAT_taxonomy.2021-07-24/ -n 16 --block_size 20 --index_chunks 1
      
           #Getting taxonomy for each MAG
           CAT add_names -i  out.BAT.bin2classification.txt -o GT_tax.txt -t ../CAT_taxonomy.2021-07-24/ --only_official

- Step 3.2 Quality Assessment of MAGs using BUSCO
      
           busco --in /folder_containing_bins/ --mode genome --cpu 16 --out busco_output_folder
 
 
 ***NOTE: AT THIS STAGE BUSCO DETECTED A HIGH QUALITY CHLOROPHYTA GENOME IN ALL 4 SAMPLES OF CHEMOCLINE***
 
 
 
 #### 4. Extracting raw reads of Chlorophyta MAGs and re-assembling
        
 - Step 4.1 Adding prefix to contigs of each eukaryotic MAG
      
            sed ’s/^>/>PREFIX_/g’ Euk_Bin1.fna > Euk_Bin1_modified.fna
     
            #Compile all MAGs
            cat Euk_Bin1_modified.fna Euk_Bin2_modified.fna Euk_Bin3_modified.fna Euk_Bin4_modified.fna > compiled_eukaryotic_MAGs_of_interest.fa

- Step 4.2 Mapping to raw reads
      
           bowtie2-build ./compiled_eukaryotic_MAGs_of_interest.fa ./compiled_eukaryotic_MAGs_of_interest
      
           bowtie2 --threads 16 -x ./compiled_eukaryotic_MAGs_of_interest -1 R1.fastq -2 R2.fastq -S output_file.sam

           samtools view -F 4 -bS ./output_file.sam > ./output_file-RAW.bam
      
 - Step 4.3 Extracting raw reads (R1 and R2) from BAM files
      
            bamToFastq -i output_file-RAW.bam -fq lib_13m_mapped.1.fastq -fq2 lib_13m_mapped.2.fastq
 
 
 - Step 4.4 Assembling Eukaryotic Genome of Interest raw reads 
   
            #raw reads from two samples was taken
            spades.py -1 lib_13m_mapped.1.fastq -2 lib_13m_mapped.2.fastq -1 lib_15_5m_mapped.1.fastq -2 lib_15_5m_mapped.2.fastq  -o ./Anvio2/Spades_13_15p5_Map_GBII

         
 #### 5. Manual Refinement Chlorophyta Genome Assembly through Anvio & Command line
  
 - Step 5.1 Using Anvio 
  
            #Generate contig database of Chlorophyta Assembly
            anvi-gen-contigs-database -f ./Spades_13_15p5_Map_GBII/Anvio_13_15p5_GBII.contigs.fa -o ./mapping2/contigs_Anvio13m_run2.db -n 'An example contigs database'
            
            #HMMS RUN
            anvi-run-hmms -c ./mapping2/contigs_Anvio13m_run2.db
            
            #Create profile database with each sample
            anvi-profile -i ./mapping2/lib_13m_mapped_F_13_15p5.bam -c ./mapping2/contigs_Anvio13m_run2.db -o ./mapping2/P_An_13_w13_run2 -T 16
            anvi-profile -i ./mapping2/lib_15mw_mapped_F_13_15p5.bam -c ./mapping2/contigs_Anvio13m_run2.db -o ./mapping2/P_An_13_w13_15mw_run2 -T 16
            anvi-profile -i ./mapping2/lib_15_5m_mapped_F_13_15p5.bam -c ./mapping2/contigs_Anvio13m_run2.db -o ./mapping2/P_An_13_15p5_run2 -T 4
            anvi-profile -i ./mapping2/lib_15mm_mapped_F_13_15p5.bam -c ./mapping2/contigs_Anvio13m_run2.db -o ./mapping2/P_An_13_15mm_run2 -T 16
        
            #Merge Anvio Profiles
            anvi-merge ./mapping2/P_An_13_w13_run2/PROFILE.db ./mapping2/P_An_13_w13_15mw_run2/PROFILE.db ./mapping2/P_An_13_15p5_run2/PROFILE.db ./mapping2/P_An_13_15mm_run2/PROFILE.db -o ./mapping2/SAMPLES-MERGED_run2 -c ./mapping2/contigs_Anvio13m_run2.db
                    
            #Refine assembly by Anvio interface
            anvi-refine -p ./mapping2/SAMPLES-MERGED_run2/PROFILE.db -c ./mapping2/contigs_Anvio13m_run2.db --server-only -P 8080
 
            anvi-cluster-contigs  -p ./mapping2/SAMPLES-MERGED_run2/PROFILE.db -c ./mapping2/contigs_Anvio13m_run2.db -C CONCOCT2 --driver CONCOCT -T 8 --just-do-it
            anvi-summarize -p ./mapping2/SAMPLES-MERGED_run2/PROFILE.db -c ./mapping2/contigs_Anvio13m_run2.db -o ./mapping2/SAMPLES-SUMMARY_run23 -C CONCOCT2

 
 - Step 5.2 Removal of contigs using command line
            
            #filter minimum length 2500
            reformat.sh in=Chlophyta_2ks_nohit_filtered_bin.fa out=Chlophyta_2ks_nohit_filtered_bin2.fa minlength=2500
         
            #Remove contigs with no-hits
            filterbyname.sh in=Chlophyta_2ksfiltered_bin.fa out=Chlophyta_2ks_nohit_filtered_bin.fa names=c_000000000762,c_000000000733,
            c_000000000503,c_000000000488,c_000000000717,c_000000000753,c_000000000834,c_000000000754,c_000000000786,c_000000000711,
            c_000000000784,c_000000000836,c_000000000832,c_000000000779,c_000000000781,c_000000000633,c_000000000726,c_000000000773,
            c_000000000683,c_000000000795,c_000000000725,c_000000000837,c_000000000770,c_000000000621,c_000000000742,c_000000000830,
            c_000000000748,c_000000000755,c_000000000732,c_000000000701,c_000000000330,c_000000000746,c_000000000602,c_000000000661,
            c_000000000769,c_000000000768,c_000000000715,c_000000000819,c_000000000841,c_000000000588,c_000000000644,c_000000000827,
            c_000000000844,c_000000000232,c_000000000824,c_000000000718,c_000000000817,
            c_000000000806,c_000000000314,c_000000000758,c_000000000774,c_000000000838,c_000000000804,c_000000000767,
            c_000000000678,c_000000000820,c_000000000568,c_000000000818 include=f

        
 #### 6. Microbial Eukaryote Genome visualization through BlobTools
  
  - Step 6.1 Generating BAM files with reads from 13 m and 15.5 m samples
          
             #Creating BAM files
             bowtie2-build /home/users/s/saini7/scratch/MS2/Spades_13_15p5_Map/Anvio_13_15p5.fasta ./Spades.contigs_13_15p5m
             bowtie2 --threads 16 -x ./Spades.contigs_13_15p5m -1 ../lib_13m_mapped.1.fastq -2 ../lib_13m_mapped.2.fastq -1 ../lib_15_5m_mapped.1.fastq -2 ../lib_15_5m_mapped.2.fastq -S lib_13_15_5m_mapped_F_13_15p5.sam
             samtools view -F 4 -bS ./lib_13_15_5m_mapped_F_13_15p5.sam > ./lib_13_15_5m_mapped_F_13_15p5-RAW.bam
             anvi-init-bam ./lib_13_15_5m_mapped_F_13_15p5-RAW.bam -o ./lib_13_15_5m_mapped_F_13_15p5.bam

  - Step 6.2 Performing Blastx required for blobtools. 
          
             diamond blastx -query /Refined_Eukaryotic_genome.fa --db ./nr_Final2.dmnd --outfmt 6 qseqid staxids bitscore qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue --sensitive --max-target-seqs 1 --evalue 1e-25 --threads 16 > /home/users/s/saini7/scratch/MS2/Anvio_P/Refined_Eukaryotic_genome_dmnd.blastx.out

  - Step 6.3 Blobtools command line
          
             ~/blobtoolkit/blobtools2/blobtools create --fasta ../Chlophyta_2ks_nohit_filtered_bin/Chlophyta_2ks_nohit_filtered_bin2.fa  --cov ../lib_13_15_5m_mapped_F_13_15p5_filter_nohit.bam --hits ../Chlophyta_2ks_nohit_filtered_bin/Chlophyta_2ks_nohit_filtered_blast.out --taxdump ~/blobtoolkit/taxdump --threads 4 --replace /home/users/s/saini7/scratch/MS2/Anvio2/refined_bin/bin_by_bin/Chlorophyta_1/busco_chlo2k/busco/blob2
           

#### 7. Organelle (Chloroplast) hunting and Visualization

  - Step 7.1 Performing BLAST using available NCBI chloroplast genomes
      
             #Blast using NCBI Parachlorella kessleri chloroplast genome (NC_012978.1) 
             blastn -db ~/scratch/Spades_15mw2/Anvio.15mw.S.contigs.fa -query NC_012978.1_para_chlorella.fa -outfmt 6 -max_target_seqs 1 > 15mw_PC_chloroplast.out

             #Blast using NCBI Cryptomonas curvata chloroplast genome (KY856939.1) 
             blastn -db ~/scratch/15mm/Spades_15mm/Anvio.15mm.S.contigs.fa -query KY856939.1.fasta -outfmt 6 -max_target_seqs 1 > 15m_GT_chloroplast.out

  - Step 7.2 Extraction of contigs/prospective chloroplast genomes from main assemblies
 
             #Contig with promising hit against Parachlorella kessleri chloroplast genome (NC_012978.1) 
             printf "c_000000000152" | seqtk subseq ~/scratch/Spades_15mw2/Anvio.15mw.S.contigs.fa  - > c_000000000152_PC_O_15mw.fa
       
             #Contig with promising hit against Cryptomonas curvata chloroplast genome (KY856939.1) 
             printf "c_000000000134" | seqtk subseq ~/scratch/15mm/Spades_15mm/Anvio.15mm.S.contigs.fa  - > c_000000000134_GT_15mm.fa
     
  - Step 7.3 Circularization of Chloroplast genomes by NOVOPlasty 
       
             #Example script
             Project:
             -----------------------
             Project name          = CC_15_5m
             Type                  = chloro
             Genome Range          = 80000-200000
             K-mer                 = 33
             Max memory            =
             Extended log          = 0
             Save assembled reads  = no
             Seed Input            = ./c_000000000134_GT_15mm.fa
             Extend seed directly  = yes
             Reference sequence    = ./KY856939.1.fasta 
             Variance detection    =
             Chloroplast sequence  =

             Dataset 1:
             -----------------------
             Read Length           = 151
             Insert size           = 300
             Platform              = illumina
             Single/Paired         = PE
             Combined reads        =
             Forward reads         = /R1.fastq
             Reverse reads         = /R2.fastq
             Store Hash            =

 - Step 7.4 Visualization of Circularized Chloroplast Genomes using online GeSeq Platform
 
            https://chlorobox.mpimp-golm.mpg.de/geseq.html


#### 8. Metabolic Prediction of Microbial Eukaryotic Genomes 

- Step 8.1  EukMetaSanity was used for gene prediction
      
            yapim run -i directory_containing_genome -c run-config.yaml -p $EukMS_run -o name_of_out_put_directory

- Step 8.2  Mapping of protein coding gene sequences (.faa) from EukMetaSanity to KEGG Pathways using GhostKoala Online

            https://www.kegg.jp/ghostkoala/
      
**OR**

- Step 8.3  Anvio Metabolism Prediction
      
            anvi-setup-kegg-kofams --reset

            anvi-gen-contigs-database -f 197.fa -o contigs_197.db -n 'An example contigs database'

            anvi-run-hmms -c contigs_197.db -T 4
      
            anvi-run-kegg-kofams -c contigs_197.db -T 16 --just-do-it
                 
            anvi-estimate-metabolism -c contigs_197.db  -p ./All_SAMPLES-MERGED_P/PROFILE.db  --add-coverage -O kegg_out_f_jan22
      
            anvi-interactive -c ./contigs_197.db -p ./All_SAMPLES-MERGED_P/PROFILE.db --server-only -P 8008

#### 9. Phylogenomic analyses of Microbial Eukaryote and Chloroplast Genomes 

 - Step 9.1 Chloroplasts 

            #Concatenation of 18 marker genes were aligned using MAFFT and ambigious sequences were removed from Gblocks.List of Marker genes ATP synthase (atpA, atpB, atpC), large ribosomal subunits (rpl2, rpl5, rpl12, rpl14, rpl19, rpl23) and small ribosomal subunits (rps3, rps8, rps9, rps19), photosystem I (psaC) and photosystem II (psbA, psbB, psbE, psbH).
      
            https://mafft.cbrc.jp/alignment/software/

- Step 9.2 Microbial Eukaryote Nuclear Genome
           
           #Extraction of Markers
           
           #Alignment
           
           #Phylogenomic inference
           
           [selected_markers_with_links_and_description.txt]    (https://github.com/JSSaini/Eukaryotic_Metagenomic_Lake_Cadagno/files/8986487/selected_markers_with_links_and_description.txt)








