packages<-c("ape", "devtools", "ggplot2", "colorspace", "vegan", "dplyr", "scales", "grid", "microshades", "reshape2", "plyr", "magrittr", "matrixStats",
            "data.table", "DT", "colorspace", "corrplot", "Hmisc", "tidyverse", "readxl", "RColorBrewer", "randomcoloR",
            "patchwork", "gghighlight","ggpubr", "cowplot", "geosphere", "karyoploteR", "ggtree", "networkD3", "easyalluvial", "jpeg")

#Install packages which are not there
#install.packages(packages, dependencies = TRUE)  



install.packages(setdiff(packages, rownames(installed.packages())), dependencies = TRUE)  

#Install ggtree manually
#if (!require("BiocManager", quietly = TRUE))
#install.packages("BiocManager")

#BiocManager::install("ggtree")
library(ggplot2) 
library(vegan) 
library(dplyr) 
library(scales) 
library(grid) 
library(microshades)
library(reshape2)
library(plyr)
library(phyloseq) 
library(magrittr)
library(geosphere)
library(matrixStats)
library(data.table)
library(DT)
library(colorspace)
library(corrplot)
library(Hmisc)
library(tidyverse)
library(readxl)
library(corrplot)
library(ggpubr)
library(cowplot)
library(compare)
library(viridis)
library(ggwaffle)
library(ggh4x)
library(ggplot2) 
library(vegan) 
library(dplyr) 
library(scales) 
library(grid) 
library(reshape2)
library(plyr)
library(phyloseq) 
library(magrittr)
library(geosphere)
library(matrixStats)
library(data.table)
library(DT)
#library(ggpubr)
#library(DESeq2)
library(colorspace)
# library(remotes)
library(ggrepel)
#library(ggpubr)
library(ape)
library(devtools)
library(readxl)
library(RColorBrewer)
library(randomcoloR)
library(patchwork)
library(gghighlight)
library(karyoploteR)
library(ggtree)
library(networkD3)
library(ggalluvial)
library(easyalluvial)
library(jpeg)
library(directlabels)
library(stringr)
library(knitr)

#devtools::install_github("ianmoran11/mmtable2")
library(mmtable2)
library(gt)
library(sjPlot)
library(stargazer)
library(sjmisc)



########Get VERSION OF ALL INSTALLED R PACKAGES#####################
ip <- as.data.frame(installed.packages()[,c(1,3:4)])
rownames(ip) <- NULL
ip <- ip[is.na(ip$Priority),1:2,drop=FALSE]
print(ip, row.names=FALSE)

      

###############################################################################################################
###############################################################################################################
############################################FIGURE SUPPLEMENTARY 1 (S1)########################################
###############################################################################################################
###############################################################################################################
###############################################################################################################

###Lake Cadagno physicochemical profile
CTD1_28 <- read.csv("~/GitHub/Lake_Cadagno_microbial_loop_Saini_et_al_2021/Fig.1-4_Suppl/CTD1_28_Aug_17_II.csv") 
CTD1_28$Depth_m<- round(CTD1_28$Depth_m_CTD1_28)
CTD1_28_final<- aggregate(. ~Depth_m, data = CTD1_28, FUN = mean)


#CTD1 29.08.2017 avg/depth
CTD1_29 <- read.csv("~/GitHub/Lake_Cadagno_microbial_loop_Saini_et_al_2021/Fig.1-4_Suppl/CTD1_29_Aug_17_II.csv") 
CTD1_29$Depth_m<- round(CTD1_29$Depth_m_CTD1_29)
CTD1_29_Aug_17_R3<- aggregate(. ~Depth_m, data = CTD1_29, FUN = mean)


#CTD2 29.08.2017 avg/depth

CTD2_29_Aug_17_avg_R <- read.csv("~/GitHub/Lake_Cadagno_microbial_loop_Saini_et_al_2021/Fig.1-4_Suppl/CTD2_29_Aug_17_avg_II.csv")
CTD2_29_Aug_17_avg_R$Depth_m<- round(CTD2_29_Aug_17_avg_R$Depth)
CTD2_29_Aug_17_avg_R2<- aggregate(. ~ Depth_m, data = CTD2_29_Aug_17_avg_R, FUN = mean)



Fig.S1A<- ggplot(data=CTD1_29_Aug_17_R3, aes(y=CTD1_29_Aug_17_R3$Depth_m))+
  annotate("rect", xmin=-Inf, xmax=Inf, ymin=12.5, ymax=13.5, alpha=0.25, fill="grey")+
  annotate("rect", xmin=-Inf, xmax=Inf, ymin=13.5, ymax=15.5, alpha=0.25, fill="grey")+
  annotate("rect", xmin=-Inf, xmax=Inf, ymin=15.5, ymax=16.5, alpha=0.25, fill="grey")+
  geom_path(data=CTD2_29_Aug_17_avg_R2, aes(y=as.numeric(CTD2_29_Aug_17_avg_R2$Depth_m), x=CTD2_29_Aug_17_avg_R2$PAR_CTD2_29/15, color="lightsalmon4"), 
            size=2, linetype="solid")+
  geom_point(data=CTD2_29_Aug_17_avg_R2, aes(y=as.numeric(CTD2_29_Aug_17_avg_R2$Depth_m), x=CTD2_29_Aug_17_avg_R2$PAR_CTD2_29/15, color="lightsalmon4"), 
             size=3.5)+
  geom_path(data=CTD1_29_Aug_17_R3, aes(y=CTD1_29_Aug_17_R3$Depth_m, x=CTD1_29_Aug_17_R3$Chl_A_CTD1_29, color="black"), 
            size=2, linetype="solid")+
  geom_point(data=CTD1_29_Aug_17_R3, aes(y=CTD1_29_Aug_17_R3$Depth_m, x=CTD1_29_Aug_17_R3$Chl_A_CTD1_29, color="black"), 
             size=3.5)+
  geom_path(data=CTD1_29_Aug_17_R3, aes(y=CTD1_29_Aug_17_R3$Depth_m, x=CTD1_29_Aug_17_R3$Turb_CTD1_29, color="blue"), 
            size=2, linetype="solid")+
  geom_point(data=CTD1_29_Aug_17_R3, aes(y=CTD1_29_Aug_17_R3$Depth_m, x=CTD1_29_Aug_17_R3$Turb_CTD1_29, color="blue"), 
             size=3.5)+
  geom_path(data=CTD2_29_Aug_17_avg_R2, aes(y=CTD2_29_Aug_17_avg_R2$Depth_m, x=CTD2_29_Aug_17_avg_R2$Phycocyanin_CTD2_29,  color="grey"), 
            size=2, linetype="solid")+
  geom_point(data=CTD2_29_Aug_17_avg_R2, aes(y=CTD2_29_Aug_17_avg_R2$Depth_m, x=CTD2_29_Aug_17_avg_R2$Phycocyanin_CTD2_29,  color="grey"), 
             size=3.5)+
  scale_y_reverse(limits = c(21,1), breaks=c(21, 19,  17,15.5, 15, 13,11,9,7, 5, 3, 1))+
  scale_x_continuous(sec.axis = sec_axis(~.*15, name = expression("PAR "("W/m" ^-2))))+
  xlab("Microbial Proxy")+
  scale_colour_manual("", breaks = c("black", "grey", "blue", "lightsalmon4"),
                      values = c("#52854C", "#56B4E9", "#CC79A7", "#FFA700"), labels=c("CTD 1: Chl a (??g/L)", "CTD 2: Phycocyanin (??g/L)", "CTD 1: Turbidity (FTU)",  "CTD 2: PAR (W/m^-2)"))+
  theme(legend.background = element_rect(size=0.3, colour ="transparent", fill = "transparent"))+
  theme_bw()+
  theme(
    # Hide panel borders and remove grid lines
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    # Change axis line 
  )+
  theme(legend.position = c(0.65, 0.6))+
  ylab("Depth (m)")+
  theme(legend.position = "bottom", legend.background = element_rect(size=0.3, 
                                                                     
                                                                     colour ="black"),  legend.direction = "horizontal")+
  guides(colour = guide_legend(nrow = 4))

Fig.S1B<- ggplot()+
  theme_bw()+
  annotate("rect", xmin=-Inf, xmax=Inf, ymin=12.5, ymax=13.5, alpha=0.25, fill="grey")+
  annotate("rect", xmin=-Inf, xmax=Inf, ymin=13.5, ymax=15.5, alpha=0.25, fill="grey")+
  annotate("rect", xmin=-Inf, xmax=Inf, ymin=15.5, ymax=16.5, alpha=0.25, fill="grey")+
  geom_point(data=Org_Inrg_R, aes(y=depth_m, x=avg_h2S*150, color="H2S"), size=3.5)+
  geom_path(data=Org_Inrg_R[!is.na(Org_Inrg_R$avg_h2S*150),], aes(y=depth_m, x=avg_h2S*150, color="H2S"), size=2, linetype="dashed")+
  geom_path(data=CTD1_29_Aug_17_R3, aes(y=as.numeric(CTD1_29_Aug_17_R3$Depth_m), x=CTD1_29_Aug_17_R3$DO_mg_CTD1_29, color="DOG"), 
            size=2, linetype="solid")+
  geom_point(data=CTD1_29_Aug_17_R3, aes(y=as.numeric(CTD1_29_Aug_17_R3$Depth_m), x=CTD1_29_Aug_17_R3$DO_mg_CTD1_29, color="DOG"),
             size=3.5)+
  geom_path(data=Org_Inrg_R, aes(y= depth_m, x = NH4_ug_L/20, colour="NH4"), size=2)+
  geom_point(data=Org_Inrg_R, aes(y= depth_m, x = NH4_ug_L/20, colour="NH4"), size=3.5)+
  #geom_path(data=CTD1_29_Aug_17_R3, aes(y=CTD1_29_Aug_17_R3$Depth_m, x=CTD1_29_Aug_17_R3$Turb_CTD1_29, color="blue"), 
  #          size=2, linetype="solid")+
  #geom_point(data=CTD1_29_Aug_17_R3, aes(y=CTD1_29_Aug_17_R3$Depth_m, x=CTD1_29_Aug_17_R3$Turb_CTD1_29, color="blue"), 
  #          size=3.5)+
  scale_y_reverse(limits = c(21,1), breaks=c(21, 19,  17,15.5, 15, 13,11,9,7, 5, 3, 1))+
  
  scale_x_continuous(sec.axis = sec_axis(~.*20, name = "Ammonium (??g/L)"))+
  
  scale_colour_manual("", breaks = c("H2S", "DOG", "NH4"),
                      values = c("#009E73", "#56B4E9", "#D55E00"), labels=c("H2S/1.5x10 (mg/L)", "CTD 1: Oxygen (mg/L)", "NH4 (??g/L)"))+
  theme(legend.background = element_rect(size=0.3, colour ="transparent", fill = "transparent"))+
  theme(
    # Hide panel borders and remove grid lines
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    # Change axis line 
  )+
  theme(legend.position = c(0.65, 0.6))+
  theme(axis.title.y = element_blank())+
  theme(axis.text.y = element_blank())+
  theme(axis.ticks.y = element_blank())+
  xlab("Oxygen and Hydrogen sulphide (mg/L)")+
  annotate("text", x = 5, y = 2, label = "(- - -) 28 August 2017", colour = "black", size = 3.5)+   
  annotate("text", x = 5, y = 3, label = "( - ) 29 August 2017", colour = "black", size = 3.5)+
  xlim(0,15)+
  theme(legend.position = "bottom", legend.background = element_rect(size=0.3, 
                                                                     
                                                                     colour ="black"),  legend.direction = "horizontal")+
  guides(colour = guide_legend(nrow = 3))

Fig.S1A | Fig.S1B #500x600


###############################################################################################################
###############################################################################################################
############################################FIGURE SUPPLEMENTARY 2 (S2)########################################
###############################################################################################################
###############################################################################################################
###############################################################################################################

#CAT on ASSEMBLIES
m5_part1 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Assembly_CAT_5m_0.txt")
m5_part1$Depth <- '5m'
m5_part2 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Assembly_CAT_5m_1.txt")
m5_part2$Depth <- '5m'
m9 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Assembly_CAT_9m.txt")
m9$Depth <- '9m'
m11 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Assembly_CAT_11m.txt")
m11$Depth <- '11m'
m13 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Assembly_CAT_13m.txt")
m13$Depth <- '13m'
m15mw <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Assembly_CAT_15mw.txt")
m15mw$Depth <- '15mw'
m15mm <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Assembly_CAT_15mm.txt")
m15mm$Depth <- '15mm'
m15_5m_1 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Assembly_CAT_15_5m_0.txt")
m15_5m_1$Depth <- '15_5m'
m15_5m_2 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Assembly_CAT_15_5m_1.txt")
m15_5m_2$Depth <- '15_5m'
m17 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Assembly_CAT_17m.txt")
m17$Depth <- '17m' 


Assembly_CAT <- rbind(m5_part1, m5_part2, m9, m11, m13, m15mw, m15mm, m15_5m_1,m15_5m_2, m17)

#Extract CAT score
Assembly_CAT2<- Assembly_CAT %>% separate(superkingdom, c("superkingdom2", "confidence"), ": ", extra = "merge")

Assembly_CAT2$superkingdom2 <- sub("^$", "no support", Assembly_CAT2$superkingdom2) #replace empty cells with no support
Assembly_CAT2$confidence[is.na(Assembly_CAT2$confidence)] <- "0" #replace empty confidence cells with 0
#Assembly_CAT3$superkingdom2<- Assembly_CAT2$superkingdom2 %>% replace_na('no support')



##Upload stats on assembly

assem_stat_output <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/assem_stat_output.txt")
assem_stat_output$sample<- c("11m","13m", "15.5m", "15mm", "15mw","17m", "5m", "9m")


##Assemblu merge with count of contigs
assembly_stat<- merge(Assembly_CAT2, assem_stat_output, by.x="Depth", by.y="sample")
assembly_stat$contig_bp


###drop samples mixolimnion, and monimolimn

assem_stat_output_drop<-assem_stat_output[!(assem_stat_output$sample=="5m"),] 
assem_stat_output_drop1<-assem_stat_output_drop[!(assem_stat_output_drop$sample=="9m"),] 
assem_stat_output_drop2<-assem_stat_output_drop1[!(assem_stat_output_drop1$sample=="11m"),]
assem_stat_output_drop3<-assem_stat_output_drop2[!(assem_stat_output_drop2$sample=="17m"),]

Fig.S2A<- ggplot(assem_stat_output_drop3, aes(x=contig_bp/1000000, y=sample)) + 
  xlab("Size (Mbp)")+
  #geom_point(shape=16, color="#293352")+
  #scale_size(range = c(5,15), breaks = c(3469,6437,8574))+
  geom_bar(stat = "identity", fill = "#56B4E9", colour = "black")+
  #geom_point(size=3.5, shape=16, color="black")+
  scale_y_discrete(limits=c("15.5m", "15mm", "15mw", "13m"), 
                   labels=c("15.5", "15", "15-w", "13"))+
  theme_bw()+
  theme(axis.ticks.y = element_blank())+
  theme(
    # Hide panel borders and remove grid lines
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    # Change axis line
  )+ theme(legend.position = "right")+ 
  ylab("Depth (m)")+
  theme(axis.text=element_text(size=12),axis.title=element_text(size=12))+
  scale_x_continuous(breaks=(pretty_breaks()))+
  theme(axis.text.x=element_text(angle=45, hjust=1))



Fig.S2B<- ggplot(assem_stat_output_drop3, aes(x=gc_avg, y=sample)) +
  geom_bar(stat = "identity", fill = "#56B4E9", colour = "black") + 
  geom_errorbar(data=assem_stat_output_drop3, mapping=aes(x=gc_avg, xmin=gc_avg-gc_std, xmax=gc_avg+gc_std), width=0.2, size=0.5, color="black")+
  scale_y_discrete(limits=c("15.5m", "15mm", "15mw", "13m"), 
                   labels=c("15.5", "15", "15-w", "13"))+
  theme_bw()+
  theme(axis.ticks.y = element_blank())+
  theme(
    # Hide panel borders and remove grid lines
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    # Change axis line
  )+
  theme(axis.text.y = element_blank())+
  theme(axis.title.y = element_blank())+
  theme(axis.ticks.y = element_blank()) +
  xlab("GC Content")+
  theme(axis.text=element_text(size=12),axis.title=element_text(size=12))+
  coord_cartesian(xlim = c(0.25, 0.65))+
  scale_x_continuous(breaks=(pretty_breaks()))+
  theme(axis.text.x=element_text(angle=45, hjust=1))



#Plot N50/L50
assem_stat_output2<- assem_stat_output_drop3 %>%
  select(sample, ctg_N50, ctg_L50)

assem_stat_output3<- melt(assem_stat_output2, id = c("sample"))

Fig.S2C<- ggplot(assem_stat_output3, aes(x=value, y=sample, fill=variable)) + 
  geom_bar (stat="identity", position = "dodge")+
  scale_y_discrete(limits=c("15.5m", "15mm", "15mw", "13m"), 
                   labels=c("15.5", "15", "15-w", "13"))+
  theme_bw()+
  theme(axis.ticks.y = element_blank())+
  theme(
    # Hide panel borders and remove grid lines
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    # Change axis line
  )+
  theme(axis.text.y = element_blank())+
  theme(axis.title.y = element_blank())+
  theme(axis.ticks.y = element_blank()) +
  xlab("Value")+
  scale_fill_manual("", values=c("#87d3f8", "#3492C7"), labels=c("L50 (Length)", "N50 (Count)"))+
  theme(legend.position = c(0.65, 0.55), legend.background = element_rect(size=0.3, 
                                                                          colour ="black"),  legend.direction = "vertical") +
  theme(axis.text=element_text(size=12),axis.title=element_text(size=12))+
  ylab ("Depth (m)")+
  scale_x_continuous(breaks=(pretty_breaks()))+
  theme(axis.text.x=element_text(angle=45, hjust=1))



#Plot #Contigs

Fig.S2D<- ggplot(assem_stat_output_drop3, aes(x=n_contigs, y=sample)) + 
  geom_bar(stat = "identity", fill = "#56B4E9", colour = "black")+
  # geom_point(size=3.5, shape=16, color="black")+
  scale_y_discrete(limits=c("15.5m", "15mm", "15mw", "13m"), 
                   labels=c("15.5", "15", "15-w", "13"))+
  theme_bw()+
  theme(axis.ticks.y = element_blank())+
  theme(
    # Hide panel borders and remove grid lines
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    # Change axis line
  )+
  xlab("#Contigs")+
  # theme(axis.text.y = element_blank())+
  #  theme(axis.title.y = element_blank())+
  theme(axis.ticks.y = element_blank()) +
  theme(axis.text=element_text(size=12),axis.title=element_text(size=12))+
  ylab ("Depth (m)")+
  scale_x_continuous(breaks=(pretty_breaks()))+
  theme(axis.text.y = element_blank())+
  theme(axis.title.y = element_blank())+
  theme(axis.ticks.y = element_blank())+
  theme(axis.text.x=element_text(angle=45, hjust=1))

Fig.S2A | Fig.S2B  | Fig.S2C | Fig.S2D #775x400

###############################################################################################################
###############################################################################################################
############################################FIGURE MAIN 1 (Fig.1)##############################################
###############################################################################################################
###############################################################################################################
###############################################################################################################

##CAT STATISTICS

##(1)Non Competitive binning

m5_part1 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/BAT_NC_5m_1.txt")
m5_part1$Depth <- '5m'
m5_part2 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/BAT_NC_5m_2.txt")
m5_part2$Depth <- '5m'
m9 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/BAT_NC_9m.txt")
m9$Depth <- '9m'
m11 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/BAT_NC_11m.txt")
m11$Depth <- '11m'
m13 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/BAT_NC_13m.txt")
m13$Depth <- '13m'
m15mw <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/BAT_NC_15mw.txt")
m15mw$Depth <- '15mw'
m15mm <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/BAT_NC_15mm.txt")
m15mm$Depth <- '15mm'
m15_5m <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/BAT_NC_15_5m.txt")
m15_5m$Depth <- '15_5m'
m17 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/BAT_NC_17m.txt")
m17$Depth <- '17m' 


NC_CAT <- rbind(m5_part1, m5_part2, m9, m11, m13, m15mw, m15mm, m15_5m, m17)
NC_CAT$category <- c("NCB")
NC_CAT$MAG<- NC_CAT$X..bin

##remove chlorophyta non sense bin
NC_CAT2<- NC_CAT[!NC_CAT$X..bin == "17m_Chlophyta_2ks_nohit_filtered_bin2.fa", ]

####(2) Competitive Binning
#CB BAT stats

m5_part1 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/GT_Bins_5m_0.txt")
m5_part1$Depth <- '5m'
m5_part2 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/GT_Bins_5m_1.txt")
m5_part2$Depth <- '5m'
m9 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/GT_Bins_9m.txt")
m9$Depth <- '9m'
m11 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/GT_Bins_11m.txt")
m11$Depth <- '11m'
m13 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/GT_Bins_13m.txt")
m13$Depth <- '13m'
m15mw <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/GT_Bins_15mw.txt")
m15mw$Depth <- '15mw'
m15mm <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/GT_Bins_15mm.txt")
m15mm$Depth <- '15mm'
m15_5m_1 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/GT_Bins_15_5_1.txt")
m15_5m_1$Depth <- '15_5m'
m15_5m <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/GT_Bins_15_5_0.txt")
m15_5m$Depth <- '15_5m'
m17 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/GT_Bins_17m.txt")
m17$Depth <- '17m' 
m17$X..bin<- str_replace(m17$X..bin, "17m", "")


C_CAT <- rbind(m5_part1, m5_part2, m9, m11, m13, m15mw, m15mm, m15_5m, m15_5m_1, m17)
C_CAT$category <- c("CB")

#join two columns
C_CAT = dplyr::mutate(C_CAT, MAG = paste(Depth, X..bin,  sep='_'))

#Merge CAT CB and NCB
CB_NCB_CAT_merge <- rbind(NC_CAT2, C_CAT)

#Extract CAT score
CB_NCB_CAT2<- CB_NCB_CAT_merge %>% separate(superkingdom, c("superkingdom", "confidence"), ": ", extra = "merge")

CB_NCB_CAT2$superkingdom <- sub("^$", "no support", CB_NCB_CAT2$superkingdom) #replace empty cells with no support
CB_NCB_CAT2$confidence[is.na(CB_NCB_CAT2$confidence)] <- "0" #replace empty confidence cells with 0

#Drop viral bins
CB_NCB_CAT3<- CB_NCB_CAT2[!(CB_NCB_CAT2$superkingdom=="Viruses"),]

#Keep High confidence MAGs
CB_NCB_CAT4<- CB_NCB_CAT3[which(CB_NCB_CAT3$confidence>=0.5), ]
CB_NCB_CAT4$MAG<- str_replace(CB_NCB_CAT4$MAG, "__", "_")
CB_NCB_CAT4$MAG <- trimws(CB_NCB_CAT4$MAG)

#Extract names of chemocline bins 
Sub_NCB <- CB_NCB_CAT4[CB_NCB_CAT4$category %in% c("NCB"), ]
Sub_NCB2 <- Sub_NCB[Sub_NCB$Depth %in% c("15mm", "15mw", "15_5m", "13m"), ]
#Sub_NCB2$X..bin<- str_replace(Sub_NCB2$X..bin, "_", "_NC_Bin_")
write.table(Sub_NCB2$X..bin, "G:/My Drive/Github_MS2/R_files_MS2_july/chemocline_NCB_names", quote=F, col.names=FALSE, row.names = F)


Sub_CB <- CB_NCB_CAT4[CB_NCB_CAT4$category %in% c("CB"), ]
Sub_CB2 <- Sub_CB[Sub_CB$Depth %in% c("15mm", "15mw", "15_5m", "13m"), ]
Sub_CB2 = dplyr::mutate(Sub_CB2, name = paste(Depth, X..bin,  sep='_'))
write.table(Sub_CB2$name, "G:/My Drive/Github_MS2/R_files_MS2_july/chemocline_CB_names", quote=F, col.names=FALSE, row.names = F)


##General STATISTICS
#(1) NCB
NC_stat <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/NC_Bins_stats.txt")
NC_stat$MAG<- str_replace_all(NC_stat$filename, "/srv/beegfs/scratch/users/s/saini7/MS2/NON_Comp_Bins/", "")
NC_stat$MAG<- str_replace(NC_stat$MAG, "NC_Bin_", "")
NC_stat$MAG<- str_replace(NC_stat$MAG, "_NC_", "_")
#(CB)
C_stat <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/C_Bins_stats.txt")
C_stat$MAG<- str_replace_all(C_stat$filename, "/srv/beegfs/scratch/users/s/saini7/MS2/LC_competitive_binning_bins/ALL_C_BINS/", "")
C_stat$MAG <- trimws(C_stat$MAG)

#remove column based on name r
#CB_NCB_CAT <- subset(CB_NCB, select=-c(X..bin))
#Bind Non-competitive and competitive BIN stats
stats_wrap_cat<- rbind(NC_stat, C_stat)

#Remove bins less than 0.5 mb size
stats_wrap_cat$size_mbp<- (stats_wrap_cat$contig_bp)/1000000
stats_wrap_cat<- stats_wrap_cat[which(stats_wrap_cat$size_mbp>=0.5), ]

#Merge CAT with Stats
LC_meta<- merge(CB_NCB_CAT4, stats_wrap_cat, by="MAG")

#Remove duplicated rows 
LC_meta2 <- LC_meta[!duplicated(LC_meta$MAG),]

#Drop mixolimnion and chemocline samples 
LC_meta3<-subset(LC_meta2, Depth!="5m" &  Depth!="9m" &  Depth!="11m" &  Depth!="17m")

LC_meta3$Depth_m<- str_replace(LC_meta3$Depth, "mm", ".1")
LC_meta3$Depth_m<- str_replace(LC_meta3$Depth_m, "mw", "")
LC_meta3$Depth_m<- str_replace(LC_meta3$Depth_m, "m", "")
LC_meta3$Depth_m<- str_replace(LC_meta3$Depth_m, "_", ".")
LC_meta3$Depth_m<- as.numeric(LC_meta3$Depth_m)


#Remove one category, FOCOUS ON COMPETITIVE BINNING
LC_meta4<-subset(LC_meta3, category!="NCB")



Fig.1A = ggplot (LC_meta4, aes(y=Depth, fill=superkingdom, label=..count..)) +
  geom_bar (stat="count", position = "dodge")+
  #facet_nested(category + Depth_m ~ ., scales = "free", space = "free", switch="y")+
  scale_fill_manual("Lineage", values = c("#87d3f8", "#3492C7"), 
                    labels=c("Bacteria", "Eukaryota")) +
  theme(
    # Hide panel borders and remove grid lines
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    # Change axis line
  )+
  ylab("Depth (m)")+
  # theme(axis.text.y = element_blank())+
  # theme(axis.title.y = element_blank())+
  theme(axis.ticks.y = element_blank())+
  xlab("MAGs Count")+
  theme(legend.position = c(0.50, 0.95), 
        legend.background = element_rect(size=0.3, 
                                         colour ="black"),  legend.direction = "horizontal") +
  theme(legend.position = "none")+
  geom_label (stat='count')+
  
  #scale_y_continuous(breaks= pretty_breaks(5))+
  theme(axis.text.x=element_text(angle=45, hjust=1))+
  theme(axis.title.y = element_blank())+
  theme(axis.text.y = element_blank())+
  theme(legend.position = "top")+
  guides(
    fill = guide_legend(
      override.aes = aes(label = "")
    )
  )+
  theme_bw()+
  theme(strip.background = element_blank(), strip.text = element_blank())+
  scale_y_discrete(limits=c("15_5m", "15mm", "15mw", "13m"), 
                   labels=c("15.5", "15", "15-w", "13"))+
  theme(axis.text=element_text(size=12),axis.title=element_text(size=12))+
  theme(legend.position = c(0.50, 0.95), 
        legend.background = element_rect(size=0.3, 
                                         colour ="black"),  legend.direction = "vertical")



#Hide background
Fig.1B = ggplot(LC_meta4, aes(y=Depth, x=size_mbp)) +
  geom_boxplot(aes(fill = superkingdom),
               size = 1, outlier.colour=NA)+
  # facet_nested(category + Depth_m ~ ., scales = "free", space = "free", switch="y")+
  scale_fill_manual("Lineage", values = c("#87d3f8", "#3492C7"), 
                    labels=c("Bacteria", "Eukaryota")) +
  
  theme(
    # Hide panel borders and remove grid lines
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    # Change axis line
  )+
  xlab("Depth (m)")+
  # theme(axis.text.y = element_blank())+
  # theme(axis.title.y = element_blank())+
  theme(axis.ticks.y = element_blank())+
  xlab("MAGs Size")+
  theme(legend.position = c(0.50, 0.95), 
        legend.background = element_rect(size=0.3, 
                                         colour ="black"),  legend.direction = "horizontal") +
  theme(axis.text=element_text(size=12),axis.title=element_text(size=12))+
  theme(legend.position = "none")+
  # geom_label (stat='count')+
  
  #scale_y_continuous(breaks= pretty_breaks(5))+
  theme(axis.text.x=element_text(angle=45, hjust=1))+
  theme(axis.title.y = element_blank())+
  theme(axis.text.y = element_blank())+
  xlim(0,30)+
  
  theme(strip.background = element_blank(), strip.text = element_blank())+
  theme_bw()+
  theme(strip.background = element_blank(), strip.text = element_blank())+
  scale_y_discrete(limits=c("15_5m", "15mm", "15mw", "13m"), 
                   labels=c("15.5", "15", "15-w", "13"))+
  theme(axis.text=element_text(size=12),axis.title=element_text(size=12))+
  theme(legend.position = c(0.80, 0.75), 
        legend.background = element_rect(size=0.3, 
                                         colour ="black"),  legend.direction = "vertical")

Fig.1A / Fig.1B


###############################################################################################################
###############################################################################################################
###########################FIGURE MAIN 1 & SUPPLEMENTARY (Fig.1C-D, Fig.S2G)#####################################
###############################################################################################################
###############################################################################################################
###############################################################################################################


##Get busco score for NON COMPETITIVE BINNING
busco_csv <- read.csv("G:/My Drive/Github_MS2/R_files_MS2_july/busco_csv.csv")
busco_csv$bins<- str_replace(busco_csv$Sample_name, "results_lake_bins/", "")
busco_csv$Depth<- sub('\\_.*', '', busco_csv$bins)


#Remove mixolimnion and monimolimnion sample
combine_bin5_drop<-busco_csv[!(busco_csv$Depth=="5m"),] 
combine_bin5_drop1<-combine_bin5_drop[!(combine_bin5_drop$Depth=="9m"),] 
combine_bin5_drop2<-combine_bin5_drop1[!(combine_bin5_drop1$Depth=="11m"),]
combine_bin5_drop3<-combine_bin5_drop2[!(combine_bin5_drop2$Depth=="17m"),]


#Combine cat,stats with busco
busco_csv$bins<- str_replace(busco_csv$Sample_name, "results_lake_bins/", "")

LC_meta3$X..bin <- str_replace(LC_meta3$X..bin, ".fa", "")
LC_meta4<-subset(LC_meta3, category!="CB")


busco_NCB <- merge(LC_meta4,combine_bin5_drop3, by.x="X..bin", by.y="bins",all.x = T)
#Drop columns by NAME

R_NCB_sub<- subset(busco_NCB, select=-c(filename,Sample_name, X..bin, Depth.y, Depth_m))

write.csv(R_NCB_sub, "G:/My Drive/Github_MS2/R_files_MS2_july/NCB_Table_2.csv", row.names = F)


##select dataset eukaryotes

mySubset <- combine_bin5_drop3[ combine_bin5_drop3$Dataset %in% c("eukaryota_odb10", "chlorophyta_odb10", "stramenopiles_odb10"), ]

d<-mySubset[(mySubset$Single>=10 & mySubset$Missing<=50),]

batch_busco_final<- d %>%
  select(bins, Single, Duplicated, Fragmented, Missing)

batch_busco_NCB<- melt(batch_busco_final, id.vars = c("bins"))
#batch_busco_NCB$category<- c("NCB")
names(batch_busco_NCB)[names(batch_busco_NCB) == 'bins'] <- 'MAG'

batch_busco_1 <- merge(batch_busco_NCB, busco_NCB, by.x="MAG", by.y="X..bin")

batch_busco_1a<- batch_busco_1[ , -which(names(batch_busco_1) %in% c("MAG.y","Depth.y"))]
names(batch_busco_1a)[names(batch_busco_1a) == 'Depth.x'] <- 'Depth'


##Get busco score or Competitive Binning FIG. 1C
busco_cb <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/CB_autolineage_summary.txt")
busco_cb$bins<- str_replace(busco_cb$Sample_name, "/home/users/s/saini7/scratch/MS2/chemocline_bins/busco_out_09_07_2022/", "")
#busco_cb$Depth<- sub('\\_Bin_.*', '', busco_cb$bins) #Delete everything after a pattern


LC_meta5<-subset(LC_meta3, category!="NCB")
LC_meta5$MAG<- str_replace(LC_meta5$MAG, ".fa", "")
busco_CB <- merge(LC_meta5,busco_cb, by.x="MAG", by.y="bins",all.x = T)
R_busco_CB<- subset(busco_CB, select=-c(filename,Sample_name, X..bin, Depth_m))

write.csv(R_busco_CB, "G:/My Drive/Github_MS2/R_files_MS2_july/CB_Table_1.csv", row.names = F)


##select dataset eukaryotes

mySubset_CB <- busco_CB[busco_CB$Dataset %in% c("eukaryota_odb10", "chlorophyta_odb10", "stramenopiles_odb10"), ]
mySubset_CB_df<- as.data.frame(mySubset_CB)
newdata2 <- mySubset_CB_df[which(!mySubset_CB_df$Complete < 10 & !mySubset_CB_df$Missing > 50), ]

#d<-mySubset_CB_df[(mySubset_CB_df$Single>=10 & mySubset_CB_df$Missing<=50),]

batch_busco_final<- newdata2 %>%
  select(MAG, Single, Duplicated, Fragmented, Missing)

batch_busco_CB<- melt(batch_busco_final, id.vars = c("MAG"))

##Merge eukaryotic NCB and CB

batch_busco_2 <- merge(batch_busco_CB, busco_CB, by="MAG")

batch_busco_2<- batch_busco_2[ , -which(names(batch_busco_2) %in% c("X..bin"))]

batch_busco_merge <- rbind(batch_busco_1a, batch_busco_2)

batch_busco_merge$Depth_m<- str_replace(batch_busco_merge$Depth, "mm", ".1")
batch_busco_merge$Depth_m<- str_replace(batch_busco_merge$Depth_m, "mw", "")
batch_busco_merge$Depth_m<- str_replace(batch_busco_merge$Depth_m, "m", "")
batch_busco_merge$Depth_m<- str_replace(batch_busco_merge$Depth_m, "_", ".")

batch_busco_merge$Depth_m<- as.numeric(batch_busco_merge$Depth_m)

#Hide NC
batch_busco_merge2<-subset(batch_busco_merge, category!="NCB")

Fig.1G<- ggplot(batch_busco_merge2, aes(x=as.numeric(value), y=MAG, label=value)) + 
  geom_bar(aes(fill=variable),stat="identity", position = position_stack(reverse = T))+
  scale_y_discrete(limits=c("15_5m_Bin_87-contigs","15_5m_Bin_232-contigs","15mm_Bin_170-contigs", 
                            "15mw_Bin_36-contigs", "13m_Bin_209-contigs", "13m_Bin_181-contigs"))+
  
  #facet_nested(category + Depth_m ~ ., scales = "free", space = "free", switch = 'y')+ #switch = 'y'
  xlab("Busco score (%)")+
  scale_fill_manual("Busco score", values=c("#87d3f8", "#3492C7","#ffe119", "#D53E4F"), 
                    labels =c(" Complete (C) and single-copy (S)  ",
                              " Complete (C) and duplicated (D)",
                              " Fragmented (F)  ",
                              " Missing (M)"))+
  theme_bw()+
  theme(axis.ticks.y = element_blank())+
  theme(
    # Hide panel borders and remove grid lines
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    # Change axis line
  )+
  geom_label_repel(data=subset(batch_busco_merge2, value>90), aes(label=value, fill=variable), size = 4, 
                   xlim = c(-Inf, 15), ylim = c(-Inf, Inf),
                   min.segment.length = Inf, show_guide  = FALSE)+
  theme(axis.title.y = element_blank())+
  theme(axis.text=element_text(size=12),axis.title=element_text(size=12))+
  theme(legend.background = element_rect(size=0.3, 
                                         colour ="black"),  
        legend.direction = "horizontal")+
  guides(fill = guide_legend(nrow = 1))+
  theme(axis.text.y = element_blank())+
  theme(legend.position = "none")

#Fig. S2G
batch_busco_merge3<-subset(batch_busco_merge, category!="CB")

#Fig. S2
Fig.S2G<- ggplot(batch_busco_merge3, aes(x=as.numeric(value), y=MAG, label=value)) + 
  geom_bar(aes(fill=variable),stat="identity", position = position_stack(reverse = T))+
  scale_y_discrete(limits=c("15_5m_161","15_5m_12","15mm_94", "15mw_87", "13m_164", "13m_9", "13m_230"))+
  #facet_nested(category + Depth_m ~ ., scales = "free", space = "free", switch = 'y')+ #switch = 'y'
  xlab("Busco score (%)")+
  scale_fill_manual("Busco score", values=c("#87d3f8", "#3492C7","#ffe119", "#D53E4F"), 
                    labels =c(" Complete (C) and single-copy (S)  ",
                              " Complete (C) and duplicated (D)",
                              " Fragmented (F)  ",
                              " Missing (M)"))+
  theme_bw()+
  theme(axis.ticks.y = element_blank())+
  theme(
    # Hide panel borders and remove grid lines
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    # Change axis line
  )+
  geom_label_repel(data=subset(batch_busco_merge3, value>90), aes(label=value, fill=variable), size = 4, 
                   xlim = c(-Inf, 15), ylim = c(-Inf, Inf),
                   min.segment.length = Inf, show_guide  = FALSE)+
  theme(axis.title.y = element_blank())+
  theme(axis.text=element_text(size=12),axis.title=element_text(size=12))+
  theme(legend.background = element_rect(size=0.3, 
                                         colour ="black"),  
        legend.direction = "horizontal")+
  guides(fill = guide_legend(nrow = 1))+
  theme(axis.text.y = element_blank())+
  theme(legend.position = "none")




#####Phyloflash Eukaryotic SSU rRNA (Ribosomal)

test.phyloFlash_compare.ntu_table2<- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/test.phyloFlash_compare.ntu_table.tsv", header=FALSE, as.is=T)

test.phyloFlash_compare.ntu_table2<- test.phyloFlash_compare.ntu_table2[-c(1:1373), ]
#test.phyloFlash_compare.ntu_table3<- test.phyloFlash_compare.ntu_table2[which(test.phyloFlash_compare.ntu_table2$V3>=100), ]

k <- 3 # keep first 3 fields only

test.phyloFlash_compare.ntu_table2$V1<- do.call(paste, c(read.table(text = test.phyloFlash_compare.ntu_table2$V1, sep = ";")[1:k], sep = ";"))

test.phyloFlash_compare.ntu_table2$V1[test.phyloFlash_compare.ntu_table2$V3 < 100] <- "Others"

test.phyloFlash_compare.ntu_table2[] <- lapply(test.phyloFlash_compare.ntu_table2, gsub, pattern = "(", replacement = "", fixed = TRUE)
test.phyloFlash_compare.ntu_table2[] <- lapply(test.phyloFlash_compare.ntu_table2, gsub, pattern = ")", replacement = "", fixed = TRUE)

test.phyloFlash_compare.ntu_table3<- as.data.frame(test.phyloFlash_compare.ntu_table2)


##Assign column names
colnames(test.phyloFlash_compare.ntu_table3) = c("label1", "label2", "label3") 
test.phyloFlash_compare.ntu_table3$label3<- as.numeric(test.phyloFlash_compare.ntu_table3$label3)

###Calculate relative abundance

test.phyloFlash_c4c<- test.phyloFlash_compare.ntu_table3 %>%
  group_by(label2) %>%
  mutate(fre = label3 / sum(label3)*100)




#drop sample 5, 9, 11, 17


test.phyloFlash_c<-test.phyloFlash_c4c[!(test.phyloFlash_c4c$label2=="Lib_5m"),] 
test.phyloFlash_c1<-test.phyloFlash_c[!(test.phyloFlash_c$label2=="Lib_9m"),] 
test.phyloFlash_c2<-test.phyloFlash_c1[!(test.phyloFlash_c1$label2=="Lib_11m"),]
test.phyloFlash_c3<-test.phyloFlash_c2[!(test.phyloFlash_c2$label2=="Lib_17m"),]



test.phyloFlash_c3$label1<- str_replace(test.phyloFlash_c3$label1, "Eukaryota;Eukaryota;Eukaryota", "Others")


#Phyloflash Eukaryotic Community Classification
Fig.1D<- ggplot(test.phyloFlash_c3, aes(x=label2, y=as.numeric(fre), fill=label1)) + 
  geom_bar(stat="identity", position='fill', color="transparent")+
  
  
  scale_x_discrete(limits=c("Lib_15p5m", "Lib_15mw", "Lib_15mm", "Lib_13m"), 
                   labels=c("15.5", "15", "15-w", "13"))+
  scale_fill_manual(values = c("#354f5f", "#04355C", "#084594", "#2171B5","#4292C6", 
                               "#6BAED6", "#9ECAE1", "#C6DBEF","#bcc4ca","#4c6271", 
                               "#a5b1b8"))+ 
  coord_flip()+
  xlab("Depth (m)")+
  
  ylab("Relative Abundance (Eukaryotic SSU rRNA)")+
  guides(fill=guide_legend(nrow=4, title="Classification"))+
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))+
  #theme_bw()+
  theme(axis.ticks.y = element_blank())+
  theme(
    # Hide panel borders and remove grid lines
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    # Change axis line
  )+
  theme(legend.position = "bottom")+
  theme(legend.background = element_rect(size=0.3, 
                                         colour ="black"),  legend.direction = "horizontal")+
  scale_fill_brewer(palette = "Spectral")+
  theme_bw()+
  theme(legend.position = "none")+
  theme(axis.text=element_text(size=12),axis.title=element_text(size=12))


Fig.1D #900x300


((Fig.1A / Fig.1B)  |  (Fig.1D)) #800x500



###############################################################################################################
###############################################################################################################
############################################SUPPLEMENTARY  (Fig.S2)############################################
###############################################################################################################
###############################################################################################################
###############################################################################################################


#Remove one category, FOCOUS ON COMPETITIVE BINNING
LC_meta5<-subset(LC_meta3, category!="CB")

Fig.S2E = ggplot (LC_meta5, aes(y=Depth, fill=superkingdom, label=..count..)) +
  geom_bar (stat="count", position = "dodge")+
  #facet_nested(category + Depth_m ~ ., scales = "free", space = "free", switch="y")+
  scale_fill_manual("Lineage", values = c("#87d3f8", "#3492C7"), 
                    labels=c("Bacteria", "Eukaryota")) +
  theme(
    # Hide panel borders and remove grid lines
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    # Change axis line
  )+
  ylab("Depth (m)")+
  # theme(axis.text.y = element_blank())+
  # theme(axis.title.y = element_blank())+
  theme(axis.ticks.y = element_blank())+
  xlab("MAGs Count")+
  theme(legend.position = c(0.50, 0.95), 
        legend.background = element_rect(size=0.3, 
                                         colour ="black"),  legend.direction = "horizontal") +
  theme(legend.position = "none")+
  geom_label (stat='count')+
  
  #scale_y_continuous(breaks= pretty_breaks(5))+
  theme(axis.text.x=element_text(angle=45, hjust=1))+
  theme(axis.title.y = element_blank())+
  theme(axis.text.y = element_blank())+
  theme(legend.position = "top")+
  guides(
    fill = guide_legend(
      override.aes = aes(label = "")
    )
  )+
  theme_bw()+
  theme(strip.background = element_blank(), strip.text = element_blank())+
  scale_y_discrete(limits=c("15_5m", "15mm", "15mw", "13m"), 
                   labels=c("15.5", "15", "15-w", "13"))+
  theme(axis.text=element_text(size=12),axis.title=element_text(size=12))+
  theme(legend.position = c(0.75, 0.75), 
        legend.background = element_rect(size=0.3, 
                                         colour ="black"),  legend.direction = "vertical")

#Hide background

Fig.S2F = ggplot(LC_meta5, aes(y=Depth, x=size_mbp)) +
  geom_boxplot(aes(fill = superkingdom),
               size = 1, outlier.colour=NA)+
  # facet_nested(category + Depth_m ~ ., scales = "free", space = "free", switch="y")+
  scale_fill_manual("Lineage", values = c("#87d3f8", "#3492C7"), 
                    labels=c("Bacteria", "Eukaryota")) +
  
  theme(
    # Hide panel borders and remove grid lines
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    # Change axis line
  )+
  xlab("Depth (m)")+
  # theme(axis.text.y = element_blank())+
  # theme(axis.title.y = element_blank())+
  theme(axis.ticks.y = element_blank())+
  xlab("MAGs Size")+
  theme(legend.position = c(0.50, 0.95), 
        legend.background = element_rect(size=0.3, 
                                         colour ="black"),  legend.direction = "horizontal") +
  theme(axis.text=element_text(size=12),axis.title=element_text(size=12))+
  theme(legend.position = "none")+
  # geom_label (stat='count')+
  
  #scale_y_continuous(breaks= pretty_breaks(5))+
  theme(axis.text.x=element_text(angle=45, hjust=1))+
  theme(axis.title.y = element_blank())+
  theme(axis.text.y = element_blank())+
  xlim(0,30)+
  
  theme(strip.background = element_blank(), strip.text = element_blank())+
  theme_bw()+
  theme(strip.background = element_blank(), strip.text = element_blank())+
  scale_y_discrete(limits=c("15_5m", "15mm", "15mw", "13m"), 
                   labels=c("15.5", "15", "15-w", "13"))+
  theme(axis.text=element_text(size=12),axis.title=element_text(size=12))+
  theme(legend.position = c(0.80, 0.75), 
        legend.background = element_rect(size=0.3, 
                                         colour ="black"),  legend.direction = "vertical")

Fig.S2E / Fig.S2F


##Stich Plots for Final Figure
(Fig.S2A | Fig.S2B  | Fig.S2C | Fig.S2D) / (Fig.S2E / Fig.S2F | Fig.S2G) + plot_layout(heights = c(1, 2)) #800x700


###############################################################################################################
###############################################################################################################
############################################FIGURE (Fig.2)#####################################################
###############################################################################################################
###############################################################################################################
###############################################################################################################


lib_17m_mapped_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/chloro_ph/Cov_mapped_5m_r.txt")
lib_17m_mapped_5m_r$libraries <- "Chlorobium_ph"
lib_17m_mapped_5m_r$Depth <- "5m"


lib_17m_mapped_9m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/chloro_ph/Cov_mapped_9m_r.txt")
lib_17m_mapped_9m_r$libraries <- "Chlorobium_ph"
lib_17m_mapped_9m_r$Depth <- "9m"


lib_17m_mapped_11m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/chloro_ph/Cov_mapped_11m_r.txt")
lib_17m_mapped_11m_r$libraries <- "Chlorobium_ph"
lib_17m_mapped_11m_r$Depth <- "11m"


lib_17m_mapped_13m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/chloro_ph/Cov_mapped_13m_r.txt")
lib_17m_mapped_13m_r$libraries <- "Chlorobium_ph"
lib_17m_mapped_13m_r$Depth <- "13m"


lib_17m_mapped_15mm_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/chloro_ph/Cov_mapped_15mm_r.txt")
lib_17m_mapped_15mm_r$libraries <- "Chlorobium_ph"
lib_17m_mapped_15mm_r$Depth <- "15mm"


lib_17m_mapped_15mw_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/chloro_ph/Cov_mapped_15mw_r.txt")
lib_17m_mapped_15mw_r$libraries <- "Chlorobium_ph"
lib_17m_mapped_15mw_r$Depth <- "15mw"


lib_17m_mapped_15_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/chloro_ph/Cov_mapped_15_5m_r.txt")
lib_17m_mapped_15_5m_r$libraries <- "Chlorobium_ph"
lib_17m_mapped_15_5m_r$Depth <- "15_5m"


lib_17m_mapped_17m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/chloro_ph/Cov_mapped_17m_r.txt")
lib_17m_mapped_17m_r$libraries <- "Chlorobium_ph"
lib_17m_mapped_17m_r$Depth <- "17m"



VR_chloroph <- rbind(lib_17m_mapped_5m_r, lib_17m_mapped_11m_r, lib_17m_mapped_9m_r, lib_17m_mapped_13m_r, lib_17m_mapped_15mm_r, lib_17m_mapped_15mw_r, lib_17m_mapped_15_5m_r, lib_17m_mapped_17m_r)


lib_17m_mapped_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/chloro_sp/Cov_mapped_5m_r.txt")
lib_17m_mapped_5m_r$libraries <- "Chlorobium_sp"
lib_17m_mapped_5m_r$Depth <- "5m"


lib_17m_mapped_9m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/chloro_sp/Cov_mapped_9m_r.txt")
lib_17m_mapped_9m_r$libraries <- "Chlorobium_sp"
lib_17m_mapped_9m_r$Depth <- "9m"


lib_17m_mapped_11m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/chloro_sp/Cov_mapped_11m_r.txt")
lib_17m_mapped_11m_r$libraries <- "Chlorobium_sp"
lib_17m_mapped_11m_r$Depth <- "11m"


lib_17m_mapped_13m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/chloro_sp/Cov_mapped_13m_r.txt")
lib_17m_mapped_13m_r$libraries <- "Chlorobium_sp"
lib_17m_mapped_13m_r$Depth <- "13m"


lib_17m_mapped_15mm_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/chloro_sp/Cov_mapped_15mm_r.txt")
lib_17m_mapped_15mm_r$libraries <- "Chlorobium_sp"
lib_17m_mapped_15mm_r$Depth <- "15mm"


lib_17m_mapped_15mw_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/chloro_sp/Cov_mapped_15mw_r.txt")
lib_17m_mapped_15mw_r$libraries <- "Chlorobium_sp"
lib_17m_mapped_15mw_r$Depth <- "15mw"


lib_17m_mapped_15_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/chloro_sp/Cov_mapped_15_5m_r.txt")
lib_17m_mapped_15_5m_r$libraries <- "Chlorobium_sp"
lib_17m_mapped_15_5m_r$Depth <- "15_5m"


lib_17m_mapped_17m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/chloro_sp/Cov_mapped_17m_r.txt")
lib_17m_mapped_17m_r$libraries <- "Chlorobium_sp"
lib_17m_mapped_17m_r$Depth <- "17m"



VR_chlorosp <- rbind(lib_17m_mapped_5m_r, lib_17m_mapped_11m_r, lib_17m_mapped_9m_r, lib_17m_mapped_13m_r, lib_17m_mapped_15mm_r, lib_17m_mapped_15mw_r, lib_17m_mapped_15_5m_r, lib_17m_mapped_17m_r)



lib_17m_mapped_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/chlorophyta/Cov_mapped_5m_r.txt")
lib_17m_mapped_5m_r$libraries <- "Chlorella"
lib_17m_mapped_5m_r$Depth <- "5m"


lib_17m_mapped_9m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/chlorophyta/Cov_mapped_9m_r.txt")
lib_17m_mapped_9m_r$libraries <- "Chlorella"
lib_17m_mapped_9m_r$Depth <- "9m"


lib_17m_mapped_11m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/chlorophyta/Cov_mapped_11m_r.txt")
lib_17m_mapped_11m_r$libraries <- "Chlorella"
lib_17m_mapped_11m_r$Depth <- "11m"


lib_17m_mapped_13m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/chlorophyta/Cov_mapped_13m_r.txt")
lib_17m_mapped_13m_r$libraries <- "Chlorella"
lib_17m_mapped_13m_r$Depth <- "13m"


lib_17m_mapped_15mm_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/chlorophyta/Cov_mapped_15mm_r.txt")
lib_17m_mapped_15mm_r$libraries <- "Chlorella"
lib_17m_mapped_15mm_r$Depth <- "15mm"


lib_17m_mapped_15mw_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/chlorophyta/Cov_mapped_15mw_r.txt")
lib_17m_mapped_15mw_r$libraries <- "Chlorella"
lib_17m_mapped_15mw_r$Depth <- "15mw"


lib_17m_mapped_15_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/chlorophyta/Cov_mapped_15_5m_r.txt")
lib_17m_mapped_15_5m_r$libraries <- "Chlorella"
lib_17m_mapped_15_5m_r$Depth <- "15_5m"


lib_17m_mapped_17m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/chlorophyta/Cov_mapped_17m_r.txt")
lib_17m_mapped_17m_r$libraries <- "Chlorella"
lib_17m_mapped_17m_r$Depth <- "17m"



VR_chlorella <- rbind(lib_17m_mapped_5m_r, lib_17m_mapped_11m_r, lib_17m_mapped_9m_r, lib_17m_mapped_13m_r, lib_17m_mapped_15mm_r, lib_17m_mapped_15mw_r, lib_17m_mapped_15_5m_r, lib_17m_mapped_17m_r)



lib_17m_mapped_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/thiod/Cov_mapped_5m_r.txt")
lib_17m_mapped_5m_r$libraries <- "Thiod"
lib_17m_mapped_5m_r$Depth <- "5m"


lib_17m_mapped_9m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/thiod/Cov_mapped_9m_r.txt")
lib_17m_mapped_9m_r$libraries <- "Thiod"
lib_17m_mapped_9m_r$Depth <- "9m"


lib_17m_mapped_11m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/thiod/Cov_mapped_11m_r.txt")
lib_17m_mapped_11m_r$libraries <- "Thiod"
lib_17m_mapped_11m_r$Depth <- "11m"


lib_17m_mapped_13m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/thiod/Cov_mapped_13m_r.txt")
lib_17m_mapped_13m_r$libraries <- "Thiod"
lib_17m_mapped_13m_r$Depth <- "13m"


lib_17m_mapped_15mm_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/thiod/Cov_mapped_15mm_r.txt")
lib_17m_mapped_15mm_r$libraries <- "Thiod"
lib_17m_mapped_15mm_r$Depth <- "15mm"


lib_17m_mapped_15mw_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/thiod/Cov_mapped_15mw_r.txt")
lib_17m_mapped_15mw_r$libraries <- "Thiod"
lib_17m_mapped_15mw_r$Depth <- "15mw"


lib_17m_mapped_15_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/thiod/Cov_mapped_15_5m_r.txt")
lib_17m_mapped_15_5m_r$libraries <- "Thiod"
lib_17m_mapped_15_5m_r$Depth <- "15_5m"


lib_17m_mapped_17m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/thiod/Cov_mapped_17m_r.txt")
lib_17m_mapped_17m_r$libraries <- "Thiod"
lib_17m_mapped_17m_r$Depth <- "17m"



VR_thiod <- rbind(lib_17m_mapped_5m_r, lib_17m_mapped_11m_r, lib_17m_mapped_9m_r, lib_17m_mapped_13m_r, lib_17m_mapped_15mm_r, lib_17m_mapped_15mw_r, lib_17m_mapped_15_5m_r, lib_17m_mapped_17m_r)


lib_17m_mapped_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/thiocys/Cov_mapped_5m_r.txt")
lib_17m_mapped_5m_r$libraries <- "thiocys"
lib_17m_mapped_5m_r$Depth <- "5m"


lib_17m_mapped_9m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/thiocys/Cov_mapped_9m_r.txt")
lib_17m_mapped_9m_r$libraries <- "thiocys"
lib_17m_mapped_9m_r$Depth <- "9m"


lib_17m_mapped_11m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/thiocys/Cov_mapped_11m_r.txt")
lib_17m_mapped_11m_r$libraries <- "thiocys"
lib_17m_mapped_11m_r$Depth <- "11m"


lib_17m_mapped_13m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/thiocys/Cov_mapped_13m_r.txt")
lib_17m_mapped_13m_r$libraries <- "thiocys"
lib_17m_mapped_13m_r$Depth <- "13m"


lib_17m_mapped_15mm_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/thiocys/Cov_mapped_15mm_r.txt")
lib_17m_mapped_15mm_r$libraries <- "thiocys"
lib_17m_mapped_15mm_r$Depth <- "15mm"


lib_17m_mapped_15mw_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/thiocys/Cov_mapped_15mw_r.txt")
lib_17m_mapped_15mw_r$libraries <- "thiocys"
lib_17m_mapped_15mw_r$Depth <- "15mw"


lib_17m_mapped_15_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/thiocys/Cov_mapped_15_5m_r.txt")
lib_17m_mapped_15_5m_r$libraries <- "thiocys"
lib_17m_mapped_15_5m_r$Depth <- "15_5m"


lib_17m_mapped_17m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/thiocys/Cov_mapped_17m_r.txt")
lib_17m_mapped_17m_r$libraries <- "thiocys"
lib_17m_mapped_17m_r$Depth <- "17m"



VR_thiocys <- rbind(lib_17m_mapped_5m_r, lib_17m_mapped_11m_r, lib_17m_mapped_9m_r, lib_17m_mapped_13m_r, lib_17m_mapped_15mm_r, lib_17m_mapped_15mw_r, lib_17m_mapped_15_5m_r, lib_17m_mapped_17m_r)


lib_17m_mapped_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/lampo/Cov_mapped_5m_r.txt")
lib_17m_mapped_5m_r$libraries <- "lampo"
lib_17m_mapped_5m_r$Depth <- "5m"


lib_17m_mapped_9m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/lampo/Cov_mapped_9m_r.txt")
lib_17m_mapped_9m_r$libraries <- "lampo"
lib_17m_mapped_9m_r$Depth <- "9m"


lib_17m_mapped_11m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/lampo/Cov_mapped_11m_r.txt")
lib_17m_mapped_11m_r$libraries <- "lampo"
lib_17m_mapped_11m_r$Depth <- "11m"


lib_17m_mapped_13m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/lampo/Cov_mapped_13m_r.txt")
lib_17m_mapped_13m_r$libraries <- "lampo"
lib_17m_mapped_13m_r$Depth <- "13m"


lib_17m_mapped_15mm_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/lampo/Cov_mapped_15mm_r.txt")
lib_17m_mapped_15mm_r$libraries <- "lampo"
lib_17m_mapped_15mm_r$Depth <- "15mm"


lib_17m_mapped_15mw_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/lampo/Cov_mapped_15mw_r.txt")
lib_17m_mapped_15mw_r$libraries <- "lampo"
lib_17m_mapped_15mw_r$Depth <- "15mw"


lib_17m_mapped_15_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/lampo/Cov_mapped_15_5m_r.txt")
lib_17m_mapped_15_5m_r$libraries <- "lampo"
lib_17m_mapped_15_5m_r$Depth <- "15_5m"


lib_17m_mapped_17m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/lampo/Cov_mapped_17m_r.txt")
lib_17m_mapped_17m_r$libraries <- "lampo"
lib_17m_mapped_17m_r$Depth <- "17m"



VR_lamp <- rbind(lib_17m_mapped_5m_r, lib_17m_mapped_11m_r, lib_17m_mapped_9m_r, lib_17m_mapped_13m_r, lib_17m_mapped_15mm_r, lib_17m_mapped_15mw_r, lib_17m_mapped_15_5m_r, lib_17m_mapped_17m_r)


lib_17m_mapped_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/chromat/Cov_mapped_5m_r.txt")
lib_17m_mapped_5m_r$libraries <- "chromat"
lib_17m_mapped_5m_r$Depth <- "5m"


lib_17m_mapped_9m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/chromat/Cov_mapped_9m_r.txt")
lib_17m_mapped_9m_r$libraries <- "lampo"
lib_17m_mapped_9m_r$Depth <- "9m"


lib_17m_mapped_11m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/chromat/Cov_mapped_11m_r.txt")
lib_17m_mapped_11m_r$libraries <- "chromat"
lib_17m_mapped_11m_r$Depth <- "11m"


lib_17m_mapped_13m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/chromat/Cov_mapped_13m_r.txt")
lib_17m_mapped_13m_r$libraries <- "chromat"
lib_17m_mapped_13m_r$Depth <- "13m"


lib_17m_mapped_15mm_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/chromat/Cov_mapped_15mm_r.txt")
lib_17m_mapped_15mm_r$libraries <- "chromat"
lib_17m_mapped_15mm_r$Depth <- "15mm"


lib_17m_mapped_15mw_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/chromat/Cov_mapped_15mw_r.txt")
lib_17m_mapped_15mw_r$libraries <- "chromat"
lib_17m_mapped_15mw_r$Depth <- "15mw"


lib_17m_mapped_15_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/chromat/Cov_mapped_15_5m_r.txt")
lib_17m_mapped_15_5m_r$libraries <- "chromat"
lib_17m_mapped_15_5m_r$Depth <- "15_5m"


lib_17m_mapped_17m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/psb_gsb/chromat/Cov_mapped_17m_r.txt")
lib_17m_mapped_17m_r$libraries <- "chromat"
lib_17m_mapped_17m_r$Depth <- "17m"



VR_chromat <- rbind(lib_17m_mapped_5m_r, lib_17m_mapped_11m_r, lib_17m_mapped_9m_r, lib_17m_mapped_13m_r, lib_17m_mapped_15mm_r, lib_17m_mapped_15mw_r, lib_17m_mapped_15_5m_r, lib_17m_mapped_17m_r)
final_2fig<-  rbind(VR_chlorosp, VR_chloroph, VR_chlorella, VR_thiod, VR_thiocys, VR_lamp, VR_chromat)
final_2fig$libraries

final_2fig_mean_reads<- final_2fig %>%
 dplyr:: group_by(Depth, libraries) %>%
  dplyr::  summarise(mean = mean(numreads), n = n())


final_2fig_mean_cov<- final_2fig %>%
  dplyr:: group_by(Depth, libraries) %>%
  dplyr::  summarise(mean = mean(meandepth), n = n())





Fig.2D<- ggplot(final_2fig, aes(y=Depth, x=numreads)) +
  #geom_jitter(
  #  aes(color = libraries), alpha=0.05, 
  #  position = position_jitter(0.2),
  #  size = 1.2
  #) +
  stat_summary(
    aes(color = libraries),
    fun.data="mean_sdl",  fun.args = list(mult=1), 
    geom = "pointrange",  size = 0.5
  )+
  scale_y_discrete(limits=c("17m","","15_5m","15mm", "15mw","13m", "", "11m", "9m", "5m", ""), 
                   labels=c("17","","15.5","15", "15-w","13", "", "11", "9", "5", ""))+
  ylab("Depth (m)")+
  scale_color_manual("MAGs", values = c("Chlorella" = "#D95F02", "Chlorobium_ph" = "#1B9E77", "Thiod" =  "#666666",
                                        "chromat" = "#E7298A", "lampo" = "#E6AB02", "thiocys" = "#A6761D", "Chlorobium_sp" = "#66A61E"))+
  theme_bw()+
  theme(axis.ticks.y = element_blank())+
  theme(
    # Hide panel borders and remove grid lines
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    # Change axis line
  )+
  xlab("#Reads")+
  # theme(axis.text.y = element_blank())+
  #  theme(axis.title.y = element_blank())+
  annotate("text", x = 10000, y = 11, label = "Mixolimnion")+
  annotate("text", x = 10000, y = 7, label = "Chemocline")+
  annotate("text", x = 10000, y = 2, label = "Monimolimnion")+
  theme(legend.position = c(0.45, 0.75), legend.direction = "horizontal",
        legend.background = element_rect(size=0.3, colour ="black", 
                                         fill = "transparent"))+
  theme(legend.position = "none")+
  scale_x_continuous(breaks=(pretty_breaks()))+
  theme(axis.text.x=element_text(angle=45, hjust=1))+
  xlim(0,35000)+
  #theme(axis.text.y = element_blank())+
  #theme(axis.title.y = element_blank())+
  theme(legend.position = "none")+
  theme(axis.ticks.y = element_blank())


Fig.2E<- ggplot(final_2fig, aes(y=Depth, x=meandepth)) + 
 # geom_jitter(
  #  aes(color = libraries), alpha=0.05, 
  #  position = position_jitter(0.2),
  #  size = 1.2
  #) +
  stat_summary(
    aes(color = libraries),
    fun.data="mean_sdl",  fun.args = list(mult=1), 
    geom = "pointrange",  size = 0.5
  )+
  scale_y_discrete(limits=c("17m","","15_5m","15mm", "15mw","13m", "", "11m", "9m", "5m", ""), 
                   labels=c("17","","15.5","15", "15-w","13", "", "11", "9", "5", ""))+
  scale_color_manual("MAGs", values = c("Chlorella" = "#D95F02", "Chlorobium_ph" = "#1B9E77", "Thiod" =  "#666666",
                                        "chromat" = "#E7298A", "lampo" = "#E6AB02", "thiocys" = "#A6761D", "Chlorobium_sp" = "#66A61E"),
                     breaks=c("Chlorella", "Chlorobium_ph", "Thiod",
                              "chromat" , "lampo", "thiocys", "Chlorobium_sp"))+
  ylab("Depth (m)")+
  theme_bw()+
  theme(axis.ticks.y = element_blank())+
  theme(
    # Hide panel borders and remove grid lines
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    # Change axis line
  )+
  
  xlab("Mean Depth of Coverage")+
  theme(axis.text.y = element_blank())+
  theme(axis.title.y = element_blank())+
  annotate("text", x = 60, y = 11, label = "Mixolimnion")+
  annotate("text", x = 60, y = 7, label = "Chemocline")+
  annotate("text", x = 60, y = 2, label = "Monimolimnion")+
  theme(legend.position = c(0.45, 0.75), legend.direction = "horizontal",
        legend.background = element_rect(size=0.3, colour ="black", 
                                         fill = "transparent"))+
  theme(legend.position = "none")+
  xlim(0,200)
  
  
  
  
  


  
##Cover M

CV_5mSCM <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Main_MAGs_coverage_5m_mean.tsv", header=T)
colnames(CV_5mSCM)[2] <- "Rel_Abun"
CV_5mSCM$Depth <- "5m"

CV_9mSCM <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Main_MAGs_coverage_9m_mean.tsv", header=T)
colnames(CV_9mSCM)[2] <- "Rel_Abun"
CV_9mSCM$Depth <- "9m"

CV_11mSCM <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Main_MAGs_coverage_11m_mean.tsv", header=T)
colnames(CV_11mSCM)[2] <- "Rel_Abun"
CV_11mSCM$Depth <- "11m"

CV_13mSCM <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Main_MAGs_coverage_13m_mean.tsv", header=T)
colnames(CV_13mSCM)[2] <- "Rel_Abun"
CV_13mSCM$Depth <- "13m"

CV_15mmSCM <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Main_MAGs_coverage_15mm_mean.tsv", header=T)
colnames(CV_15mmSCM)[2] <- "Rel_Abun"
CV_15mmSCM$Depth <- "15mm"

CV_15mwSCM <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Main_MAGs_coverage_15mw.tsv", header=T)
colnames(CV_15mwSCM)[2] <- "Rel_Abun"
CV_15mwSCM$Depth <- "15mw"

CV_15_5mSCM <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Main_MAGs_coverage_15_5m_mean.tsv", header=T)
colnames(CV_15_5mSCM)[2] <- "Rel_Abun"
CV_15_5mSCM$Depth <- "15_5m"

CV_17mSCM <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Main_MAGs_coverage_17m_mean.tsv", header=T)
colnames(CV_17mSCM)[2] <- "Rel_Abun"
CV_17mSCM$Depth <- "17m"

Cover_merge_cat_2<- rbind(CV_5mSCM, CV_9mSCM, CV_11mSCM, CV_13mSCM, CV_15mmSCM, CV_15mwSCM, CV_15_5mSCM, CV_17mSCM)

Cover_merge_ca <- subset(Cover_merge_cat_2, Genome != "unmapped")
Cover_merge_ca3 <- subset(Cover_merge_ca, Genome != "chlorobium_15mm_20")
Cover_merge_ca5 <- subset(Cover_merge_ca3, Genome != "chlorophyta_13m_164")
Cover_merge_ca6 <- subset(Cover_merge_ca5, Genome != "chromatium_13m_206")

colors <- c("Bin_40-contigs_non_chlorophyta_removed_30_June" = "#D95F02", "Bin_45_3_Chlorobium_phaeobacteroides" = "#1B9E77", "Bin_175_Thiodictyon_syntrophicum-contigs" =  "#666666",
            "Bin_235_Chromatium_okenii" = "#E7298A", "Bin_175_Lamprocystis_purpurea-contigs" = "#E6AB02", "Bin_158_Thiocystis_sp903866365" = "#A6761D", "Bin_45_Chlorobium_sp903915955" = "#66A61E")

Fig.2F<- ggplot(Cover_merge_ca6, aes(x=Rel_Abun, y=Depth, fill=Genome)) + 
  geom_bar(stat = "identity", colour = "black")+
  #scale_fill_discrete(limits=c("17m","15.5m","", "13m", "15mw", "15mm", "15p5m", "", "11m", "9m", "5m", ""))+
  scale_y_discrete(limits=c("17m","","15_5m","15mm", "15mw","13m", "", "11m", "9m", "5m", ""), labels=c("17","","15.5","15", "15-w","13", "", "11", "9", "5", ""))+
  ylab("Depth (m)")+
  theme_bw()+
  scale_fill_manual("Refined MAGs", values = c("Bin_40-contigs_non_chlorophyta_removed_30_June" = "#D95F02", "Bin_45_3_Chlorobium_phaeobacteroides" = "#1B9E77", "Bin_175_Thiodictyon_syntrophicum-contigs" =  "#666666",
                                               "Bin_235_Chromatium_okenii" = "#E7298A", "Bin_175_Lamprocystis_purpurea-contigs" = "#E6AB02", "Bin_158_Thiocystis_sp903866365" = "#A6761D", "Bin_45_Chlorobium_sp903915955" = "#66A61E"), 
                    breaks = c("Bin_40-contigs_non_chlorophyta_removed_30_June", "Bin_45_3_Chlorobium_phaeobacteroides","Bin_45_Chlorobium_sp903915955", "Bin_235_Chromatium_okenii", 
                               "Bin_175_Lamprocystis_purpurea-contigs", "Bin_158_Thiocystis_sp903866365", "Bin_175_Thiodictyon_syntrophicum-contigs"),
                    
                    labels=c("Chlorella-like", "Chlorobium phaeobacteroides", "Chlorobium sp", 
                             "Chromatium okenii", "Lamprocystis purpurea","Thiocystis sp", "Thiodictyon syntrophicum"))+
  xlab("Relative Abundance (%)")+
  theme(axis.text.y = element_blank())+
  theme(axis.title.y = element_blank())+
  theme(legend.position = "bottom")+
  theme(axis.ticks.y = element_blank())+
  theme(
    # Hide panel borders and remove grid lines
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    # Change axis line
  )+
  annotate("text", x = 5, y = 11, label = "Mixolimnion")+
  annotate("text", x = 5, y = 7, label = "Chemocline")+
  annotate("text", x = 5, y = 2, label = "Monimolimnion")+
  guides(fill = guide_legend(nrow = 3))
  

Fig.2D | Fig.2E | Fig.2F #700x500


###############################################################################################################
###############################################################################################################
############################################FIGURE Fig.3#######################################################
###############################################################################################################
###############################################################################################################
###############################################################################################################

##Add busco score of Chlorella Family 
Busco_summary_ncbi_3 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/chlorophytas_batch_summary.txt")

k <- 2 # keep first 3 fields only
Busco_summary_ncbi_3$accessions<- substr(Busco_summary_ncbi_3$Input_file, 1, sapply(gregexpr("_", Busco_summary_ncbi_3$Input_file), "[", k) - 1)

##Add Stats
Chlorella_stats_ncbi <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Chlrella_family_tree_stats.txt")
Chlorella_stats_ncbi$filename<- str_replace_all(Chlorella_stats_ncbi$filename, "/srv/beegfs/scratch/users/s/saini7/datasets_db/Chlorellaceae/busco_phylo/Chlorella_Genomes_Cat_copy/", "")
Chlorella_stats_ncbi$accessions<- substr(Chlorella_stats_ncbi$filename, 1, sapply(gregexpr("_", Chlorella_stats_ncbi$filename), "[", k) - 1)

#Merge busco dataframe with stats
busco_stats<- merge(Chlorella_stats_ncbi, Busco_summary_ncbi_3, by="accessions")

##Upload NCBI info
ncbi_dataset <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/chlorella_genomes.txt")

##Add inform from NCBI
busco_stats2<- merge(busco_stats, ncbi_dataset, by.x="accessions", by.y="Assembly.Accession", all.x=T)
busco_stats2$MAG <- trimws(CB_NCB_CAT4$MAG)

busco_stats2[1, 24] <- "Chlorophyta_MAG_Cadagno"
busco_stats2[1, 25] <- "Chlorophyta_MAG_Cadagno"
busco_stats2[2, 24] <- "Chlamydomonas reinhardtii"
busco_stats2[2, 25] <- "Chlamydomonas reinhardtii"

busco_stats3 = dplyr::mutate(busco_stats2, Organism2 = paste(accessions, Organism.Name,  sep='|'))

#Drop first row 
#busco_stats3a<- busco_stats3[-c(1), ] 

####TREE 

treen_chlorella<- read.tree("G:/My Drive/Github_MS2/R_files_MS2_july/Chlorella_tree.nwk")

tree_1<- ggtree(treen_chlorella, size=1)+
  geom_label2((aes(label=label)))


tree_2<- ggtree(treen_chlorella, size=1)+
  geom_label2 (aes(label=label, 
                   subset = !is.na(as.numeric(label)) & as.numeric(label) > 80), color="black", size=4, hjust=1.25)


tree_3<- tree_2 %<+% busco_stats3


Fig.3A <- tree_3+   
  geom_tiplab(aes(label=Organism2), size=5) +
  #geom_tippoint(aes(size=Size.Mb., color=as.numeric(GC.)))+
  geom_treescale(0.15,32.5, width = 0.1, fontsize = 5)+
  # theme (legend.position = "none")+
  xlim(0, 1.5)+
  # scale_size_continuous("Size (MB)", range = c(3, 7))+
  theme(legend.position = c(.2, .75))



##Plot size and GC content
Fig.3B<- ggplot(busco_stats3, aes(x=as.numeric(contig_bp/1000000), y=Organism2, size=as.numeric(gc_avg)))+
  geom_segment(aes(x = 0, y = Organism2, xend=as.numeric(contig_bp/1000000), yend = Organism2), color = "grey40", size=1)+
  geom_point()+
  scale_x_continuous(breaks= pretty_breaks(10))+
  theme(legend.key = element_rect(fill = "white"))+
  theme(panel.background = element_rect(fill = 'white'))+
  scale_y_discrete(limits=c("GCA_000002595.3|Chlamydomonas reinhardtii", "GCA_004335735.1|Chlorella sp. KRBP", "GCA_002794665.1|Prototheca stagnorum","GCA_003255715.1|Prototheca wickerhamii", "GCA_016906385.1|Prototheca wickerhamii",
                            "GCA_002897115.2|Prototheca cutis", "GCA_000733215.1|Auxenochlorella protothecoides", "GCA_003709365.1|Auxenochlorella protothecoides", "Bin_40-contigs|Chlorophyta_MAG_Cadagno", "GCA_004335555.1|Nannochloris sp. X1", "GCA_004335565.1|Nannochloris sp. RS",
                            "GCA_019044685.1|NA", "GCA_019202925.1|Chlorella desiccata (nom. nud.)", "GCA_001598975.1|Parachlorella kessleri", "GCA_008119945.1|Chlorella vulgaris", "GCA_015712045.1|Parachlorella kessleri", "GCA_003063905.1|Chlorella sp. A99", 
                            "GCA_002245815.2|Micractinium conductrix", "GCA_001430745.1|Auxenochlorella pyrenoidosa", "GCA_002896455.3|Chlorella sp. ArM0029B", "GCA_000147415.1|Chlorella variabilis",  "GCA_009720205.1|Chlorella vulgaris", "GCA_009720215.1|Chlorella vulgaris",
                            "GCA_001021125.1|Chlorella vulgaris", "GCA_013372505.1|Chlorella sp. BAC 9706", "GCA_002939045.1|Chlorella sorokiniana", "GCA_006782975.1|Chlorella sp. Dachan", "GCA_006782985.1|Chlorella sorokiniana", "GCA_009928355.1|Chlorella sp. CH2018", 
                            "GCA_002245835.2|Chlorella sorokiniana", "GCA_003116155.1|Chlorella sorokiniana", "GCA_003130725.1|Chlorella sorokiniana", "GCA_006782965.1|Chlorella sorokiniana"), labels=c("GCA_000002595.3|Chlamydomonas reinhardtii", "GCA_004335735.1|Chlorella sp. KRBP", "GCA_002794665.1|Prototheca stagnorum","GCA_003255715.1|Prototheca wickerhamii", "GCA_016906385.1|Prototheca wickerhamii",
                                                                                                                                                                                                          "GCA_002897115.2|Prototheca cutis", "GCA_000733215.1|Auxenochlorella protothecoides", "GCA_003709365.1|Auxenochlorella protothecoides", "Chlorophyta_MAG_Cadagno", "GCA_004335555.1|Nannochloris sp. X1","GCA_004335565.1|Nannochloris sp. RS", 
                                                                                                                                                                                                          "GCA_019044685.1|Chlorella desiccata", "GCA_019202925.1|Chlorella desiccata", "GCA_001598975.1|Parachlorella kessleri", "GCA_008119945.1|Chlorella vulgaris", "GCA_015712045.1|Parachlorella kessleri", "GCA_003063905.1|Chlorella sp. A99", 
                                                                                                                                                                                                          "GCA_002245815.2|Micractinium conductrix", "GCA_001430745.1|Auxenochlorella pyrenoidosa", "GCA_002896455.3|Chlorella sp. ArM0029B", "GCA_000147415.1|Chlorella variabilis",  "GCA_009720205.1|Chlorella vulgaris", "GCA_009720215.1|Chlorella vulgaris",
                                                                                                                                                                                                          "GCA_001021125.1|Chlorella vulgaris", "GCA_013372505.1|Chlorella sp. BAC 9706", "GCA_002939045.1|Chlorella sorokiniana", "GCA_006782975.1|Chlorella sp. Dachan", "GCA_006782985.1|Chlorella sorokiniana", "GCA_009928355.1|Chlorella sp. CH2018", 
                                                                                                                                                                                                          "GCA_002245835.2|Chlorella sorokiniana", "GCA_003116155.1|Chlorella sorokiniana", "GCA_003130725.1|Chlorella sorokiniana", "GCA_006782965.1|Chlorella sorokiniana"))+
  theme(axis.line.x.bottom=element_line(color="black"))+
  theme(axis.ticks.y =element_blank())+
  theme(axis.title.y =element_blank())+
  theme(axis.text.y =element_blank())+
  theme(legend.position = c(0.65, 0.25), legend.direction = "vertical",
        legend.background = element_rect(size=0.3, colour ="black", 
                                         fill = "transparent"))+
  scale_size_continuous("GC")+
  theme(axis.text=element_text(size=12),axis.title=element_text(size=12))+
  xlab("Size (Mbp)")+
  theme(axis.text.x=element_text(angle=45, hjust=1))



Fig.3A | Fig.3B 

####BUSCO score for Chlorella Family

busco_stats3$accessions<- str_replace_all(busco_stats3$accessions, "Bin_40-contigs", "Chlorophyta")


batch_summary2<- busco_stats3 %>%
  select(c(35, 16:19))

busco_3<- melt(batch_summary2, id.vars = c("Organism2"))
busco_4<- merge(busco_3, busco_stats3, by="Organism2")

##Add prefix to rows 
busco_4$n_contigs_prefix = paste0('n=', busco_4$n_contigs)


Fig.3C<- ggplot(busco_4, aes(x=as.numeric(value), y=Organism2, fill=variable)) + 
  geom_bar(stat="identity", position = position_stack(reverse = T))+
  xlab("Busco score (%)")+
  scale_fill_manual("Busco score", values=c("#87d3f8", "#3492C7","#ffe119", "#D53E4F"), 
                    labels =c(" Complete (C) and single-copy (S)  ",
                              " Complete (C) and duplicated (D)",
                              " Fragmented (F)", " Missing (M)"))+
  theme_bw()+
  scale_y_discrete(limits=c("GCA_000002595.3|Chlamydomonas reinhardtii", "GCA_004335735.1|Chlorella sp. KRBP", "GCA_002794665.1|Prototheca stagnorum","GCA_003255715.1|Prototheca wickerhamii", "GCA_016906385.1|Prototheca wickerhamii",
                            "GCA_002897115.2|Prototheca cutis", "GCA_000733215.1|Auxenochlorella protothecoides", "GCA_003709365.1|Auxenochlorella protothecoides", "Bin_40-contigs|Chlorophyta_MAG_Cadagno", "GCA_004335555.1|Nannochloris sp. X1", "GCA_004335565.1|Nannochloris sp. RS",
                            "GCA_019044685.1|NA", "GCA_019202925.1|Chlorella desiccata (nom. nud.)", "GCA_001598975.1|Parachlorella kessleri", "GCA_008119945.1|Chlorella vulgaris", "GCA_015712045.1|Parachlorella kessleri", "GCA_003063905.1|Chlorella sp. A99", 
                            "GCA_002245815.2|Micractinium conductrix", "GCA_001430745.1|Auxenochlorella pyrenoidosa", "GCA_002896455.3|Chlorella sp. ArM0029B", "GCA_000147415.1|Chlorella variabilis",  "GCA_009720205.1|Chlorella vulgaris", "GCA_009720215.1|Chlorella vulgaris",
                            "GCA_001021125.1|Chlorella vulgaris", "GCA_013372505.1|Chlorella sp. BAC 9706", "GCA_002939045.1|Chlorella sorokiniana", "GCA_006782975.1|Chlorella sp. Dachan", "GCA_006782985.1|Chlorella sorokiniana", "GCA_009928355.1|Chlorella sp. CH2018", 
                            "GCA_002245835.2|Chlorella sorokiniana", "GCA_003116155.1|Chlorella sorokiniana", "GCA_003130725.1|Chlorella sorokiniana", "GCA_006782965.1|Chlorella sorokiniana"), 
                   labels=c("GCA_000002595.3|Chlamydomonas reinhardtii", "GCA_004335735.1|Chlorella sp. KRBP", "GCA_002794665.1|Prototheca stagnorum","GCA_003255715.1|Prototheca wickerhamii", "GCA_016906385.1|Prototheca wickerhamii",
                            "GCA_002897115.2|Prototheca cutis", "GCA_000733215.1|Auxenochlorella protothecoides", "GCA_003709365.1|Auxenochlorella protothecoides", "Chlorophyta_MAG_Cadagno", "GCA_004335555.1|Nannochloris sp. X1","GCA_004335565.1|Nannochloris sp. RS", 
                            "GCA_019044685.1|Chlorella desiccata", "GCA_019202925.1|Chlorella desiccata", "GCA_001598975.1|Parachlorella kessleri", "GCA_008119945.1|Chlorella vulgaris", "GCA_015712045.1|Parachlorella kessleri", "GCA_003063905.1|Chlorella sp. A99", 
                            "GCA_002245815.2|Micractinium conductrix", "GCA_001430745.1|Auxenochlorella pyrenoidosa", "GCA_002896455.3|Chlorella sp. ArM0029B", "GCA_000147415.1|Chlorella variabilis",  "GCA_009720205.1|Chlorella vulgaris", "GCA_009720215.1|Chlorella vulgaris",
                            "GCA_001021125.1|Chlorella vulgaris", "GCA_013372505.1|Chlorella sp. BAC 9706", "GCA_002939045.1|Chlorella sorokiniana", "GCA_006782975.1|Chlorella sp. Dachan", "GCA_006782985.1|Chlorella sorokiniana", "GCA_009928355.1|Chlorella sp. CH2018", 
                            "GCA_002245835.2|Chlorella sorokiniana", "GCA_003116155.1|Chlorella sorokiniana", "GCA_003130725.1|Chlorella sorokiniana", "GCA_006782965.1|Chlorella sorokiniana"))+
  theme(axis.ticks.y =element_blank())+
  theme(axis.title.y =element_blank())+
  theme(axis.text.y =element_blank())+
  geom_text(aes(x = 25, label = n_contigs_prefix), check_overlap = TRUE)+
  theme(axis.text=element_text(size=12),axis.title=element_text(size=12))+
  theme(axis.text.x=element_text(angle=45, hjust=1))+
  theme(legend.position = "none")



(Fig.3A) +  (Fig.3B + Fig.3C + plot_layout(widths = c(1, 1.15))) + 
  plot_layout(widths = c(1.25, 1)) #15x9

###############################################################################################################
###############################################################################################################
############################################MAIN FIGURE Fig.5##################################################
###############################################################################################################
###############################################################################################################
###############################################################################################################

kegg_out <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/kegg_out_july22_modules.txt")

keep<- c('M00165','M00166', 'M00167', 'M00168', 'M00169', 'M00170', 'M00171', 'M00172', 'M00579', 'M00531', 'M00615', 'M00176')

KEGG_last<- kegg_out[kegg_out$module %in% keep, ]

##Module completeness
modul_com<- select(KEGG_last, c('module', 'stepwise_module_completeness')) 
modul_com$stepwise_module_completeness<- as.numeric(modul_com$stepwise_module_completeness)

Fig.5A<- ggplot(data = modul_com, aes(x=module, y="", fill=stepwise_module_completeness)) + 
  geom_tile(color = "black", size=1)+ 
  scale_fill_viridis("Completeness", option="plasma", limits=c(0.42,1),  breaks=c(0.42, 0.60, 0.75,1))+
  theme(axis.title.y = element_blank())+
  theme(axis.ticks.y = element_blank())+
  theme(axis.text.y = element_blank())+
  theme(axis.title.x = element_blank())+
  theme(axis.ticks.x = element_blank())+
  theme(axis.text.x = element_blank())+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "white"))+
  scale_x_discrete(limits=c('M00165','M00166', 'M00167', 'M00168', 'M00169', 'M00170', 'M00171', 'M00172', 'M00579', 'M00615', 'M00176')) 



KEGG_last_kofam<- KEGG_last[, c(1,19,21,23,25,27,29,31, 33)]


long <- melt(setDT(KEGG_last_kofam), id.vars = c("module"), variable.name = "Depth_m")

long$Depth_m = str_replace_all(long$Depth_m, "lib_15_5m_mapped_", "")
long$Depth_m = str_replace_all(long$Depth_m, "_r_avg_coverage", "")

Fig.5B<- ggplot(data = long, aes(y=Depth_m, x=module, fill=value)) + 
  geom_tile()+
  #geom_text(aes(label = module_completeness), color = "white", size = 4)+
  #geom_point( aes( x = module, y = Depth_m, size= as.numeric(module_completeness) ) )+
  scale_fill_gradientn("Coverage", colors = hcl.colors(20, "RdYlGn"))+
  scale_y_discrete(limits=c("17m","","15_5m", "15mm", "15mw", "13m","", "11m", "9m", "5m", ""), 
                   labels=c("17","","15.5", "15", "15-w", "13","","11", "9", "5", ""))+
  theme_minimal()+
  annotate("text", x = 6, y = 11, label = "Mixolimnion")+
  annotate("text", x = 6, y = 7, label = "Chemocline")+
  annotate("text", x = 6, y = 2, label = "Monimolimnion")+ theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  theme(axis.title.x = element_blank())+
  ylab("Depth (m)")+
  #theme(axis.title.y = element_blank())+
  theme(axis.ticks.y = element_blank())+
  # theme(axis.text.y = element_blank())+
  theme(axis.text.x = element_text(angle = -45, vjust=2))+
  scale_x_discrete(position="top", limits=c('M00165','M00166', 'M00167', 'M00168', 'M00169', 'M00170', 'M00171', 'M00172', 'M00579', 'M00615', 'M00176')) 



Fig.5A / plot_spacer() / Fig.5B + plot_layout(heights  = c(1,-0.25, 10)) #6.5x6.5


#write.csv(KEGG_last_kofam_hits_in_modules2,"D:/Github_MS2/Anvio_verification_kegg_nodules.txt") 



###############################################################################################################
###############################################################################################################
############################################SUPPLEMENTARY Fig.S3##################################################
###############################################################################################################
###############################################################################################################
###############################################################################################################





###Plot gene length distribution 
chlorella_gff3 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Bin_40-contigs_non_chlorophyta_removed_30_June/Bin_40-contigs_non_chlorophyta_removed_30_June.1.Tier.txt", header = F)

chlo_drop_cds<- chlorella_gff3 %>% 
  filter(!grepl('CDS', V3))

# length of genes
chlo_drop_cds$gene_length <- chlo_drop_cds$V5 - chlo_drop_cds$V4

a <- ggplot(chlo_drop_cds, aes(x = gene_length))

a2=gghistogram(chlo_drop_cds, x = "gene_length", 
               add = "mean", rug = F,
               color = "V2", fill = "V2",
               palette = c("#0073C2FF", "#FC4E07"))+
  xlab("Gene Length")+
  ylab("Gene Count")+
  theme(legend.position = c(0.65, 0.55), legend.direction = "vertical",
        legend.background = element_rect(size=0.3, colour ="black", 
                                         fill = "transparent"))

####Gene comparison
Accessions <- c("GCA_000002595.3_protein.faa",
                "GCA_000147415.1_protein.faa",
                "GCA_000733215.1_protein.faa",
                "GCA_002245815.2_protein.faa",
                "GCA_002245835.2_protein.faa",
                "GCA_003709365.1_protein.faa",
                "GCA_019044685.1_protein.faa",
                "GCA_019202925.1_protein.faa",
                "Lake_Cadagno_Chlorophyta_MAG")
Gene_cont<- c(19528, 9780, 7014, 10070, 10348, 5852, 9227, 8858, 10732)

gene_df<- data.frame(Accessions, Gene_cont)
gene_df$Accessions = str_replace_all(gene_df$Accessions, "_protein.faa", "")

gene_df2<- merge(gene_df, busco_stats2, by.x= "Accessions", by.y="accessions", all.x=T)

gene_df3 = dplyr::mutate(gene_df2, Organism2 = paste(Accessions, Organism.Name,  sep='|'))

Fig.S3A<- gene_df3 %>%
  filter(!is.na(Gene_cont)) %>%
  arrange(Gene_cont) %>%
  mutate(Country=factor(Organism2, Organism2)) %>%
  ggplot( aes(y=Gene_cont, x=Organism2) ) +
  geom_bar(stat="identity", fill="#56B4E9") +
  coord_flip() +
  theme(
    panel.grid.minor.y = element_blank(),
    panel.grid.major.y = element_blank(),
    legend.position="none"
  ) +
  xlab("")+
  theme_bw()+
  geom_text(aes(y = 4000, label=Organism2), check_overlap = TRUE)+
  geom_label(aes(y = 10000, label=Gene_cont), check_overlap = TRUE)+
  
  ylab("Gene Count")+
  theme(axis.title.y = element_blank())+
  theme(axis.ticks.y = element_blank())+
  theme(axis.text.y = element_blank())

layout <- c(
  area(t = 2, l = 1, b = 5, r = 4),
  area(t = 1, l = 3, b = 3, r = 5)
)
Fig.S3A + a2 +
  plot_layout(design = layout)

Fig.S3A + inset_element(
  a2, 
  left = 0.55, 
  bottom = 0.5, 
  right = unit(1, 'npc') - unit(1, 'cm'), 
  top = unit(1, 'npc') - unit(1, 'cm')
)#Size 8x5.5

###KEGG 
##EGG NOGG ANNOTATIONS
Kegg_Modules <- read.csv("G:/My Drive/Github_MS2/R_files_MS2_july/Kegg_Modules_Browser.csv")

eggnog <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Bin_40-contigs_non_chlorophyta_removed_30_June.1.Tier.faa_eggnog.txt")
blast2go <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/blast2go_table_mapping_annotation_genes.txt")
blast2go2 <- blast2go[, c(1:13)]
#blast2go2 <- blast2go2[!duplicated(blast2go2$SeqName),]
Interpro <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Interpro_scan_omicsbox_table.txt")
Interpro2<- Interpro[, c(1:3, 14:16)]

Merge1<- merge(blast2go,eggnog, by.y="Query.ID",  by.x="SeqName")
Merge2<- Merge1[, -c(9:16)]


##KEEP C:N:S Genes
Merge3<- merge(Kegg_Modules, Merge2, by.x="Chlorophyta_MAG_Gene", by.y="SeqName", all.x="true")


lib_17m_mapped_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/chlorophyta_gene_cov/Cov_mapped_5m_r.txt")
lib_17m_mapped_5m_r$Depth <- "5m"


lib_17m_mapped_9m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/chlorophyta_gene_cov/Cov_mapped_9m_r.txt")
lib_17m_mapped_9m_r$Depth <- "9m"


lib_17m_mapped_11m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/chlorophyta_gene_cov/Cov_mapped_11m_r.txt")
lib_17m_mapped_11m_r$Depth <- "11m"


lib_17m_mapped_13m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/chlorophyta_gene_cov/Cov_mapped_13m_r.txt")
lib_17m_mapped_13m_r$Depth <- "13m"


lib_17m_mapped_15mm_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/chlorophyta_gene_cov/Cov_mapped_15mm_r.txt")
lib_17m_mapped_15mm_r$Depth <- "15mm"


lib_17m_mapped_15mw_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/chlorophyta_gene_cov/Cov_mapped_15mw_r.txt")
lib_17m_mapped_15mw_r$Depth <- "15mw"


lib_17m_mapped_15_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/chlorophyta_gene_cov/Cov_mapped_15_5m_r.txt")
lib_17m_mapped_15_5m_r$Depth <- "15_5m"


lib_17m_mapped_17m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/chlorophyta_gene_cov/Cov_mapped_17m_r.txt")
lib_17m_mapped_17m_r$Depth <- "17m"

VR_bind <- rbind(lib_17m_mapped_5m_r, lib_17m_mapped_11m_r, lib_17m_mapped_9m_r, lib_17m_mapped_13m_r, lib_17m_mapped_15mm_r, lib_17m_mapped_15mw_r, lib_17m_mapped_15_5m_r, lib_17m_mapped_17m_r)
VR_bind2<- VR_bind[, c(1,7,10)]


Merge4<- merge(Merge3, VR_bind2, by.y="X.rname", by.x="Chlorophyta_MAG_Gene", all.x="true")

Merge4$Chlorophyta_MAG_Gene = str_replace_all(Merge4$Chlorophyta_MAG_Gene, "biopygen", "LC")
Merge4$Chlorophyta_MAG_Gene = str_replace_all(Merge4$Chlorophyta_MAG_Gene, "gene", "g")

Merge4$Metabolism


Fig.5B<- ggplot(data = Merge4, aes(y=Depth, x=Chlorophyta_MAG_Gene)) + 
  geom_point(aes(size=meandepth, color=Metabolism))+
  #geom_text(aes(label = module_completeness), color = "white", size = 4)+
  #geom_point( aes( x = module, y = Depth_m, size= as.numeric(module_completeness) ) )+
  #scale_fill_gradient2()+
  
  #scale_fill_gradientn("Coverage", colors = hcl.colors(5, "RdYlGn"))+
  scale_y_discrete(limits=c("17m","","15_5m", "15mm", "15mw", "13m","", "11m", "9m", "5m", ""), 
                   labels=c("17","","15.5", "15", "15-w", "13","","11", "9", "5", ""))+
  scale_x_discrete(limits=rev)+
  theme_bw()+
  theme(axis.text.x=element_text(angle=90, hjust=1, size=8))+
  theme(axis.title.x = element_blank())+
  theme(legend.position = "bottom")+
  theme(axis.title.x = element_blank())+
  scale_x_discrete(position = "top", limits=rev) +
  theme(axis.ticks.y = element_blank())+
  scale_color_manual(values=c("#1B9E77", "#D95F02", "#E7298A"))+
  guides(color=guide_legend(), size = guide_legend())+
  theme(axis.ticks.x = element_blank())+
  theme(legend.position = "right", legend.background = element_rect(size=0.3, 
                                                                          colour ="black"),  legend.direction = "vertical") +
  theme(axis.ticks.x = element_blank())+
  theme(axis.text.x.top = element_blank())+
  theme(legend.position = "none")
  

  
  
  


  



Merge5<- Merge3[, c(1:3,7)]

Merge6<- Merge5 %>% 
  dplyr::count(KEGG_Module,KO,Chlorophyta_MAG_Gene,Metabolism, sort = TRUE)

Merge6$KEGG_Module <- trimws(Merge6$KEGG_Module)
Merge6$KEGG_Module <- factor(Merge6$KEGG_Module, levels = 
                               c("M00176", "M00615", "M00531", "M00579","M00172", "M00171", "M00170", "M00169", "M00168", "M00167", "M00166", "M00165"))

dgd<- ggplot(Merge6,
             aes(y = n,  axis2 = KEGG_Module, axis1 = Chlorophyta_MAG_Gene)) +
  geom_alluvium(aes(fill = Metabolism), 
                width = 0, alpha = 0.5, knot.pos = 0.3) +
  geom_stratum(width = 1/20, color = "grey36") +

  scale_x_continuous(breaks = 1:3, 
                     expand = c(.01, .05)) +
  theme_minimal() +
  theme(legend.position = "none", panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), axis.text.y = element_blank(), 
        axis.text.x = element_text(size = 12, face = "bold"))+
  theme(axis.title.y = element_blank())+
  theme(axis.text.y = element_blank())+
  theme(axis.ticks.y = element_blank())+
  #geom_text(stat = "stratum", aes(label = after_stat(stratum)), angle=45)+
  coord_flip()+
  theme(axis.title.x = element_blank())+
  theme(axis.text.x = element_blank())+
  scale_fill_manual(values=c("#1B9E77", "#D95F02", "#E7298A"))+
  theme(axis.text.x = element_blank())
  

ggarrange(dgd, Fig.5B, nrow=2, widths = c(2,1), heights = c(1,6)) 

  





theme_minimal()+
  annotate("text", x = 6, y = 11, label = "Mixolimnion")+
  annotate("text", x = 6, y = 7, label = "Chemocline")+
  annotate("text", x = 6, y = 2, label = "Monimolimnion")+ theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))+
  theme(axis.title.x = element_blank())+
  ylab("Depth (m)")+
  #theme(axis.title.y = element_blank())+
  theme(axis.ticks.y = element_blank())+
  # theme(axis.text.y = element_blank())+
  theme(axis.text.x = element_text(angle = -45, vjust=2))+
  scale_x_discrete(position="top", limits=c('M00165','M00166', 'M00167', 'M00168', 'M00169', 'M00170', 'M00171', 'M00172', 'M00579', 'M00615', 'M00176')) +
  




  



Fig.5B<- ggplot(data = Merge4, aes(y=Depth, x=Chlorophyta_MAG_Gene, fill=meandepth)) + 
  geom_tile(color="black")+
  #geom_text(aes(label = module_completeness), color = "white", size = 4)+
  #geom_point( aes( x = module, y = Depth_m, size= as.numeric(module_completeness) ) )+
  scale_fill_gradientn("Coverage", colors = hcl.colors(20, "RdYlGn"))+
  scale_y_discrete(limits=c("17m","","15_5m", "15mm", "15mw", "13m","", "11m", "9m", "5m", ""), 
                   labels=c("17","","15.5", "15", "15-w", "13","","11", "9", "5", ""))+
  theme(axis.text.x=element_text(angle=45, hjust=1))





  



fig.5c<- ggplot(as.data.frame(Merge6),
       aes(y = n,
           axis3 = Chlorophyta_MAG_Gene, axis1 = KEGG_Module)) +
  geom_alluvium(aes(fill = Metabolism),
                width = 0, knot.pos = 0, reverse = TRUE) +

  geom_stratum(width = 1/12, fill = "white", color = "grey") +
  geom_text(stat = "stratum", aes(label = after_stat(stratum)), angle=45)+
  coord_flip()+
  theme_minimal()+
  theme(axis.title.y = element_blank())+
  theme(axis.text.y = element_blank())+
  theme(axis.ticks.y = element_blank())+
  theme(
    # Hide panel borders and remove grid lines
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    # Change axis line 
  )+
  theme_bw() + theme(panel.grid=element_blank(), panel.border=element_blank())


  geom_label(stat = "stratum", aes(label = after_stat(stratum)))


  geom_text(stat = "stratum", aes(label = after_stat(stratum)),
                        reverse = FALSE, angle=45)



ggplot(as.data.frame(Merge6),
       aes(y = n, axis2 = Chlorophyta_MAG_Gene, axis1 = KEGG_Module)) +
  geom_alluvium(aes(fill = Metabolism), width = 1/12)+
  geom_stratum(width = 1/12, fill = "black", color = "grey") +
  geom_label(stat = "stratum", aes(label = after_stat(stratum)))+
  coord_flip()



Fig.5B / fig.5c
  


  geom_stratum(width = 1/8, reverse = FALSE) +
  geom_text()


#  geom_text(stat = "stratum", aes(label = after_stat(stratum)),
#            reverse = FALSE) +
  


  scale_x_continuous(breaks = 1:3, labels = c("Survived", "Sex", "Class")) +
  ggtitle("Titanic survival by class and sex")



ggplot(as.data.frame(Merge6),
       aes(y = n, axis1 = Chlorophyta_MAG_Gene, axis2 = KO, axis3 = KEGG_Module)) +
  geom_alluvium(aes(fill = Metabolism), width = 1/12)+
  geom_stratum(width = 1/12, fill = "black", color = "grey") +
  geom_label(stat = "stratum", aes(label = after_stat(stratum)))

