###############################################################################################################
###############################################################################################################
############################################INSTALL PACKAGES###################################################
###############################################################################################################
###############################################################################################################
###############################################################################################################
#Install packages which are not there
#install.packages(packages, dependencies = TRUE)  
packages<-c("ape", "devtools", "ggplot2", "colorspace", "vegan", "dplyr", "scales", "grid",  
            "reshape2", "plyr", "magrittr", "matrixStats", "data.table", "DT", "colorspace", "corrplot", "Hmisc", 
            "tidyverse", "readxl", "RColorBrewer", "randomcoloR","patchwork", "gghighlight","ggpubr", "cowplot", 
            "geosphere", "karyoploteR", "ggtree", "networkD3", "easyalluvial", "jpeg")

install.packages(setdiff(packages, rownames(installed.packages())), dependencies = TRUE)  

#Install ggtree manually
#if (!require("BiocManager", quietly = TRUE))
#install.packages("BiocManager")

#devtools::install_github("ianmoran11/mmtable2")


#BiocManager::install("ggtree")
library(ggplot2) 
library(vegan) 
library(dplyr) 
library(scales) 
library(grid) 
#library(microshades)
library(reshape2)
library(plyr)
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
library(ggtree)
library(networkD3)
library(ggalluvial)
library(easyalluvial)
library(jpeg)
library(directlabels)
library(stringr)
library(knitr)
library(mmtable2)
library(gt)
library(sjPlot)
library(stargazer)
library(sjmisc)
library(strex)


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


####################################################################################
####################################################################################
###################################Fig. S1A#########################################
####################################################################################
####################################################################################

###Lake Cadagno physicochemical profile
CTD1_28 <- read.csv("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.S1/CTD1_28_Aug_17_II.csv") 
CTD1_28$Depth_m<- round(CTD1_28$Depth_m_CTD1_28)
CTD1_28_final<- aggregate(. ~Depth_m, data = CTD1_28, FUN = mean)


#CTD1 29.08.2017 avg/depth
CTD1_29 <- read.csv("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/CTD1_29_Aug_17_II.csv") 
CTD1_29$Depth_m<- round(CTD1_29$Depth_m_CTD1_29)
CTD1_29_Aug_17_R3<- aggregate(. ~Depth_m, data = CTD1_29, FUN = mean)


#CTD2 29.08.2017 avg/depth

CTD2_29_Aug_17_avg_R <- read.csv("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.S1/CTD2_29_Aug_17_avg_II.csv")
CTD2_29_Aug_17_avg_R$Depth_m<- round(CTD2_29_Aug_17_avg_R$Depth)
CTD2_29_Aug_17_avg_R2<- aggregate(. ~ Depth_m, data = CTD2_29_Aug_17_avg_R, FUN = mean)


Fig.S1A<- ggplot(data=CTD1_29_Aug_17_R3, aes(y=CTD1_29_Aug_17_R3$Depth_m))+
  annotate("rect", xmin=-Inf, xmax=Inf, ymin=12.5, ymax=13.5, alpha=0.25, fill="grey")+
  annotate("rect", xmin=-Inf, xmax=Inf, ymin=13.5, ymax=15.5, alpha=0.25, fill="grey")+
  annotate("rect", xmin=-Inf, xmax=Inf, ymin=15.5, ymax=16.5, alpha=0.25, fill="grey")+
  geom_path(data=CTD2_29_Aug_17_avg_R2, aes(y=as.numeric(CTD2_29_Aug_17_avg_R2$Depth_m), x=CTD2_29_Aug_17_avg_R2$PAR_CTD2_29/15, color="lightsalmon4"), 
            size=1.5, linetype="solid")+
  geom_point(data=CTD2_29_Aug_17_avg_R2, aes(y=as.numeric(CTD2_29_Aug_17_avg_R2$Depth_m), x=CTD2_29_Aug_17_avg_R2$PAR_CTD2_29/15, color="lightsalmon4"), 
             size=2)+
  geom_path(data=CTD1_29_Aug_17_R3, aes(y=CTD1_29_Aug_17_R3$Depth_m, x=CTD1_29_Aug_17_R3$Chl_A_CTD1_29, color="black"), 
            size=1.5, linetype="solid")+
  geom_point(data=CTD1_29_Aug_17_R3, aes(y=CTD1_29_Aug_17_R3$Depth_m, x=CTD1_29_Aug_17_R3$Chl_A_CTD1_29, color="black"), 
             size=2)+
  geom_path(data=CTD1_29_Aug_17_R3, aes(y=CTD1_29_Aug_17_R3$Depth_m, x=CTD1_29_Aug_17_R3$Turb_CTD1_29, color="blue"), 
            size=1.5, linetype="solid")+
  geom_point(data=CTD1_29_Aug_17_R3, aes(y=CTD1_29_Aug_17_R3$Depth_m, x=CTD1_29_Aug_17_R3$Turb_CTD1_29, color="blue"), 
             size=2)+
  geom_path(data=CTD2_29_Aug_17_avg_R2, aes(y=CTD2_29_Aug_17_avg_R2$Depth_m, x=CTD2_29_Aug_17_avg_R2$Phycocyanin_CTD2_29,  color="grey"), 
            size=1.5, linetype="solid")+
  geom_point(data=CTD2_29_Aug_17_avg_R2, aes(y=CTD2_29_Aug_17_avg_R2$Depth_m, x=CTD2_29_Aug_17_avg_R2$Phycocyanin_CTD2_29,  color="grey"), 
             size=2)+
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

Org_Inrg_R <- read.csv("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.S1/Org_Inrg_R.csv") 
Org_Inrg_R$avg_h2S_mg_L<- Org_Inrg_R$avg_h2S * 34.1
Org_Inrg_R$NH4_mg_L <- Org_Inrg_R$Ammonium_ug_L

####################################################################################
####################################################################################
###################################Fig. S1B#########################################
####################################################################################
####################################################################################


Fig.S1B<- H2S_Amm<- ggplot()+
  theme_bw()+
  annotate("rect", xmin=-Inf, xmax=Inf, ymin=12.5, ymax=13.5, alpha=0.25, fill="grey")+
  annotate("rect", xmin=-Inf, xmax=Inf, ymin=13.5, ymax=15.5, alpha=0.25, fill="grey")+
  annotate("rect", xmin=-Inf, xmax=Inf, ymin=15.5, ymax=16.5, alpha=0.25, fill="grey")+
  geom_point(data=Org_Inrg_R, aes(y=depth_m, x=avg_h2S*150, color="H2S"), size=2)+
  geom_path(data=Org_Inrg_R[!is.na(Org_Inrg_R$avg_h2S*150),], aes(y=depth_m, x=avg_h2S*150, color="H2S"), size=1.5, linetype="dashed")+
  geom_path(data=CTD1_29_Aug_17_R3, aes(y=as.numeric(CTD1_29_Aug_17_R3$Depth_m), x=CTD1_29_Aug_17_R3$DO_mg_CTD1_29, color="DOG"), 
            size=1.5, linetype="solid")+
  geom_point(data=CTD1_29_Aug_17_R3, aes(y=as.numeric(CTD1_29_Aug_17_R3$Depth_m), x=CTD1_29_Aug_17_R3$DO_mg_CTD1_29, color="DOG"),
             size=2)+
  geom_path(data=Org_Inrg_R, aes(y= depth_m, x = Ammonium_ug_L/20, colour="NH4"), size=1.5)+
  geom_point(data=Org_Inrg_R, aes(y= depth_m, x = Ammonium_ug_L/20, colour="NH4"), size=2)+
  #geom_path(data=CTD1_29_Aug_17_R3, aes(y=CTD1_29_Aug_17_R3$Depth_m, x=CTD1_29_Aug_17_R3$Turb_CTD1_29, color="blue"), 
  #          size=1.5, linetype="solid")+
  #geom_point(data=CTD1_29_Aug_17_R3, aes(y=CTD1_29_Aug_17_R3$Depth_m, x=CTD1_29_Aug_17_R3$Turb_CTD1_29, color="blue"), 
  #          size=2)+
  scale_y_reverse(limits = c(21,1), breaks=c(21, 19,  17,15.5, 15, 13,11,9,7, 5, 3, 1))+
  
  
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
  guides(colour = guide_legend(nrow = 3))+
  scale_x_continuous(sec.axis = sec_axis(~.*20, name = "Ammonium (??g/L)"))

####################################################################################
##############################FIGURE S1#############################################
Fig.S1A | Fig.S1B #500x600



###############################################################################################################
###############################################################################################################
############################################FIGURE SUPPLEMENTARY 2 (Fig. S2)###################################
###############################################################################################################
###############################################################################################################
###############################################################################################################

#CAT on ASSEMBLIES
m5_part1 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/Assembly_CAT_5m_0.txt")
m5_part1$Depth <- '5m'
m5_part2 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/Assembly_CAT_5m_1.txt")
m5_part2$Depth <- '5m'
m9 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/Assembly_CAT_9m.txt")
m9$Depth <- '9m'
m11 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/Assembly_CAT_11m.txt")
m11$Depth <- '11m'
m13 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/Assembly_CAT_13m.txt")
m13$Depth <- '13m'
m15mw <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/Assembly_CAT_15mw.txt")
m15mw$Depth <- '15mw'
m15mm <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/Assembly_CAT_15mm.txt")
m15mm$Depth <- '15mm'
m15_5m_1 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/Assembly_CAT_15_5m_0.txt")
m15_5m_1$Depth <- '15_5m'
m15_5m_2 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/Assembly_CAT_15_5m_1.txt")
m15_5m_2$Depth <- '15_5m'
m17 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/Assembly_CAT_17m.txt")
m17$Depth <- '17m' 


Assembly_CAT <- rbind(m5_part1, m5_part2, m9, m11, m13, m15mw, m15mm, m15_5m_1,m15_5m_2, m17)

#Extract CAT score
Assembly_CAT2<- Assembly_CAT %>% separate(superkingdom, c("superkingdom2", "confidence"), ": ", extra = "merge")

Assembly_CAT2$superkingdom2 <- sub("^$", "no support", Assembly_CAT2$superkingdom2) #replace empty cells with no support
Assembly_CAT2$confidence[is.na(Assembly_CAT2$confidence)] <- "0" #replace empty confidence cells with 0
#Assembly_CAT3$superkingdom2<- Assembly_CAT2$superkingdom2 %>% replace_na('no support')



##Upload stats on assembly

assem_stat_output <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/assem_stat_output.txt")
assem_stat_output$sample<- c("11m","13m", "15.5m", "15mm", "15mw","17m", "5m", "9m")


##Assemblu merge with count of contigs
assembly_stat<- merge(Assembly_CAT2, assem_stat_output, by.x="Depth", by.y="sample")
assembly_stat$contig_bp


###drop samples mixolimnion, and monimolimn

assem_stat_output_drop<-assem_stat_output[!(assem_stat_output$sample=="5m"),] 
assem_stat_output_drop1<-assem_stat_output_drop[!(assem_stat_output_drop$sample=="9m"),] 
assem_stat_output_drop2<-assem_stat_output_drop1[!(assem_stat_output_drop1$sample=="11m"),]
assem_stat_output_drop3<-assem_stat_output_drop2[!(assem_stat_output_drop2$sample=="17m"),]

####################################################################################
####################################################################################
###################################Fig. S2A#########################################
####################################################################################
####################################################################################

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

####################################################################################
####################################################################################
###################################Fig. S2B#########################################
####################################################################################
####################################################################################

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
  dplyr::select(sample, ctg_N50, ctg_L50)

assem_stat_output3<- melt(assem_stat_output2, id = c("sample"))

####################################################################################
####################################################################################
###################################Fig. S2C#########################################
####################################################################################
####################################################################################

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


####################################################################################
####################################################################################
###################################Fig. S2D#########################################
####################################################################################
####################################################################################


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

m5_part1 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/BAT_NC_5m_1.txt")
m5_part1$Depth <- '5m'
m5_part2 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/BAT_NC_5m_2.txt")
m5_part2$Depth <- '5m'
m9 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/BAT_NC_9m.txt")
m9$Depth <- '9m'
m11 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/BAT_NC_11m.txt")
m11$Depth <- '11m'
m13 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/BAT_NC_13m.txt")
m13$Depth <- '13m'
m15mw <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/BAT_NC_15mw.txt")
m15mw$Depth <- '15mw'
m15mm <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/BAT_NC_15mm.txt")
m15mm$Depth <- '15mm'
m15_5m <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/BAT_NC_15_5m.txt")
m15_5m$Depth <- '15_5m'
m17 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/BAT_NC_17m.txt")
m17$Depth <- '17m' 


NC_CAT <- rbind(m5_part1, m5_part2, m9, m11, m13, m15mw, m15mm, m15_5m, m17)
NC_CAT$category <- c("NCB")
NC_CAT$MAG<- NC_CAT$X..bin

##remove chlorophyta non sense bin
NC_CAT2<- NC_CAT[!NC_CAT$X..bin == "17m_Chlophyta_2ks_nohit_filtered_bin2.fa", ]

####(2) Competitive Binning
#CB BAT stats

m5_part1 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/GT_Bins_5m_0.txt")
m5_part1$Depth <- '5m'
m5_part2 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/GT_Bins_5m_1.txt")
m5_part2$Depth <- '5m'
m9 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/GT_Bins_9m.txt")
m9$Depth <- '9m'
m11 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/GT_Bins_11m.txt")
m11$Depth <- '11m'
m13 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/GT_Bins_13m.txt")
m13$Depth <- '13m'
m15mw <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/GT_Bins_15mw.txt")
m15mw$Depth <- '15mw'
m15mm <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/GT_Bins_15mm.txt")
m15mm$Depth <- '15mm'
m15_5m_1 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/GT_Bins_15_5_1.txt")
m15_5m_1$Depth <- '15_5m'
m15_5m <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/GT_Bins_15_5_0.txt")
m15_5m$Depth <- '15_5m'
m17 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/GT_Bins_17m.txt")
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
write.table(Sub_NCB2$X..bin, "G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/chemocline_NCB_names", quote=F, col.names=FALSE, row.names = F)


Sub_CB <- CB_NCB_CAT4[CB_NCB_CAT4$category %in% c("CB"), ]
Sub_CB2 <- Sub_CB[Sub_CB$Depth %in% c("15mm", "15mw", "15_5m", "13m"), ]
Sub_CB2 = dplyr::mutate(Sub_CB2, name = paste(Depth, X..bin,  sep='_'))
write.table(Sub_CB2$name, "G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/chemocline_CB_names", quote=F, col.names=FALSE, row.names = F)


##General STATISTICS
#(1) NCB
NC_stat <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Data_R_plots/Fig.1_Fig.S2/NC_Bins_stats.txt")
NC_stat$MAG<- str_replace_all(NC_stat$filename, "/srv/beegfs/scratch/users/s/saini7/MS2/NON_Comp_Bins/", "")
NC_stat$MAG<- str_replace(NC_stat$MAG, "NC_Bin_", "")
NC_stat$MAG<- str_replace(NC_stat$MAG, "_NC_", "_")
#(CB)
C_stat <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Data_R_plots/Fig.1_Fig.S2/C_Bins_stats.txt")
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

####################################################################################
####################################################################################
###################################Fig. 1A#########################################
####################################################################################
####################################################################################

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
  xlab("MAG count")+
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

####################################################################################
####################################################################################
###################################Fig. 1B##########################################
####################################################################################
####################################################################################

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
  # theme(axis.text.y = element_blank())+
  # theme(axis.title.y = element_blank())+
  theme(axis.ticks.y = element_blank())+
  xlab("MAG size")+
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
                                         colour ="black"),  legend.direction = "vertical")+
  ylab("Depth (m)")
  

Fig.1A / Fig.1B


###############################################################################################################
###############################################################################################################
###########################FIGURE MAIN 1 & SUPPLEMENTARY (Fig.1C-D, Fig.S2G)###################################
###############################################################################################################
###############################################################################################################
###############################################################################################################


##Get busco score for NON COMPETITIVE BINNING
busco_csv <- read.csv("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/busco_csv.csv")
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

####################################################################################
####################################################################################
###################################TABLE NON COMPETITIVE BINNING####################
####################################################################################
####################################################################################

write.csv(R_NCB_sub, "G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/NCB_Table_2.csv", row.names = F)


##select dataset eukaryotes

##select dataset eukaryotes
combine_bin5_drop3$Complete2 <- as.numeric(combine_bin5_drop3$Complete)

mySubset <- combine_bin5_drop3[ combine_bin5_drop3$Dataset %in% c("eukaryota_odb10", "chlorophyta_odb10", "stramenopiles_odb10"), ]
d <- mySubset[which(!mySubset$Complete2 < 10), ]


batch_busco_final<- d %>%
  dplyr::select(bins, Single, Duplicated, Fragmented, Missing)

batch_busco_NCB<- melt(batch_busco_final, id.vars = c("bins"))
#batch_busco_NCB$category<- c("NCB")
names(batch_busco_NCB)[names(batch_busco_NCB) == 'bins'] <- 'MAG'

batch_busco_1 <- merge(batch_busco_NCB, busco_NCB, by.x="MAG", by.y="X..bin")

batch_busco_1a<- batch_busco_1[ , -which(names(batch_busco_1) %in% c("MAG.y","Depth.y"))]
names(batch_busco_1a)[names(batch_busco_1a) == 'Depth.x'] <- 'Depth'


##Get busco score or Competitive Binning FIG. 1C
busco_cb <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/CB_autolineage_summary.txt")
busco_cb$bins<- str_replace(busco_cb$Sample_name, "/home/users/s/saini7/scratch/MS2/chemocline_bins/busco_out_09_07_2022/", "")
#busco_cb$Depth<- sub('\\_Bin_.*', '', busco_cb$bins) #Delete everything after a pattern


LC_meta5<-subset(LC_meta3, category!="NCB")
LC_meta5$MAG<- str_replace(LC_meta5$MAG, ".fa", "")
busco_CB <- merge(LC_meta5,busco_cb, by.x="MAG", by.y="bins",all.x = T)
R_busco_CB<- subset(busco_CB, select=-c(filename,Sample_name, X..bin, Depth_m))

####################################################################################
####################################################################################
###################################Table 1##########################################
####################################################################################
####################################################################################

write.csv(R_busco_CB, "G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/CB_Table_1.csv", row.names = F)


##select dataset eukaryotes

R_busco_CB$Complete2 <- as.numeric(R_busco_CB$Complete)

mySubset_CB <- R_busco_CB[R_busco_CB$Dataset %in% c("eukaryota_odb10", "chlorophyta_odb10", "stramenopiles_odb10"), ]
newdata23 <- mySubset_CB[which(!mySubset_CB$Complete2 < 10), ]



#d<-mySubset_CB_df[(mySubset_CB_df$Single>=10 & mySubset_CB_df$Missing<=50),]

batch_busco_final<- newdata23 %>%
  dplyr::select(MAG, Single, Duplicated, Fragmented, Missing)

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

####################################################################################
####################################################################################
###################################Fig. 1G##########################################
####################################################################################
####################################################################################


Fig.1G<- ggplot(batch_busco_merge2, aes(x=as.numeric(value), y=MAG, label=value)) + 
  geom_bar(aes(fill=variable),stat="identity", position = position_stack(reverse = T))+
  
  scale_y_discrete(limits=c("15_5m_Bin_87-contigs","15_5m_Bin_232-contigs","15mm_Bin_170-contigs", 
                            "15mw_Bin_36-contigs", "13m_Bin_209-contigs", "13m_Bin_181-contigs", "13m_Bin_243-contigs"))+
  
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
        legend.direction = "vertical")+
  guides(fill = guide_legend(nrow = 4))+
  theme(axis.text.y = element_blank())+
  theme(legend.position = "right")

#Fig. S2G
batch_busco_merge3<-subset(batch_busco_merge, category!="CB")



####################################################################################
####################################################################################
###################################Fig. S2G#########################################
####################################################################################
####################################################################################

#Fig. S2
Fig.S2G<- ggplot(batch_busco_merge3, aes(x=as.numeric(value), y=MAG, label=value)) + 
  geom_bar(aes(fill=variable),stat="identity", position = position_stack(reverse = T))+
  scale_y_discrete(limits=c("15_5m_45","15_5m_161","15_5m_12", "15mm_94", "15mw_87", "13m_164", "13m_9", "13m_230"))+
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



####################################################################################
####################################################################################
###################################Fig. 1D##########################################
####################################################################################
####################################################################################

#####Phyloflash Eukaryotic SSU rRNA (Ribosomal)

test.phyloFlash_compare.ntu_table2<- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.1_Fig.S2/test.phyloFlash_compare.ntu_table.tsv", header=FALSE, as.is=T)

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
  
  ylab("Relative abundance (eukaryotic SSU rRNA)")+
  guides(fill=guide_legend(nrow=5, title="Classification"))+
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
  theme(legend.position = "right")+
  theme(axis.text=element_text(size=12),axis.title=element_text(size=12))

Fig.1D #900x300


####################################################################################
##############################FIGURE 1#############################################

(((Fig.1A / Fig.1B)  |  (Fig.1G)) / (Fig.1D)) +   plot_layout(heights = c(2, 1)) #1300x900
 #900x500


###############################################################################################################
###############################################################################################################
############################################SUPPLEMENTARY  (Fig.S2)############################################
###############################################################################################################
###############################################################################################################
###############################################################################################################

####################################################################################
####################################################################################
###################################Fig. S2E#########################################
####################################################################################
####################################################################################


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
  xlab("MAG count")+
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
  # theme(axis.text.y = element_blank())+
  # theme(axis.title.y = element_blank())+
  theme(axis.ticks.y = element_blank())+
  xlab("MAG size")+
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
                                         colour ="black"),  legend.direction = "vertical")+
  ylab("Depth (m)")
  

Fig.S2E / Fig.S2F


##Stich Plots for Final Figure S2
(Fig.S2A | Fig.S2B  | Fig.S2C | Fig.S2D) / (Fig.S2E / Fig.S2F | Fig.S2G) + plot_layout(heights = c(1, 2)) #800x700



###############################################################################################################
###############################################################################################################
############################################FIGURE Fig.2 AND Fig.3#############################################
###############################################################################################################
###############################################################################################################
###############################################################################################################



##Add busco score of Chlorella Family 
Busco_summary_ncbi_3 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.2_Fig.3/chlorophytas_batch_summary.txt")

k <- 2 # keep first 3 fields only
Busco_summary_ncbi_3$accessions<- substr(Busco_summary_ncbi_3$Input_file, 1, sapply(gregexpr("_", Busco_summary_ncbi_3$Input_file), "[", k) - 1)

##Add Stats
Chlorella_stats_ncbi <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.2_Fig.3/Chlrella_family_tree_stats.txt")
Chlorella_stats_ncbi$filename<- str_replace_all(Chlorella_stats_ncbi$filename, "/srv/beegfs/scratch/users/s/saini7/datasets_db/Chlorellaceae/busco_phylo/Chlorella_Genomes_Cat_copy/", "")
Chlorella_stats_ncbi$accessions<- substr(Chlorella_stats_ncbi$filename, 1, sapply(gregexpr("_", Chlorella_stats_ncbi$filename), "[", k) - 1)

#Merge busco dataframe with stats
busco_stats<- merge(Chlorella_stats_ncbi, Busco_summary_ncbi_3, by="accessions")

##Upload NCBI info
ncbi_dataset <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.2_Fig.3/chlorella_genomes.txt")

##Add inform from NCBI
busco_stats2<- merge(busco_stats, ncbi_dataset, by.x="accessions", by.y="Assembly.Accession", all.x=T)
#busco_stats2$ <- trimws(busco_stats2$MAG)

busco_stats3 = dplyr::mutate(busco_stats2, Organism2 = paste(accessions, Organism.Name,  sep='|'))


###################################Fig. 2A,D,E######################################
#################################MADE BY BLOBTOOLS##################################


blob1 <- ggdraw() +
  draw_image("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Blobtools_files/blob_results2.snail.jpg") 
blob2 <- ggdraw() +
  draw_image("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Blobtools_files/blob_results2.blob.hex_chlorellaceae.jpg")           
blob3 <- ggdraw() +
  draw_image("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Blobtools_files/blob_results2.cumulative_chlorellaceae.jpg") 


####################################################################################
####################################################################################
###################################Fig. 2B##########################################
####################################################################################
####################################################################################

###Plot gene length distribution 
chlorella_gff3 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.2_Fig.3/Bin_40-contigs_non_chlorophyta_removed_30_June.1.Tier.txt", header = F)

chlo_drop_cds<- chlorella_gff3 %>% 
  filter(!grepl('CDS', V3))

# length of genes
chlo_drop_cds$gene_length <- chlo_drop_cds$V5 - chlo_drop_cds$V4

Fig.2B=gghistogram(chlo_drop_cds, x = "gene_length", 
               add = "mean", rug = F,
               color = "V2", fill = "V2",
               palette = c("#0073C2FF", "#FC4E07"))+
  xlab("Gene Length")+
  ylab("Gene Count")+
  theme(legend.position = c(0.35, 0.55), legend.direction = "vertical",
        legend.background = element_rect(size=0.3, colour ="black", 
                                         fill = "transparent"))

####BUSCO score for Chlorella Family

###############################################################################################################
###############################################################################################################
############################################FIGURE Fig.2#######################################################
###############################################################################################################
###############################################################################################################
###############################################################################################################


####################################################################################
####################################################################################
###################################Fig. 2C##########################################
####################################################################################
####################################################################################

busco_stats3$accessions<- str_replace_all(busco_stats3$accessions, "Bin_40-contigs", "Chlorophyta")


batch_summary2<- busco_stats3 %>%
  dplyr::select(c(35, 16:19))

busco_3<- melt(batch_summary2, id.vars = c("Organism2"))
busco_4<- merge(busco_3, busco_stats3, by="Organism2")

##Add prefix to rows 
busco_4$n_contigs_prefix = paste0('n=', busco_4$n_contigs)

##Pie chart for BUSCO fig. 2
busco_4p<- busco_4[1:4,]
# Compute percentages
busco_4p$fraction = busco_4p$value / sum(busco_4p$value)

# Compute the cumulative percentages (top of each rectangle)
busco_4p$ymax = cumsum(busco_4p$fraction)

# Compute the bottom of each rectangle
busco_4p$ymin = c(0, head(busco_4p$ymax, n=-1))

# Compute label position
busco_4p$labelPosition <- (busco_4p$ymax + busco_4p$ymin) / 2

# Compute a good label
busco_4p$label <- paste0(busco_4p$variable, "\n value: ", busco_4p$value)

# Make the plot
Fig.2C<- ggplot(busco_4p, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=variable)) +
  geom_rect() +
  geom_label_repel(x=3.5, aes(y=labelPosition, label=label), size=6) +
  #scale_fill_brewer(palette=4) +
  coord_polar(theta="y") +
  xlim(c(2, 4)) +
  theme_void() +
  theme(legend.position = "none")+
  scale_fill_manual("Busco score", values=c("#87d3f8", "#3492C7","#ffe119", "#D53E4F"), 
                    labels =c(" Complete (C) and single-copy (S)  ",
                              " Complete (C) and duplicated (D)",
                              " Fragmented (F)", " Missing (M)"))+
  xlim(c(1, 4)) 

####################################################################################
####################################################################################
###################################Fig. 2B-C########################################
####################################################################################
####################################################################################
Fig_2B_2C <-
  ggdraw() +
  draw_plot(Fig.2B) +
  draw_plot(Fig.2C, x = 0.46, y = .56, width = .40, height = .40) #6x6



(blob1 | Fig_2B_2C) / (blob2 | blob3) #1200x700



###############################################################################################################
###############################################################################################################
############################################FIGURE Fig.3#######################################################
###############################################################################################################
###############################################################################################################
###############################################################################################################

####################################################################################
####################################################################################
###################################Fig. 3A##########################################
####################################################################################
####################################################################################





#Drop first row 
#busco_stats3a<- busco_stats3[-c(1), ] 

####VISUALIZE NWK FILE TREE 

treen_chlorella<- read.tree("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.2_Fig.3/Chlorella_tree.nwk")

tree_1<- ggtree(treen_chlorella, size=1)+
  geom_label2((aes(label=label)))


tree_2<- ggtree(treen_chlorella, size=1)+
  geom_label2 (aes(label=label, 
                   subset = !is.na(as.numeric(label)) & as.numeric(label) > 80), color="black", size=4, hjust=1.25)

####VISUALIZE NWK FILE TREE 

tree_3<- tree_2 %<+% busco_stats3



Fig.3A <- tree_3+   
  geom_tiplab(aes(label=Organism2), size=5) +
  #geom_tippoint(aes(size=Size.Mb., color=as.numeric(GC.)))+
  geom_treescale(0.15,32.5, width = 0.1, fontsize = 5)+
  # theme (legend.position = "none")+
  xlim(0, 1.5)+
  # scale_size_continuous("Size (MB)", range = c(3, 7))+
  theme(legend.position = c(.2, .75))



####################################################################################
####################################################################################
###################################Fig. 3B##########################################
####################################################################################
####################################################################################

##Plot size and GC content
Fig.3B<- ggplot(busco_stats3, aes(x=as.numeric(contig_bp/1000000), y=Organism2, size=as.numeric(gc_avg)))+
  geom_segment(aes(x = 0, y = Organism2, xend=as.numeric(contig_bp/1000000), yend = Organism2), color = "grey40", size=1)+
  geom_point()+
  scale_x_continuous(breaks= pretty_breaks(10))+
  theme(legend.key = element_rect(fill = "white"))+
  theme(panel.background = element_rect(fill = 'white'))+
  scale_y_discrete(limits=c("GCA_000002595.3|Chlamydomonas reinhardtii", "GCA_004335735.1|Chlorella sp. KRBP", "GCA_002794665.1|Prototheca stagnorum","GCA_003255715.1|Prototheca wickerhamii", "GCA_016906385.1|Prototheca wickerhamii",
                            "GCA_002897115.2|Prototheca cutis", "GCA_000733215.1|Auxenochlorella protothecoides", "GCA_003709365.1|Auxenochlorella protothecoides", "Bin_40-contigs|NA", "GCA_004335555.1|Nannochloris sp. X1", "GCA_004335565.1|Nannochloris sp. RS",
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



####################################################################################
####################################################################################
###################################Fig. 3C##########################################
####################################################################################
####################################################################################

Fig.3C<- ggplot(busco_4, aes(x=as.numeric(value), y=Organism2, fill=variable)) + 
  geom_bar(stat="identity", position = position_stack(reverse = T))+
  xlab("Busco score (%)")+
  scale_fill_manual("Busco score", values=c("#87d3f8", "#3492C7","#ffe119", "#D53E4F"), 
                    labels =c(" Complete (C) and single-copy (S)  ",
                              " Complete (C) and duplicated (D)",
                              " Fragmented (F)", " Missing (M)"))+
  theme_bw()+
  scale_y_discrete(limits=c("GCA_000002595.3|Chlamydomonas reinhardtii", "GCA_004335735.1|Chlorella sp. KRBP", 
                            "GCA_002794665.1|Prototheca stagnorum","GCA_003255715.1|Prototheca wickerhamii", 
                            "GCA_016906385.1|Prototheca wickerhamii", "GCA_002897115.2|Prototheca cutis", 
                            "GCA_000733215.1|Auxenochlorella protothecoides", "GCA_003709365.1|Auxenochlorella protothecoides", 
                            "Bin_40-contigs|Chlorophyta_MAG_Cadagno", "GCA_004335555.1|Nannochloris sp. X1", 
                            "GCA_004335565.1|Nannochloris sp. RS",
                            "GCA_019044685.1|NA", "GCA_019202925.1|Chlorella desiccata (nom. nud.)", 
                            "GCA_001598975.1|Parachlorella kessleri", "GCA_008119945.1|Chlorella vulgaris", "GCA_015712045.1|Parachlorella kessleri", 
                            "GCA_003063905.1|Chlorella sp. A99", "GCA_002245815.2|Micractinium conductrix", 
                            "GCA_001430745.1|Auxenochlorella pyrenoidosa", "GCA_002896455.3|Chlorella sp. ArM0029B", 
                            "GCA_000147415.1|Chlorella variabilis",  "GCA_009720205.1|Chlorella vulgaris", "GCA_009720215.1|Chlorella vulgaris",
                            "GCA_001021125.1|Chlorella vulgaris", "GCA_013372505.1|Chlorella sp. BAC 9706", 
                            "GCA_002939045.1|Chlorella sorokiniana", "GCA_006782975.1|Chlorella sp. Dachan", 
                            "GCA_006782985.1|Chlorella sorokiniana", "GCA_009928355.1|Chlorella sp. CH2018", 
                            "GCA_002245835.2|Chlorella sorokiniana", "GCA_003116155.1|Chlorella sorokiniana", 
                            "GCA_003130725.1|Chlorella sorokiniana", "GCA_006782965.1|Chlorella sorokiniana"), 
                   labels=c("GCA_000002595.3|Chlamydomonas reinhardtii", "GCA_004335735.1|Chlorella sp. KRBP", 
                            "GCA_002794665.1|Prototheca stagnorum","GCA_003255715.1|Prototheca wickerhamii", 
                            "GCA_016906385.1|Prototheca wickerhamii",
                            "GCA_002897115.2|Prototheca cutis", "GCA_000733215.1|Auxenochlorella protothecoides", 
                            "GCA_003709365.1|Auxenochlorella protothecoides", "Chlorophyta_MAG_Cadagno", "GCA_004335555.1|Nannochloris sp. X1",
                            "GCA_004335565.1|Nannochloris sp. RS", 
                            "GCA_019044685.1|Chlorella desiccata", "GCA_019202925.1|Chlorella desiccata", 
                            "GCA_001598975.1|Parachlorella kessleri", "GCA_008119945.1|Chlorella vulgaris", 
                            "GCA_015712045.1|Parachlorella kessleri", "GCA_003063905.1|Chlorella sp. A99", 
                            "GCA_002245815.2|Micractinium conductrix", "GCA_001430745.1|Auxenochlorella pyrenoidosa", 
                            "GCA_002896455.3|Chlorella sp. ArM0029B", "GCA_000147415.1|Chlorella variabilis",  
                            "GCA_009720205.1|Chlorella vulgaris", "GCA_009720215.1|Chlorella vulgaris",
                            "GCA_001021125.1|Chlorella vulgaris", "GCA_013372505.1|Chlorella sp. BAC 9706", "GCA_002939045.1|Chlorella sorokiniana", 
                            "GCA_006782975.1|Chlorella sp. Dachan", "GCA_006782985.1|Chlorella sorokiniana", "GCA_009928355.1|Chlorella sp. CH2018", 
                            "GCA_002245835.2|Chlorella sorokiniana", "GCA_003116155.1|Chlorella sorokiniana", 
                            "GCA_003130725.1|Chlorella sorokiniana", "GCA_006782965.1|Chlorella sorokiniana"))+
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
############################################MAIN FIGURE Fig.4 (B,C)############################################
###############################################################################################################
###############################################################################################################
###############################################################################################################


####################################################################################
####################################################################################
###################################Fig. 4B##########################################
####################################################################################
####################################################################################

PP_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.4/Chloroplasts/Chlorella/Cov_mapped_5m_r.txt")
PP_9m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.4/Chloroplasts/Chlorella/Cov_mapped_9m_r.txt")
PP_11m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.4/Chloroplasts/Chlorella/Cov_mapped_11m_r.txt")
PP_13m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.4/Chloroplasts/Chlorella/Cov_mapped_13m_r.txt")
PP_15mw_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.4/Chloroplasts/Chlorella/Cov_mapped_15mw_r.txt")
PP_15mm_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.4/Chloroplasts/Chlorella/Cov_mapped_15mm_r.txt")
PP_15_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.4/Chloroplasts/Chlorella/Cov_mapped_15_5m_r.txt")
PP_17m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.4/Chloroplasts/Chlorella/Cov_mapped_17m_r.txt")

com_df1 <- rbind(PP_5m_r, PP_9m_r, PP_11m_r, PP_13m_r, PP_15mw_r, PP_15mm_r, PP_15_5m_r, PP_17m_r)

com_df1$sample<- c("5", "9", "11", "13", "15mw", "15mm", "15.5", "17")

###Chlorella chloroplast

Fig.4B<- ggplot(data=com_df1, aes(x=meandepth,size=(log(numreads)), y=sample)) +
  geom_segment(aes(x = 0, y = sample, xend=meandepth, yend = sample), color = "grey40", size=1)+
  geom_point()+
  theme_bw()+
  # coord_cartesian(xlim = c(7.12, 11))+
  scale_y_discrete("Depth (m)", limits=c("17","","15.5", "15mm", "15mw",
                                         "13","","11", 
                                         "9", "5", ""), 
                   labels=c("17","","15.5", "15", "15-w" , "13","", "11", "9", "5"), position = "right")+
  
  theme( # remove the vertical grid lines
    panel.grid.major.x = element_blank() ,
    # explicitly set the horizontal lines (or they will disappear too)
    panel.grid.major.y = element_blank())+
  theme(legend.direction = "vertical", legend.position = c(0.70, 0.75),
        legend.background = element_rect(size=0.3, colour ="black", 
                                         fill = "transparent"))+
  
  
  theme(axis.ticks.y  = element_blank())+
  annotate("text", x = 12.5, y = 11, label = "Mixolimnion")+
  annotate("text", x = 12.5, y = 6.5, label = "Chemocline")+
  annotate("text", x = 16, y = 2, label = "Monimolimnion")+
  xlab("Mean depth of coverage")+
  guides(size=guide_legend(title="log(#reads)"))+
  scale_size_continuous(breaks = seq(range(log(com_df1$numreads))[1], range(log(com_df1$numreads))[2], length.out = 5))

Fig.4B<- Fig.4B + scale_y_discrete("Depth (m)", limits=c("17","","15.5", "15mm", "15mw",
                                                                "13","","11", 
                                                                "9", "5", ""), 
                                          labels=c("17","","15.5", "15", "15-w" , "13","", "11", "9", "5"), position = "left")

####################################################################################
####################################################################################
###################################Fig. 4C##########################################
####################################################################################
####################################################################################

PP_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.4/Chloroplasts/Cryptomonas/Cov_mapped_5m_r.txt")
PP_5m_r$sample <- "5"
PP_9m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.4/Chloroplasts/Cryptomonas/Cov_mapped_9m_r.txt")
PP_9m_r$sample <- "9"
PP_11m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.4/Chloroplasts/Cryptomonas/Cov_mapped_11m_r.txt")
PP_11m_r$sample <- "11"
PP_13m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.4/Chloroplasts/Cryptomonas/Cov_mapped_13m_r.txt")
PP_13m_r$sample <- "13"
PP_15mw_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.4/Chloroplasts/Cryptomonas/Cov_mapped_15mw_r.txt")
PP_15mw_r$sample <- "15mw"
PP_15mm_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.4/Chloroplasts/Cryptomonas/Cov_mapped_15mm_r.txt")
PP_15mm_r$sample <- "15mm"
PP_15_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.4/Chloroplasts/Cryptomonas/Cov_mapped_15_5m_r.txt")
PP_15_5m_r$sample <- "15.5"
PP_17m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.4/Chloroplasts/Cryptomonas/Cov_mapped_17m_r.txt")
PP_17m_r$sample <- "17"

com_df1 <- rbind(PP_5m_r, PP_9m_r, PP_11m_r, PP_13m_r, PP_15mw_r, PP_15mm_r, PP_15_5m_r, PP_17m_r)

Fig.4C <- ggplot(data=com_df1, aes(x=meandepth,size=(log(numreads)), y=sample)) +
  geom_segment(aes(x = 0, y = sample, xend=meandepth, yend = sample), color = "grey40", size=1)+
  geom_point()+
  theme_bw()+
  # coord_cartesian(xlim = c(7.12, 11))+
  scale_y_discrete("Depth (m)", limits=c("17","","15.5", "15mm", "15mw",
                                         "13","","11", 
                                         "9", "5", ""), 
                   labels=c("17","","15.5", "15", "15-w" , "13","", "11", "9", "5"), position = "left")+
  
  theme( # remove the vertical grid lines
    panel.grid.major.x = element_blank() ,
    # explicitly set the horizontal lines (or they will disappear too)
    panel.grid.major.y = element_blank())+
  theme(legend.direction = "vertical", legend.position = c(0.70, 0.75),
        legend.background = element_rect(size=0.3, colour ="black", 
                                         fill = "transparent"))+
  
  
  theme(axis.ticks.y  = element_blank())+
  annotate("text", x = 12.5, y = 11, label = "Mixolimnion")+
  annotate("text", x = 12.5, y = 6.5, label = "Chemocline")+
  annotate("text", x = 16, y = 2, label = "Monimolimnion")+
  xlab("Mean depth of coverage")+
  guides(size=guide_legend(title="log(#reads)"))+
  scale_size_continuous(breaks = seq(range(log(com_df1$numreads))[1], range(log(com_df1$numreads))[2], length.out = 5))


Fig.4C<- Fig.4C + scale_y_discrete("Depth (m)", limits=c("17","","15.5", "15mm", "15mw",
                                                                    "13","","11", 
                                                                    "9", "5", ""), 
                                              labels=c("17","","15.5", "15", "15-w" , "13","", "11", "9", "5"), position = "left")


Fig.4B / Fig.4C
 
 cpA <- ggdraw() +
    draw_image("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.4/Chloroplasts/job-results-2021122162807/job-results-2021122162807/GeSeqJob-20211204-121545_cpA_OGDRAW.jpg") 
 cpB <- ggdraw() +
               draw_image("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.4/Chloroplasts/job-results-2021122162807/job-results-2021122162807/GeSeqJob-20211204-122045_cpB_OGDRAW.jpg")           

 
 ####################################################################################
 ####################################################################################
 ###################################Fig. 4B-E########################################
 ####################################################################################
 ####################################################################################
 
 ggarrange (ggarrange(Fig.4B, Fig.4C, nrow=2), ggarrange(cpA, cpB, nrow=2), widths = c(1,5.5)) #16x10
 
 

 
###############################################################################################################
###############################################################################################################
############################################MAIN FIGURE Fig.5##################################################
###############################################################################################################
###############################################################################################################
###############################################################################################################

###############################################################################################################
                               #Upload Chlorobium phaeobacteroides coverage#
###############################################################################################################


lib_17m_mapped_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/chloro_ph/Cov_mapped_5m_r.txt")
lib_17m_mapped_5m_r$libraries <- "Chlorobium_ph"
lib_17m_mapped_5m_r$Depth <- "5m"


lib_17m_mapped_9m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/chloro_ph/Cov_mapped_9m_r.txt")
lib_17m_mapped_9m_r$libraries <- "Chlorobium_ph"
lib_17m_mapped_9m_r$Depth <- "9m"


lib_17m_mapped_11m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/chloro_ph/Cov_mapped_11m_r.txt")
lib_17m_mapped_11m_r$libraries <- "Chlorobium_ph"
lib_17m_mapped_11m_r$Depth <- "11m"


lib_17m_mapped_13m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/chloro_ph/Cov_mapped_13m_r.txt")
lib_17m_mapped_13m_r$libraries <- "Chlorobium_ph"
lib_17m_mapped_13m_r$Depth <- "13m"


lib_17m_mapped_15mm_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/chloro_ph/Cov_mapped_15mm_r.txt")
lib_17m_mapped_15mm_r$libraries <- "Chlorobium_ph"
lib_17m_mapped_15mm_r$Depth <- "15mm"


lib_17m_mapped_15mw_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/chloro_ph/Cov_mapped_15mw_r.txt")
lib_17m_mapped_15mw_r$libraries <- "Chlorobium_ph"
lib_17m_mapped_15mw_r$Depth <- "15mw"


lib_17m_mapped_15_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/chloro_ph/Cov_mapped_15_5m_r.txt")
lib_17m_mapped_15_5m_r$libraries <- "Chlorobium_ph"
lib_17m_mapped_15_5m_r$Depth <- "15_5m"


lib_17m_mapped_17m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/chloro_ph/Cov_mapped_17m_r.txt")
lib_17m_mapped_17m_r$libraries <- "Chlorobium_ph"
lib_17m_mapped_17m_r$Depth <- "17m"


###############################################################################################################
#Upload Chlorobium sp coverage#
###############################################################################################################

VR_chloroph <- rbind(lib_17m_mapped_5m_r, lib_17m_mapped_11m_r, lib_17m_mapped_9m_r, lib_17m_mapped_13m_r, lib_17m_mapped_15mm_r, lib_17m_mapped_15mw_r, lib_17m_mapped_15_5m_r, lib_17m_mapped_17m_r)


lib_17m_mapped_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/chloro_sp/Cov_mapped_5m_r.txt")
lib_17m_mapped_5m_r$libraries <- "Chlorobium_sp"
lib_17m_mapped_5m_r$Depth <- "5m"


lib_17m_mapped_9m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/chloro_sp/Cov_mapped_9m_r.txt")
lib_17m_mapped_9m_r$libraries <- "Chlorobium_sp"
lib_17m_mapped_9m_r$Depth <- "9m"


lib_17m_mapped_11m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/chloro_sp/Cov_mapped_11m_r.txt")
lib_17m_mapped_11m_r$libraries <- "Chlorobium_sp"
lib_17m_mapped_11m_r$Depth <- "11m"


lib_17m_mapped_13m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/chloro_sp/Cov_mapped_13m_r.txt")
lib_17m_mapped_13m_r$libraries <- "Chlorobium_sp"
lib_17m_mapped_13m_r$Depth <- "13m"


lib_17m_mapped_15mm_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/chloro_sp/Cov_mapped_15mm_r.txt")
lib_17m_mapped_15mm_r$libraries <- "Chlorobium_sp"
lib_17m_mapped_15mm_r$Depth <- "15mm"


lib_17m_mapped_15mw_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/chloro_sp/Cov_mapped_15mw_r.txt")
lib_17m_mapped_15mw_r$libraries <- "Chlorobium_sp"
lib_17m_mapped_15mw_r$Depth <- "15mw"


lib_17m_mapped_15_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/chloro_sp/Cov_mapped_15_5m_r.txt")
lib_17m_mapped_15_5m_r$libraries <- "Chlorobium_sp"
lib_17m_mapped_15_5m_r$Depth <- "15_5m"


lib_17m_mapped_17m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/chloro_sp/Cov_mapped_17m_r.txt")
lib_17m_mapped_17m_r$libraries <- "Chlorobium_sp"
lib_17m_mapped_17m_r$Depth <- "17m"



VR_chlorosp <- rbind(lib_17m_mapped_5m_r, lib_17m_mapped_11m_r, lib_17m_mapped_9m_r, lib_17m_mapped_13m_r, lib_17m_mapped_15mm_r, lib_17m_mapped_15mw_r, lib_17m_mapped_15_5m_r, lib_17m_mapped_17m_r)


###############################################################################################################
#Upload Chlorella-like MAG coverage#
###############################################################################################################

lib_17m_mapped_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/chlorophyta/Cov_mapped_5m_r.txt")
lib_17m_mapped_5m_r$libraries <- "Chlorella"
lib_17m_mapped_5m_r$Depth <- "5m"


lib_17m_mapped_9m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/chlorophyta/Cov_mapped_9m_r.txt")
lib_17m_mapped_9m_r$libraries <- "Chlorella"
lib_17m_mapped_9m_r$Depth <- "9m"


lib_17m_mapped_11m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/chlorophyta/Cov_mapped_11m_r.txt")
lib_17m_mapped_11m_r$libraries <- "Chlorella"
lib_17m_mapped_11m_r$Depth <- "11m"


lib_17m_mapped_13m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/chlorophyta/Cov_mapped_13m_r.txt")
lib_17m_mapped_13m_r$libraries <- "Chlorella"
lib_17m_mapped_13m_r$Depth <- "13m"


lib_17m_mapped_15mm_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/chlorophyta/Cov_mapped_15mm_r.txt")
lib_17m_mapped_15mm_r$libraries <- "Chlorella"
lib_17m_mapped_15mm_r$Depth <- "15mm"


lib_17m_mapped_15mw_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/chlorophyta/Cov_mapped_15mw_r.txt")
lib_17m_mapped_15mw_r$libraries <- "Chlorella"
lib_17m_mapped_15mw_r$Depth <- "15mw"


lib_17m_mapped_15_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/chlorophyta/Cov_mapped_15_5m_r.txt")
lib_17m_mapped_15_5m_r$libraries <- "Chlorella"
lib_17m_mapped_15_5m_r$Depth <- "15_5m"


lib_17m_mapped_17m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/chlorophyta/Cov_mapped_17m_r.txt")
lib_17m_mapped_17m_r$libraries <- "Chlorella"
lib_17m_mapped_17m_r$Depth <- "17m"



VR_chlorella <- rbind(lib_17m_mapped_5m_r, lib_17m_mapped_11m_r, lib_17m_mapped_9m_r, lib_17m_mapped_13m_r, lib_17m_mapped_15mm_r, lib_17m_mapped_15mw_r, lib_17m_mapped_15_5m_r, lib_17m_mapped_17m_r)


###############################################################################################################
#Upload Thiodictyon Syntrophicum coverage#
###############################################################################################################

lib_17m_mapped_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/thiod/Cov_mapped_5m_r.txt")
lib_17m_mapped_5m_r$libraries <- "Thiod"
lib_17m_mapped_5m_r$Depth <- "5m"


lib_17m_mapped_9m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/thiod/Cov_mapped_9m_r.txt")
lib_17m_mapped_9m_r$libraries <- "Thiod"
lib_17m_mapped_9m_r$Depth <- "9m"


lib_17m_mapped_11m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/thiod/Cov_mapped_11m_r.txt")
lib_17m_mapped_11m_r$libraries <- "Thiod"
lib_17m_mapped_11m_r$Depth <- "11m"


lib_17m_mapped_13m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/thiod/Cov_mapped_13m_r.txt")
lib_17m_mapped_13m_r$libraries <- "Thiod"
lib_17m_mapped_13m_r$Depth <- "13m"


lib_17m_mapped_15mm_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/thiod/Cov_mapped_15mm_r.txt")
lib_17m_mapped_15mm_r$libraries <- "Thiod"
lib_17m_mapped_15mm_r$Depth <- "15mm"


lib_17m_mapped_15mw_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/thiod/Cov_mapped_15mw_r.txt")
lib_17m_mapped_15mw_r$libraries <- "Thiod"
lib_17m_mapped_15mw_r$Depth <- "15mw"


lib_17m_mapped_15_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/thiod/Cov_mapped_15_5m_r.txt")
lib_17m_mapped_15_5m_r$libraries <- "Thiod"
lib_17m_mapped_15_5m_r$Depth <- "15_5m"


lib_17m_mapped_17m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/thiod/Cov_mapped_17m_r.txt")
lib_17m_mapped_17m_r$libraries <- "Thiod"
lib_17m_mapped_17m_r$Depth <- "17m"



VR_thiod <- rbind(lib_17m_mapped_5m_r, lib_17m_mapped_11m_r, lib_17m_mapped_9m_r, lib_17m_mapped_13m_r, lib_17m_mapped_15mm_r, lib_17m_mapped_15mw_r, lib_17m_mapped_15_5m_r, lib_17m_mapped_17m_r)

###############################################################################################################
#Upload Thiocystis sp. coverage#
###############################################################################################################

lib_17m_mapped_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/thiocys/Cov_mapped_5m_r.txt")
lib_17m_mapped_5m_r$libraries <- "thiocys"
lib_17m_mapped_5m_r$Depth <- "5m"


lib_17m_mapped_9m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/thiocys/Cov_mapped_9m_r.txt")
lib_17m_mapped_9m_r$libraries <- "thiocys"
lib_17m_mapped_9m_r$Depth <- "9m"


lib_17m_mapped_11m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/thiocys/Cov_mapped_11m_r.txt")
lib_17m_mapped_11m_r$libraries <- "thiocys"
lib_17m_mapped_11m_r$Depth <- "11m"


lib_17m_mapped_13m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/thiocys/Cov_mapped_13m_r.txt")
lib_17m_mapped_13m_r$libraries <- "thiocys"
lib_17m_mapped_13m_r$Depth <- "13m"


lib_17m_mapped_15mm_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/thiocys/Cov_mapped_15mm_r.txt")
lib_17m_mapped_15mm_r$libraries <- "thiocys"
lib_17m_mapped_15mm_r$Depth <- "15mm"


lib_17m_mapped_15mw_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/thiocys/Cov_mapped_15mw_r.txt")
lib_17m_mapped_15mw_r$libraries <- "thiocys"
lib_17m_mapped_15mw_r$Depth <- "15mw"


lib_17m_mapped_15_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/thiocys/Cov_mapped_15_5m_r.txt")
lib_17m_mapped_15_5m_r$libraries <- "thiocys"
lib_17m_mapped_15_5m_r$Depth <- "15_5m"


lib_17m_mapped_17m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/thiocys/Cov_mapped_17m_r.txt")
lib_17m_mapped_17m_r$libraries <- "thiocys"
lib_17m_mapped_17m_r$Depth <- "17m"



VR_thiocys <- rbind(lib_17m_mapped_5m_r, lib_17m_mapped_11m_r, lib_17m_mapped_9m_r, lib_17m_mapped_13m_r, lib_17m_mapped_15mm_r, lib_17m_mapped_15mw_r, lib_17m_mapped_15_5m_r, lib_17m_mapped_17m_r)

###############################################################################################################
#Upload Lamprocystis purpurea coverage#
###############################################################################################################

lib_17m_mapped_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/lampo/Cov_mapped_5m_r.txt")
lib_17m_mapped_5m_r$libraries <- "lampo"
lib_17m_mapped_5m_r$Depth <- "5m"


lib_17m_mapped_9m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/lampo/Cov_mapped_9m_r.txt")
lib_17m_mapped_9m_r$libraries <- "lampo"
lib_17m_mapped_9m_r$Depth <- "9m"


lib_17m_mapped_11m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/lampo/Cov_mapped_11m_r.txt")
lib_17m_mapped_11m_r$libraries <- "lampo"
lib_17m_mapped_11m_r$Depth <- "11m"


lib_17m_mapped_13m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/lampo/Cov_mapped_13m_r.txt")
lib_17m_mapped_13m_r$libraries <- "lampo"
lib_17m_mapped_13m_r$Depth <- "13m"


lib_17m_mapped_15mm_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/lampo/Cov_mapped_15mm_r.txt")
lib_17m_mapped_15mm_r$libraries <- "lampo"
lib_17m_mapped_15mm_r$Depth <- "15mm"


lib_17m_mapped_15mw_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/lampo/Cov_mapped_15mw_r.txt")
lib_17m_mapped_15mw_r$libraries <- "lampo"
lib_17m_mapped_15mw_r$Depth <- "15mw"


lib_17m_mapped_15_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/lampo/Cov_mapped_15_5m_r.txt")
lib_17m_mapped_15_5m_r$libraries <- "lampo"
lib_17m_mapped_15_5m_r$Depth <- "15_5m"


lib_17m_mapped_17m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/lampo/Cov_mapped_17m_r.txt")
lib_17m_mapped_17m_r$libraries <- "lampo"
lib_17m_mapped_17m_r$Depth <- "17m"



VR_lamp <- rbind(lib_17m_mapped_5m_r, lib_17m_mapped_11m_r, lib_17m_mapped_9m_r, lib_17m_mapped_13m_r, lib_17m_mapped_15mm_r, lib_17m_mapped_15mw_r, lib_17m_mapped_15_5m_r, lib_17m_mapped_17m_r)

###############################################################################################################
#Upload Chromatium okenii coverage#
###############################################################################################################
lib_17m_mapped_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/chromat/Cov_mapped_5m_r.txt")
lib_17m_mapped_5m_r$libraries <- "chromat"
lib_17m_mapped_5m_r$Depth <- "5m"


lib_17m_mapped_9m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/chromat/Cov_mapped_9m_r.txt")
lib_17m_mapped_9m_r$libraries <- "lampo"
lib_17m_mapped_9m_r$Depth <- "9m"


lib_17m_mapped_11m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/chromat/Cov_mapped_11m_r.txt")
lib_17m_mapped_11m_r$libraries <- "chromat"
lib_17m_mapped_11m_r$Depth <- "11m"


lib_17m_mapped_13m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/chromat/Cov_mapped_13m_r.txt")
lib_17m_mapped_13m_r$libraries <- "chromat"
lib_17m_mapped_13m_r$Depth <- "13m"


lib_17m_mapped_15mm_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/chromat/Cov_mapped_15mm_r.txt")
lib_17m_mapped_15mm_r$libraries <- "chromat"
lib_17m_mapped_15mm_r$Depth <- "15mm"


lib_17m_mapped_15mw_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/chromat/Cov_mapped_15mw_r.txt")
lib_17m_mapped_15mw_r$libraries <- "chromat"
lib_17m_mapped_15mw_r$Depth <- "15mw"


lib_17m_mapped_15_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/chromat/Cov_mapped_15_5m_r.txt")
lib_17m_mapped_15_5m_r$libraries <- "chromat"
lib_17m_mapped_15_5m_r$Depth <- "15_5m"


lib_17m_mapped_17m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/psb_gsb/chromat/Cov_mapped_17m_r.txt")
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


####################################################################################
####################################################################################
###################################Fig. 5A##########################################
####################################################################################
####################################################################################

Fig.5A<- ggplot(final_2fig, aes(y=Depth, x=numreads)) +
  #geom_jitter(
  #  aes(color = libraries), alpha=0.05, 
  #  position = position_jitter(0.2),
  #  size = 1.2
  #) +
  stat_summary(
    aes(color = libraries),
    fun.data="mean_sdl",  fun.args = list(mult=1), 
    geom = "pointrange",  size = 1, alpha=0.5,
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
  xlim(0,20000)+
  #theme(axis.text.y = element_blank())+
  #theme(axis.title.y = element_blank())+
  theme(legend.position = "none")+
  theme(axis.ticks.y = element_blank())+
  theme(axis.text=element_text(size=12),axis.title=element_text(size=12))
  

####################################################################################
####################################################################################
###################################Fig. 5B##########################################
####################################################################################
####################################################################################

Fig.5B<- ggplot(final_2fig, aes(y=Depth, x=meandepth)) + 
  # geom_jitter(
  #  aes(color = libraries), alpha=0.05, 
  #  position = position_jitter(0.2),
  #  size = 1.2
  #) +
  stat_summary(
    aes(color = libraries),
    fun.data="mean_sdl",  fun.args = list(mult=1), 
    geom = "pointrange",  size = 1, alpha=0.5,
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
  xlim(0,150)+
  theme(axis.text=element_text(size=12),axis.title=element_text(size=12))


##Cover M

CV_5mSCM <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/Main_MAGs_coverage_5m_mean.tsv", header=T)
colnames(CV_5mSCM)[2] <- "Rel_Abun"
CV_5mSCM$Depth <- "5m"

CV_9mSCM <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/Main_MAGs_coverage_9m_mean.tsv", header=T)
colnames(CV_9mSCM)[2] <- "Rel_Abun"
CV_9mSCM$Depth <- "9m"

CV_11mSCM <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/Main_MAGs_coverage_11m_mean.tsv", header=T)
colnames(CV_11mSCM)[2] <- "Rel_Abun"
CV_11mSCM$Depth <- "11m"

CV_13mSCM <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/Main_MAGs_coverage_13m_mean.tsv", header=T)
colnames(CV_13mSCM)[2] <- "Rel_Abun"
CV_13mSCM$Depth <- "13m"

CV_15mmSCM <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/Main_MAGs_coverage_15mm_mean.tsv", header=T)
colnames(CV_15mmSCM)[2] <- "Rel_Abun"
CV_15mmSCM$Depth <- "15mm"

CV_15mwSCM <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/Main_MAGs_coverage_15mw.tsv", header=T)
colnames(CV_15mwSCM)[2] <- "Rel_Abun"
CV_15mwSCM$Depth <- "15mw"

CV_15_5mSCM <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/Main_MAGs_coverage_15_5m_mean.tsv", header=T)
colnames(CV_15_5mSCM)[2] <- "Rel_Abun"
CV_15_5mSCM$Depth <- "15_5m"

CV_17mSCM <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/Main_MAGs_coverage_17m_mean.tsv", header=T)
colnames(CV_17mSCM)[2] <- "Rel_Abun"
CV_17mSCM$Depth <- "17m"

Cover_merge_cat_2<- rbind(CV_5mSCM, CV_9mSCM, CV_11mSCM, CV_13mSCM, CV_15mmSCM, CV_15mwSCM, CV_15_5mSCM, CV_17mSCM)

Cover_merge_ca <- subset(Cover_merge_cat_2, Genome != "unmapped")
Cover_merge_ca3 <- subset(Cover_merge_ca, Genome != "chlorobium_15mm_20")
Cover_merge_ca5 <- subset(Cover_merge_ca3, Genome != "chlorophyta_13m_164")
Cover_merge_ca6 <- subset(Cover_merge_ca5, Genome != "chromatium_13m_206")


####################################################################################
####################################################################################
###################################Fig. 5C##########################################
####################################################################################
####################################################################################

Fig.5C<- ggplot(Cover_merge_ca6, aes(x=Rel_Abun, y=Depth, fill=Genome)) + 
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
  guides(fill = guide_legend(nrow = 3))+
  theme(axis.text=element_text(size=12),axis.title=element_text(size=12))+
  guides(fill="none")




Fig.5A | Fig.5B | Fig.5C #700x500


####################################################################################
####################################################################################
###################################Fig. 5D-H########################################
####################################################################################
####################################################################################

#Import eggnogg annotation
Egg_nog_mapper <- read.csv("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/Egg_nog_mapper.csv")




#Bring keep Anvio
KO_Orthology_ko00001 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/KO_Orthology_ko00001.txt", header=FALSE)
KO_Orthology_ko00001$V5<- str_before_nth(KO_Orthology_ko00001$V4, " ", 1)
trimws(KO_Orthology_ko00001$V5)
KO_Orthology_ko00001_2 = KO_Orthology_ko00001[ , -which(names(KO_Orthology_ko00001) %in% c("V1"))]
names(KO_Orthology_ko00001_2)[names(KO_Orthology_ko00001_2) == 'V2'] <- 'Metabolism'
names(KO_Orthology_ko00001_2)[names(KO_Orthology_ko00001_2) == 'V3'] <- 'Pathway'
names(KO_Orthology_ko00001_2)[names(KO_Orthology_ko00001_2) == 'V4'] <- 'KO_gene'
names(KO_Orthology_ko00001_2)[names(KO_Orthology_ko00001_2) == 'V5'] <- 'K_number'



###Now continue to join egg and kegg
zed<- merge(Egg_nog_mapper, KO_Orthology_ko00001_2, by="K_number")
#

###Extract pathways for C, N, and S metabolism
DF2<- zed[zed$Pathway %like% "00710", ]
DF3<- zed[zed$Pathway %like% "00910", ]
DF4<- zed[zed$Pathway %like% "00920", ]
#DF5<- zed3[zed3$V3.y %like% "00195", ]
#DF6<- zed3[zed3$V3.y %like% "00196", ]
DFF<- rbind(DF2, DF3, DF4)
#DFFb<- rbind(DF2, DF3, DF4, DF5, DF6)
#DFFb2<- setDT(DFFb)[, un.col1 := uniqueN(K_number)==.N, by = V22]
#DFFb2<- setDT(DFFb)[, un.col2 := uniqueN(V22) > 1, by = K_number]
#df <- DFFb %>%
#  distinct(V22, K_number,V3.y, .keep_all = TRUE)

unique(DFF$max_annot_lvl)

DFF$Acc<- str_before_nth(DFF$Input_file, "_", 2)
DFF$Acc<- str_replace_all(DFF$Acc, "Bin_40-contigs", "Lake Cadagno MAG")

kegg_genesbr5 <- DFF[, c("Acc", "query", "Pathway")]
kegg_genesbr5$count<- "1"
kegg_genesbr5$count <- as.numeric(kegg_genesbr5$count)


kegg_genesbr6<- kegg_genesbr5[, c("Acc", "count", "Pathway")]

#kegg_genesbr6bc<- kegg_genesbr6b[kegg_genesbr6b$Acc %like% "Lake", ]


kegg_genesbr7<- kegg_genesbr6 %>%
  dplyr::group_by(Pathway, Acc) %>%
  dplyr::summarise(across(count, sum))



kegg_genesbr7b<- kegg_genesbr6 %>%
  dplyr::group_by(Acc) %>%
  dplyr::summarise(across(count, sum))

#kegg_genesbr7c<- kegg_genesbr6 %>%
#  dplyr::group_by(Pathway) %>%
#  dplyr::summarise(across(count, sum))



kegg_genesbr7b$n_prefix = paste0('n=', kegg_genesbr7b$count)


kegg_genesbr8<- group_by(kegg_genesbr7, Acc) %>% transmute(Pathway, percent = count/sum(count))


kegg_genesbr8b<- merge(kegg_genesbr8, kegg_genesbr7b, by="Acc")




kegg_genesbr6<- kegg_genesbr5[, c("Acc", "query", "count", "KEGG_Pathway")]

#kegg_genesbr6bc<- kegg_genesbr6b[kegg_genesbr6b$Acc %like% "Lake", ]



kegg_genesbr7<- kegg_genesbr6 %>%
  dplyr::group_by(COG_category, Acc) %>%
  dplyr::summarise(across(count, sum))




kegg_genesbr7b<- kegg_genesbr6 %>%
  dplyr::group_by(Acc) %>%
  dplyr::summarise(across(count, sum))

kegg_genesbr7c<- kegg_genesbr6 %>%
  dplyr::group_by(V7) %>%
  dplyr::summarise(across(count, sum))



kegg_genesbr7b$n_prefix = paste0('n=', kegg_genesbr7b$count)


kegg_genesbr8<- group_by(kegg_genesbr7, Acc) %>% transmute(V7, percent = count/sum(count))


kegg_genesbr8b<- merge(kegg_genesbr8, kegg_genesbr7b, by="Acc")

##Updating names of the genomes
kegg_genesbr8b$Acc <- gsub("GCA_000002595.3", "GCA_000002595.3|Chlamydomonas reinhardtii", kegg_genesbr8b$Acc)
kegg_genesbr8b$Acc <- gsub("GCA_000147415.1", "GCF_000147415.1|Chlorella variabilis", kegg_genesbr8b$Acc)
kegg_genesbr8b$Acc <- gsub("GCA_000733215.1", "GCA_000733215.1|Auxenochlorella protothecoides", kegg_genesbr8b$Acc)
kegg_genesbr8b$Acc <- gsub("GCA_002245815.2", "GCA_002245815.2|Micractinium conductrix", kegg_genesbr8b$Acc)
kegg_genesbr8b$Acc <- gsub("GCA_001598975.1", "GCA_001598975.1|Parachlorella kessleri", kegg_genesbr8b$Acc)
kegg_genesbr8b$Acc <- gsub("GCA_002896455.3", "GCA_002896455.3|Chlorella sp. ArM0029B", kegg_genesbr8b$Acc)
kegg_genesbr8b$Acc <- gsub("GCA_003063905.1", "GCA_003063905.1|Chlorella sp. A99", kegg_genesbr8b$Acc)
kegg_genesbr8b$Acc <- gsub("GCA_004335565.1", "GCA_004335565.1|Nannochloris sp. RS", kegg_genesbr8b$Acc)
kegg_genesbr8b$Acc <- gsub("GCA_009720215.1", "GCA_009720215.1|Chlorella vulgaris", kegg_genesbr8b$Acc)
kegg_genesbr8b$Acc <- gsub("GCA_009928355.1", "GCA_009928355.1|Chlorella sp. CH2018", kegg_genesbr8b$Acc)
kegg_genesbr8b$Acc <- gsub("GCA_004335735.1", "GCA_004335735.1|Chlorella sp. KRBP", kegg_genesbr8b$Acc)
kegg_genesbr8b$Acc <- gsub("GCA_013372505.1", "GCA_013372505.1|Chlorella sp. BAC 9706", kegg_genesbr8b$Acc)
kegg_genesbr8b$Acc <- gsub("GCA_016906385.1", "GCA_016906385.1|Prototheca wickerhamii", kegg_genesbr8b$Acc)
kegg_genesbr8b$Acc <- gsub("GCA_019202925.1", "GCA_019202925.1|Chlorella desiccata (nom. nud.)", kegg_genesbr8b$Acc)
kegg_genesbr8b$Acc <- gsub("GCA_002794665.1", "GCA_002794665.1|Prototheca stagnorum", kegg_genesbr8b$Acc)
kegg_genesbr8b$Acc <- gsub("GCA_003255715.1", "GCA_003255715.1|Prototheca wickerhamii", kegg_genesbr8b$Acc)
kegg_genesbr8b$Acc <- gsub("GCA_002897115.2", "GCA_002897115.2|Prototheca cutis", kegg_genesbr8b$Acc)
kegg_genesbr8b$Acc <- gsub("GCA_004335555.1", "GCA_004335555.1|Nannochloris sp. X1", kegg_genesbr8b$Acc)
kegg_genesbr8b$Acc <- gsub("GCA_019044685.1", "GCA_019044685.1|Chlorella desiccata", kegg_genesbr8b$Acc)
kegg_genesbr8b$Acc <- gsub("GCA_008119945.1", "GCA_008119945.1|Chlorella vulgaris", kegg_genesbr8b$Acc)
kegg_genesbr8b$Acc <- gsub("GCA_015712045.1", "GCA_015712045.1|Parachlorella kessleri", kegg_genesbr8b$Acc)
kegg_genesbr8b$Acc <- gsub("GCA_001430745.1", "GCA_001430745.1|Auxenochlorella pyrenoidosa", kegg_genesbr8b$Acc)
kegg_genesbr8b$Acc <- gsub("GCA_009720205.1", "GCA_009720205.1|Chlorella vulgaris", kegg_genesbr8b$Acc)
kegg_genesbr8b$Acc <- gsub("GCA_001021125.1", "GCA_001021125.1|Chlorella vulgaris", kegg_genesbr8b$Acc)
kegg_genesbr8b$Acc <- gsub("GCA_002939045.1", "GCA_002939045.1|Chlorella sorokiniana", kegg_genesbr8b$Acc)
kegg_genesbr8b$Acc <- gsub("GCA_006782975.1", "GCA_006782975.1|Chlorella sp. Dachan",  kegg_genesbr8b$Acc)
kegg_genesbr8b$Acc <- gsub("GCA_002245835.2", "GCA_002245835.2|Chlorella sorokiniana", kegg_genesbr8b$Acc)
kegg_genesbr8b$Acc <- gsub("GCA_003116155.1", "GCA_003116155.1|Chlorella sorokiniana", kegg_genesbr8b$Acc)
kegg_genesbr8b$Acc <- gsub("GCA_003130725.1", "GCA_003130725.1|Chlorella sorokiniana", kegg_genesbr8b$Acc)
kegg_genesbr8b$Acc <- gsub("GCA_006782965.1", "GCA_006782965.1|Chlorella sorokiniana", kegg_genesbr8b$Acc)
kegg_genesbr8b$Acc <- gsub("GCA_006782985.1", "GCA_006782985.1|Chlorella sorokiniana", kegg_genesbr8b$Acc)
kegg_genesbr8b$Acc <- gsub("GCA_003709365.1", "GCA_003709365.1|Auxenochlorella protothecoides", kegg_genesbr8b$Acc)
kegg_genesbr8b$Acc <- gsub("Lake Cadagno MAG", "Lake Cadagno Chlorella-like MAG", kegg_genesbr8b$Acc)

kegg_genesbr8c<- kegg_genesbr8b[kegg_genesbr8b$Acc %like% "Lake", ]
kegg_genesbr8c$percent2<- kegg_genesbr8c$percent*100


####################################################################################
####################################################################################
###################################Fig. 5D##########################################
####################################################################################
####################################################################################
#write.csv(kegg_genesbr8b, ""G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/C_N_S_gene_count_percentage.csv", row.names = F)
kegg_genesbr8b$Pathway2<- str_before_nth(kegg_genesbr8b$Pathway, " ", 1)

Fig.5D<- ggplot(kegg_genesbr8b, aes(y = Acc, x=as.numeric(percent), fill=Pathway2)) + 
  geom_bar(stat="identity", position = position_stack(reverse = F))+
  
  scale_fill_manual("KEGG Pathways", values=c("#1B9E77", "#D95F02", "#E7298A"
                                              ), limits = c("00710", "00910", "00920"), 
                    labels=c("Carbon fixation in photosynthetic organisms [PATH:ko00710]", 
                             "Nitrogen metabolism [PATH:ko00910]", "Sulfur metabolism [PATH:ko00920]"))+
  scale_y_discrete(limits=c("GCA_000002595.3|Chlamydomonas reinhardtii", "GCA_004335735.1|Chlorella sp. KRBP", "GCA_002794665.1|Prototheca stagnorum","GCA_003255715.1|Prototheca wickerhamii", "GCA_016906385.1|Prototheca wickerhamii",
                            "GCA_002897115.2|Prototheca cutis", "GCA_000733215.1|Auxenochlorella protothecoides", "GCA_003709365.1|Auxenochlorella protothecoides", "Lake Cadagno Chlorella-like MAG", "GCA_004335555.1|Nannochloris sp. X1", "GCA_004335565.1|Nannochloris sp. RS",
                            "GCA_019044685.1|Chlorella desiccata", "GCA_019202925.1|Chlorella desiccata (nom. nud.)", "GCA_001598975.1|Parachlorella kessleri", "GCA_008119945.1|Chlorella vulgaris", "GCA_015712045.1|Parachlorella kessleri", "GCA_003063905.1|Chlorella sp. A99", 
                            "GCA_002245815.2|Micractinium conductrix", "GCA_001430745.1|Auxenochlorella pyrenoidosa", "GCA_002896455.3|Chlorella sp. ArM0029B", "GCF_000147415.1|Chlorella variabilis",  "GCA_009720205.1|Chlorella vulgaris", "GCA_009720215.1|Chlorella vulgaris",
                            "GCA_001021125.1|Chlorella vulgaris", "GCA_013372505.1|Chlorella sp. BAC 9706", "GCA_002939045.1|Chlorella sorokiniana", "GCA_006782975.1|Chlorella sp. Dachan", "GCA_006782985.1|Chlorella sorokiniana", "GCA_009928355.1|Chlorella sp. CH2018", 
                            "GCA_002245835.2|Chlorella sorokiniana", "GCA_003116155.1|Chlorella sorokiniana", "GCA_003130725.1|Chlorella sorokiniana", "GCA_006782965.1|Chlorella sorokiniana"))+
  theme_bw()+
  #guides(fill = guide_legend(reverse = T))+
  geom_text(aes(x = 0.15, y = Acc, label = n_prefix), check_overlap = TRUE, size = 3)+
  theme(axis.text=element_text(size=12),axis.title=element_text(size=12))+
   theme(axis.title.y = element_blank())+
    theme(axis.ticks.y = element_blank())+
    theme(axis.text.y = element_blank())+
  xlab("Relative Composition")+
  theme(legend.position = "bottom", legend.direction = "vertical")+
  guides(fill = guide_legend(nrow = 3))+
  annotate("text", x = 0.5, y = 33, label = "n=Total number of C,N,and S genes")+
  theme(axis.text.x=element_text(angle=45, hjust=1))


####################################################################################
####################################################################################
###################################Fig. 5E##########################################
####################################################################################
####################################################################################

Protein_co <- read.csv("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/Fig.5E-H/stats_chlorella.txt", sep="")
Protein_co$num_seqs2<- str_replace_all(Protein_co$num_seqs, ",", "")
Protein_co$num_seqs2<- as.numeric(Protein_co$num_seqs2)
Protein_co$file2<- str_before_nth(Protein_co$file, "_", 2)

Protein_co$file2 <- gsub("GCA_000002595.3", "GCA_000002595.3|Chlamydomonas reinhardtii", Protein_co$file2)
Protein_co$file2 <- gsub("GCA_000147415.1", "GCF_000147415.1|Chlorella variabilis", Protein_co$file2)
Protein_co$file2 <- gsub("GCA_000733215.1", "GCA_000733215.1|Auxenochlorella protothecoides", Protein_co$file2)
Protein_co$file2 <- gsub("GCA_002245815.2", "GCA_002245815.2|Micractinium conductrix", Protein_co$file2)
Protein_co$file2 <- gsub("GCA_001598975.1", "GCA_001598975.1|Parachlorella kessleri", Protein_co$file2)
Protein_co$file2 <- gsub("GCA_002896455.3", "GCA_002896455.3|Chlorella sp. ArM0029B", Protein_co$file2)
Protein_co$file2 <- gsub("GCA_003063905.1", "GCA_003063905.1|Chlorella sp. A99", Protein_co$file2)
Protein_co$file2 <- gsub("GCA_004335565.1", "GCA_004335565.1|Nannochloris sp. RS", Protein_co$file2)
Protein_co$file2 <- gsub("GCA_009720215.1", "GCA_009720215.1|Chlorella vulgaris", Protein_co$file2)
Protein_co$file2 <- gsub("GCA_009928355.1", "GCA_009928355.1|Chlorella sp. CH2018", Protein_co$file2)
Protein_co$file2 <- gsub("GCA_004335735.1", "GCA_004335735.1|Chlorella sp. KRBP", Protein_co$file2)
Protein_co$file2 <- gsub("GCA_013372505.1", "GCA_013372505.1|Chlorella sp. BAC 9706", Protein_co$file2)
Protein_co$file2 <- gsub("GCA_016906385.1", "GCA_016906385.1|Prototheca wickerhamii", Protein_co$file2)
Protein_co$file2 <- gsub("GCA_019202925.1", "GCA_019202925.1|Chlorella desiccata (nom. nud.)", Protein_co$file2)
Protein_co$file2 <- gsub("GCA_002794665.1", "GCA_002794665.1|Prototheca stagnorum", Protein_co$file2)
Protein_co$file2 <- gsub("GCA_003255715.1", "GCA_003255715.1|Prototheca wickerhamii", Protein_co$file2)
Protein_co$file2 <- gsub("GCA_002897115.2", "GCA_002897115.2|Prototheca cutis", Protein_co$file2)
Protein_co$file2 <- gsub("GCA_004335555.1", "GCA_004335555.1|Nannochloris sp. X1", Protein_co$file2)
Protein_co$file2 <- gsub("GCA_019044685.1", "GCA_019044685.1|Chlorella desiccata", Protein_co$file2)
Protein_co$file2 <- gsub("GCA_008119945.1", "GCA_008119945.1|Chlorella vulgaris", Protein_co$file2)
Protein_co$file2 <- gsub("GCA_015712045.1", "GCA_015712045.1|Parachlorella kessleri", Protein_co$file2)
Protein_co$file2 <- gsub("GCA_001430745.1", "GCA_001430745.1|Auxenochlorella pyrenoidosa", Protein_co$file2)
Protein_co$file2 <- gsub("GCA_009720205.1", "GCA_009720205.1|Chlorella vulgaris", Protein_co$file2)
Protein_co$file2 <- gsub("GCA_001021125.1", "GCA_001021125.1|Chlorella vulgaris", Protein_co$file2)
Protein_co$file2 <- gsub("GCA_002939045.1", "GCA_002939045.1|Chlorella sorokiniana", Protein_co$file2)
Protein_co$file2 <- gsub("GCA_006782975.1", "GCA_006782975.1|Chlorella sp. Dachan",  Protein_co$file2)
Protein_co$file2 <- gsub("GCA_002245835.2", "GCA_002245835.2|Chlorella sorokiniana", Protein_co$file2)
Protein_co$file2 <- gsub("GCA_003116155.1", "GCA_003116155.1|Chlorella sorokiniana", Protein_co$file2)
Protein_co$file2 <- gsub("GCA_003130725.1", "GCA_003130725.1|Chlorella sorokiniana", Protein_co$file2)
Protein_co$file2 <- gsub("GCA_006782965.1", "GCA_006782965.1|Chlorella sorokiniana", Protein_co$file2)
Protein_co$file2 <- gsub("GCA_006782985.1", "GCA_006782985.1|Chlorella sorokiniana", Protein_co$file2)
Protein_co$file2 <- gsub("GCA_003709365.1", "GCA_003709365.1|Auxenochlorella protothecoides", Protein_co$file2)
Protein_co$file2 <- gsub("Bin_40-contigs", "Lake Cadagno Chlorella-like MAG", Protein_co$file2)

#Add labels

#add gene C,N,S gene count
kegg_genesbr8b
happy<- merge (Protein_co, kegg_genesbr8b, by.x="file2", by.y="Acc", all.x=T)


happy2 <- happy[, c("file2", "num_seqs", "count")]
happy2<- happy2[!duplicated(happy2), ]

happy2$num_seqs2<- str_replace_all(happy2$num_seqs, ",", "")

happy2$num_seqs2 <- as.numeric(happy2$num_seqs2)

happy2$cns_ratio<- ((as.numeric(happy2$count)) / (as.numeric(happy2$num_seqs2)) * 100)

formatC(happy2$cns_ratio, digits = 1, format = "f")

#write.csv(happy2, "D:/Zenodo/C_N_S_gene_ratio.csv", row.names = F)


Fig.5E<- ggplot(happy2, aes(x=as.numeric(num_seqs2), y=file2)) +
  geom_bar(stat="identity", fill="#56B4E9") +
  scale_y_discrete(limits=c("GCA_000002595.3|Chlamydomonas reinhardtii", "GCA_004335735.1|Chlorella sp. KRBP", "GCA_002794665.1|Prototheca stagnorum","GCA_003255715.1|Prototheca wickerhamii", "GCA_016906385.1|Prototheca wickerhamii",
                            "GCA_002897115.2|Prototheca cutis", "GCA_000733215.1|Auxenochlorella protothecoides", "GCA_003709365.1|Auxenochlorella protothecoides", "Lake Cadagno Chlorella-like MAG", "GCA_004335555.1|Nannochloris sp. X1", "GCA_004335565.1|Nannochloris sp. RS",
                            "GCA_019044685.1|Chlorella desiccata", "GCA_019202925.1|Chlorella desiccata (nom. nud.)", "GCA_001598975.1|Parachlorella kessleri", "GCA_008119945.1|Chlorella vulgaris", "GCA_015712045.1|Parachlorella kessleri", "GCA_003063905.1|Chlorella sp. A99", 
                            "GCA_002245815.2|Micractinium conductrix", "GCA_001430745.1|Auxenochlorella pyrenoidosa", "GCA_002896455.3|Chlorella sp. ArM0029B", "GCF_000147415.1|Chlorella variabilis",  "GCA_009720205.1|Chlorella vulgaris", "GCA_009720215.1|Chlorella vulgaris",
                            "GCA_001021125.1|Chlorella vulgaris", "GCA_013372505.1|Chlorella sp. BAC 9706", "GCA_002939045.1|Chlorella sorokiniana", "GCA_006782975.1|Chlorella sp. Dachan", "GCA_006782985.1|Chlorella sorokiniana", "GCA_009928355.1|Chlorella sp. CH2018", 
                            "GCA_002245835.2|Chlorella sorokiniana", "GCA_003116155.1|Chlorella sorokiniana", "GCA_003130725.1|Chlorella sorokiniana", "GCA_006782965.1|Chlorella sorokiniana"))+
  
  theme(
    panel.grid.minor.y = element_blank(),
    panel.grid.major.y = element_blank(),
    legend.position="none"
  ) +
  ylab("Genomes")+
  theme_bw()+
  #geom_text(aes(y = 4000, label=file), check_overlap = TRUE)+
  #geom_label(aes(y = 10000, label=num_seqs2), check_overlap = TRUE)+
  xlab("Total predicted genes")+
  geom_label(data = happy2, 
             aes(x = 25000, y = file2, label = num_seqs2), size = 3)+
  coord_cartesian(xlim = c(3000, 32000))+
  theme(axis.text=element_text(size=12),axis.title=element_text(size=12))+
  theme(axis.text.x=element_text(angle=45, hjust=1))


####################################################################################
####################################################################################
###################################Fig. 5F##########################################
####################################################################################
####################################################################################

Fig.5F<- ggplot(happy2, aes(x=as.numeric(cns_ratio), y=file2)) +
  geom_bar(stat="identity", fill="#56B4E9") +
  
  scale_y_discrete(limits=c("GCA_000002595.3|Chlamydomonas reinhardtii", "GCA_004335735.1|Chlorella sp. KRBP", "GCA_002794665.1|Prototheca stagnorum","GCA_003255715.1|Prototheca wickerhamii", "GCA_016906385.1|Prototheca wickerhamii",
                            "GCA_002897115.2|Prototheca cutis", "GCA_000733215.1|Auxenochlorella protothecoides", "GCA_003709365.1|Auxenochlorella protothecoides", "Lake Cadagno Chlorella-like MAG", "GCA_004335555.1|Nannochloris sp. X1", "GCA_004335565.1|Nannochloris sp. RS",
                            "GCA_019044685.1|Chlorella desiccata", "GCA_019202925.1|Chlorella desiccata (nom. nud.)", "GCA_001598975.1|Parachlorella kessleri", "GCA_008119945.1|Chlorella vulgaris", "GCA_015712045.1|Parachlorella kessleri", "GCA_003063905.1|Chlorella sp. A99", 
                            "GCA_002245815.2|Micractinium conductrix", "GCA_001430745.1|Auxenochlorella pyrenoidosa", "GCA_002896455.3|Chlorella sp. ArM0029B", "GCF_000147415.1|Chlorella variabilis",  "GCA_009720205.1|Chlorella vulgaris", "GCA_009720215.1|Chlorella vulgaris",
                            "GCA_001021125.1|Chlorella vulgaris", "GCA_013372505.1|Chlorella sp. BAC 9706", "GCA_002939045.1|Chlorella sorokiniana", "GCA_006782975.1|Chlorella sp. Dachan", "GCA_006782985.1|Chlorella sorokiniana", "GCA_009928355.1|Chlorella sp. CH2018", 
                            "GCA_002245835.2|Chlorella sorokiniana", "GCA_003116155.1|Chlorella sorokiniana", "GCA_003130725.1|Chlorella sorokiniana", "GCA_006782965.1|Chlorella sorokiniana"))+
  
  theme(
    panel.grid.minor.y = element_blank(),
    panel.grid.major.y = element_blank(),
    legend.position="none"
  ) +
  ylab("Genomes")+
  theme_bw()+
  theme(axis.title.y = element_blank())+
  theme(axis.ticks.y = element_blank())+
  theme(axis.text.y = element_blank())+
  coord_cartesian(xlim = c(0.25, 1))+
  xlab("C,N,S genes (%)")+
  geom_label(data = happy2, 
             aes(x = 0.30, y = file2, label = formatC(cns_ratio, digits = 2, format = "f")), size = 3)+
  theme(axis.text=element_text(size=12),axis.title=element_text(size=12))+
  theme(axis.text.x=element_text(angle=45, hjust=1))


####################################################################################
####################################################################################
###################################Fig. 5G##########################################
####################################################################################
####################################################################################


CV_13mSCM_2 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/Fig.5E-H/Main_MAGs_coverage_13m_mean.tsv", header=T)
colnames(CV_13mSCM_2)[2] <- "Rel_Abun"
CV_13mSCM_2$Depth <- "13m"

CV_15mmSCM_2 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/Fig.5E-H/Main_MAGs_coverage_15mm_mean.tsv", header=T)
colnames(CV_15mmSCM_2)[2] <- "Rel_Abun"
CV_15mmSCM_2$Depth <- "15mm"

CV_15mwSCM_2 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/Fig.5E-H/Main_MAGs_coverage_15mw.tsv", header=T)
colnames(CV_15mwSCM_2)[2] <- "Rel_Abun"
CV_15mwSCM_2$Depth <- "15mw"

CV_15_5mSCM_2 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/Fig.5E-H/Main_MAGs_coverage_15_5m_mean.tsv", header=T)
colnames(CV_15_5mSCM_2)[2] <- "Rel_Abun"
CV_15_5mSCM_2$Depth <- "15_5m"

Cover_merge_cat_23<- rbind(CV_13mSCM_2, CV_15mmSCM_2, CV_15mwSCM_2, CV_15_5mSCM_2)

Cover_merge_ca2 <- subset(Cover_merge_cat_23, Genome != "unmapped")

Cover_merge_ca2$Acc<- str_before_nth(Cover_merge_ca2$Genome, "_", 2)

Cover_merge_ca2$Acc <- gsub("GCA_000002595.3", "GCA_000002595.3|Chlamydomonas reinhardtii", Cover_merge_ca2$Acc)
Cover_merge_ca2$Acc <- gsub("GCA_000147415.1", "GCF_000147415.1|Chlorella variabilis", Cover_merge_ca2$Acc)
Cover_merge_ca2$Acc <- gsub("GCA_000733215.1", "GCA_000733215.1|Auxenochlorella protothecoides", Cover_merge_ca2$Acc)
Cover_merge_ca2$Acc <- gsub("GCA_002245815.2", "GCA_002245815.2|Micractinium conductrix", Cover_merge_ca2$Acc)
Cover_merge_ca2$Acc <- gsub("GCA_001598975.1", "GCA_001598975.1|Parachlorella kessleri", Cover_merge_ca2$Acc)
Cover_merge_ca2$Acc <- gsub("GCA_002896455.3", "GCA_002896455.3|Chlorella sp. ArM0029B", Cover_merge_ca2$Acc)
Cover_merge_ca2$Acc <- gsub("GCA_003063905.1", "GCA_003063905.1|Chlorella sp. A99", Cover_merge_ca2$Acc)
Cover_merge_ca2$Acc <- gsub("GCA_004335565.1", "GCA_004335565.1|Nannochloris sp. RS", Cover_merge_ca2$Acc)
Cover_merge_ca2$Acc <- gsub("GCA_009720215.1", "GCA_009720215.1|Chlorella vulgaris", Cover_merge_ca2$Acc)
Cover_merge_ca2$Acc <- gsub("GCA_009928355.1", "GCA_009928355.1|Chlorella sp. CH2018", Cover_merge_ca2$Acc)
Cover_merge_ca2$Acc <- gsub("GCA_004335735.1", "GCA_004335735.1|Chlorella sp. KRBP", Cover_merge_ca2$Acc)
Cover_merge_ca2$Acc <- gsub("GCA_013372505.1", "GCA_013372505.1|Chlorella sp. BAC 9706", Cover_merge_ca2$Acc)
Cover_merge_ca2$Acc <- gsub("GCA_016906385.1", "GCA_016906385.1|Prototheca wickerhamii", Cover_merge_ca2$Acc)
Cover_merge_ca2$Acc <- gsub("GCA_019202925.1", "GCA_019202925.1|Chlorella desiccata (nom. nud.)", Cover_merge_ca2$Acc)
Cover_merge_ca2$Acc <- gsub("GCA_002794665.1", "GCA_002794665.1|Prototheca stagnorum", Cover_merge_ca2$Acc)
Cover_merge_ca2$Acc <- gsub("GCA_003255715.1", "GCA_003255715.1|Prototheca wickerhamii", Cover_merge_ca2$Acc)
Cover_merge_ca2$Acc <- gsub("GCA_002897115.2", "GCA_002897115.2|Prototheca cutis", Cover_merge_ca2$Acc)
Cover_merge_ca2$Acc <- gsub("GCA_004335555.1", "GCA_004335555.1|Nannochloris sp. X1", Cover_merge_ca2$Acc)
Cover_merge_ca2$Acc <- gsub("GCA_019044685.1", "GCA_019044685.1|Chlorella desiccata", Cover_merge_ca2$Acc)
Cover_merge_ca2$Acc <- gsub("GCA_008119945.1", "GCA_008119945.1|Chlorella vulgaris", Cover_merge_ca2$Acc)
Cover_merge_ca2$Acc <- gsub("GCA_015712045.1", "GCA_015712045.1|Parachlorella kessleri", Cover_merge_ca2$Acc)
Cover_merge_ca2$Acc <- gsub("GCA_001430745.1", "GCA_001430745.1|Auxenochlorella pyrenoidosa", Cover_merge_ca2$Acc)
Cover_merge_ca2$Acc <- gsub("GCA_009720205.1", "GCA_009720205.1|Chlorella vulgaris", Cover_merge_ca2$Acc)
Cover_merge_ca2$Acc <- gsub("GCA_001021125.1", "GCA_001021125.1|Chlorella vulgaris", Cover_merge_ca2$Acc)
Cover_merge_ca2$Acc <- gsub("GCA_002939045.1", "GCA_002939045.1|Chlorella sorokiniana", Cover_merge_ca2$Acc)
Cover_merge_ca2$Acc <- gsub("GCA_006782975.1", "GCA_006782975.1|Chlorella sp. Dachan",  Cover_merge_ca2$Acc)
Cover_merge_ca2$Acc <- gsub("GCA_002245835.2", "GCA_002245835.2|Chlorella sorokiniana", Cover_merge_ca2$Acc)
Cover_merge_ca2$Acc <- gsub("GCA_003116155.1", "GCA_003116155.1|Chlorella sorokiniana", Cover_merge_ca2$Acc)
Cover_merge_ca2$Acc <- gsub("GCA_003130725.1", "GCA_003130725.1|Chlorella sorokiniana", Cover_merge_ca2$Acc)
Cover_merge_ca2$Acc <- gsub("GCA_006782965.1", "GCA_006782965.1|Chlorella sorokiniana", Cover_merge_ca2$Acc)
Cover_merge_ca2$Acc <- gsub("GCA_006782985.1", "GCA_006782985.1|Chlorella sorokiniana", Cover_merge_ca2$Acc)
Cover_merge_ca2$Acc <- gsub("GCA_003709365.1", "GCA_003709365.1|Auxenochlorella protothecoides", Cover_merge_ca2$Acc)
Cover_merge_ca2$Acc <- gsub("Bin_40-contigs", "Lake Cadagno Chlorella-like MAG", Cover_merge_ca2$Acc)




Fig.5G<- ggplot(Cover_merge_ca2, aes(x=Rel_Abun, y=Acc, shape=Depth)) +
  geom_jitter(size=3, fill="#56B4E9", alpha=0.5) +
  scale_shape_manual("Lake Depth (m)", values=c(21,22,23,24), limits=c("13m", "15mw", "15mm", "15_5m"), 
                     labels=c("13", "15-w", "15", "15.5"))+
  
  theme_bw()+
  scale_y_discrete(limits=c("GCA_000002595.3|Chlamydomonas reinhardtii", "GCA_004335735.1|Chlorella sp. KRBP", "GCA_002794665.1|Prototheca stagnorum","GCA_003255715.1|Prototheca wickerhamii", "GCA_016906385.1|Prototheca wickerhamii",
                            "GCA_002897115.2|Prototheca cutis", "GCA_000733215.1|Auxenochlorella protothecoides", "GCA_003709365.1|Auxenochlorella protothecoides", "Lake Cadagno Chlorella-like MAG", "GCA_004335555.1|Nannochloris sp. X1", "GCA_004335565.1|Nannochloris sp. RS",
                            "GCA_019044685.1|Chlorella desiccata", "GCA_019202925.1|Chlorella desiccata (nom. nud.)", "GCA_001598975.1|Parachlorella kessleri", "GCA_008119945.1|Chlorella vulgaris", "GCA_015712045.1|Parachlorella kessleri", "GCA_003063905.1|Chlorella sp. A99", 
                            "GCA_002245815.2|Micractinium conductrix", "GCA_001430745.1|Auxenochlorella pyrenoidosa", "GCA_002896455.3|Chlorella sp. ArM0029B", "GCF_000147415.1|Chlorella variabilis",  "GCA_009720205.1|Chlorella vulgaris", "GCA_009720215.1|Chlorella vulgaris",
                            "GCA_001021125.1|Chlorella vulgaris", "GCA_013372505.1|Chlorella sp. BAC 9706", "GCA_002939045.1|Chlorella sorokiniana", "GCA_006782975.1|Chlorella sp. Dachan", "GCA_006782985.1|Chlorella sorokiniana", "GCA_009928355.1|Chlorella sp. CH2018", 
                            "GCA_002245835.2|Chlorella sorokiniana", "GCA_003116155.1|Chlorella sorokiniana", "GCA_003130725.1|Chlorella sorokiniana", "GCA_006782965.1|Chlorella sorokiniana"))+
  xlab("Relative abundance (%)")+
  
  theme(legend.position = "bottom")+
  ylab("Genomes")+
  theme(axis.text=element_text(size=12),axis.title=element_text(size=12))+
  guides(color = guide_legend(nrow = 2))+
  
  theme(axis.title.y = element_blank())+
  theme(axis.ticks.y = element_blank())+
  theme(axis.text.y = element_blank())+
  theme(legend.position = c(0.65, 0.75), legend.background = element_rect(size=0.3, 
                                                                          colour ="black"),  legend.direction = "vertical")+
  scale_x_continuous(breaks=(pretty_breaks()))

####################################################################################
####################################################################################
###################################Fig. 5H##########################################
####################################################################################
####################################################################################

##Extract only Lake Cadagno chlorella
DFF3<- DFF[DFF$Acc %like% "Cadagno", ]
chlorella_gff3 <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.2_Fig.3/Bin_40-contigs_non_chlorophyta_removed_30_June.1.Tier.txt", header = F)

chlo_drop_cds<- chlorella_gff3 %>% 
  filter(!grepl('CDS', V3))

chlo_drop_cds$genes = str_replace_all(chlo_drop_cds$V9, "ID=", "")

chlo_drop_cds$V4 <- chlo_drop_cds$V4 - 1
chlo_drop_cds2 = dplyr::mutate(chlo_drop_cds, name_gene = paste(V4, V5,  sep='-'))
chlo_drop_cds3 = dplyr::mutate(chlo_drop_cds2, name_contig_gene = paste(V1, name_gene,  sep=':'))


####Keep only C,N,S genes
C_N_S_cov<- merge(DFF3, chlo_drop_cds3, by.x="query", by.y="genes", all.x=T)
C_N_S_cov$Input_file<- str_before_nth(C_N_S_cov$Input_file, "_", 2)
C_N_S_cov$Input_file<- str_replace_all(C_N_S_cov$Input_file, "Bin_40-contigs", "Lake Cadagno MAG")

C_N_S_cov_1<- C_N_S_cov[C_N_S_cov$Pathway %like% "00710", ]
C_N_S_cov_2<- C_N_S_cov[C_N_S_cov$Pathway %like% "00910", ]
C_N_S_cov_3<- C_N_S_cov[C_N_S_cov$Pathway %like% "00920", ]


write.table(C_N_S_cov_3$K_number, "D:/Zenodo/K00920.txt", quote=F, col.names=FALSE, row.names = F)
write.table(C_N_S_cov_2$K_number, "D:/Zenodo/K00910.txt", quote=F, col.names=FALSE, row.names = F)
write.table(C_N_S_cov_1$K_number, "D:/Zenodo/K00710.txt", quote=F, col.names=FALSE, row.names = F)


write.csv(C_N_S_cov, "D:/C_N_S_genes.csv", row.names = F)


C_N_S_cov$Input_file <- gsub("Bin_40-contigs", "Lake Cadagno Chlorella-like MAG", HSP1_2bn_2$name)


#####Coverage of C,N, and S genes 
lib_17m_mapped_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/Chlorella_CNS_genes_cov/Cov_mapped_5m_r.txt")
lib_17m_mapped_5m_r$Depth <- "5m"


lib_17m_mapped_9m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/Chlorella_CNS_genes_cov/Cov_mapped_9m_r.txt")
lib_17m_mapped_9m_r$Depth <- "9m"


lib_17m_mapped_11m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/Chlorella_CNS_genes_cov/Cov_mapped_11m_r.txt")
lib_17m_mapped_11m_r$Depth <- "11m"


lib_17m_mapped_13m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/Chlorella_CNS_genes_cov/Cov_mapped_13m_r.txt")
lib_17m_mapped_13m_r$Depth <- "13m"


lib_17m_mapped_15mm_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/Chlorella_CNS_genes_cov/Cov_mapped_15mm_r.txt")
lib_17m_mapped_15mm_r$Depth <- "15mm"


lib_17m_mapped_15mw_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/Chlorella_CNS_genes_cov/Cov_mapped_15mw_r.txt")
lib_17m_mapped_15mw_r$Depth <- "15mw"


lib_17m_mapped_15_5m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/Chlorella_CNS_genes_cov/Cov_mapped_15_5m_r.txt")
lib_17m_mapped_15_5m_r$Depth <- "15_5m"


lib_17m_mapped_17m_r <- read.delim("G:/My Drive/Github_MS2/R_files_MS2_july/Github_MS2_October_2022/Zenodo/Data_R_plots/Fig.5/Chlorella_CNS_genes_cov/Cov_mapped_17m_r.txt")
lib_17m_mapped_17m_r$Depth <- "17m"

VR_bind <- rbind(lib_17m_mapped_5m_r, lib_17m_mapped_11m_r, lib_17m_mapped_9m_r, lib_17m_mapped_13m_r, lib_17m_mapped_15mm_r, lib_17m_mapped_15mw_r, lib_17m_mapped_15_5m_r, lib_17m_mapped_17m_r)
VR_bind2<- VR_bind[, c(1,7,10)]
C_N_S_cov$name_contig_gene

Merge4<- merge(VR_bind2, C_N_S_cov, by.x="X.rname", by.y="name_contig_gene", all.y=T)

#Merge4$Chlorophyta_MAG_Gene = str_replace_all(Merge4$Chlorophyta_MAG_Gene, "biopygen", "LC")
#Merge4$Chlorophyta_MAG_Gene = str_replace_all(Merge4$Chlorophyta_MAG_Gene, "gene", "g")



Fig.5H<- ggplot(data = Merge4, aes(y=Depth, x=X.rname)) + 
  geom_point(aes(size=meandepth, color=Pathway), alpha=0.75)+
  facet_grid(~Pathway, scales = "free_x", space="free_x")+

  
  
  #geom_text(aes(label = module_completeness), color = "white", size = 4)+
  #geom_point( aes( x = module, y = Depth_m, size= as.numeric(module_completeness) ) )+
  #scale_fill_gradient2()+
  
  #scale_fill_gradientn("Coverage", colors = hcl.colors(5, "RdYlGn"))+
  scale_y_discrete(limits=c("17m","","15_5m", "15mm", "15mw", "13m","", "11m", "9m", "5m", ""), 
                   labels=c("17","","15.5", "15", "15-w", "13","","11", "9", "5", ""))+
  #scale_x_discrete(limits=rev)+
  theme_bw()+
  #theme(axis.title.x = element_blank())+
  theme(legend.position = "bottom")+
  #theme(axis.title.x = element_blank())+
  scale_x_discrete(position = "bottom") +
  theme(axis.ticks.y = element_blank())+
  scale_color_manual(values=c("#1B9E77", "#D95F02", "#E7298A"))+
  guides(color=guide_legend(), size = guide_legend(), ncol=1)+
  theme(axis.ticks.x = element_blank())+
  theme(legend.position = "right", legend.background = element_rect(size=0.3, 
                                                                    colour ="black"),  
        legend.direction = "vertical") +
  theme(axis.text.x=element_text(angle=45, size=5))+
  guides(color="none")+
  theme(axis.text.y = element_blank())+
  theme(axis.title.y = element_blank())+
  theme(axis.ticks.y = element_blank())+
  theme(axis.text.x = element_text(angle = 90, vjust = 1, hjust=1))+  xlab("C,N,S Genes")+
  theme(axis.text=element_text(size=12),axis.title=element_text(size=12))+
  ylab("Depth (m)")+
  theme(
    panel.background = element_blank(), panel.grid.major.y = element_blank(),
    panel.grid.minor.y = element_blank(),axis.line = element_line())+
  theme(axis.text.x = element_blank())+
  theme(axis.ticks.x = element_blank())+
  theme(
    panel.background = element_blank(), panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),axis.line = element_line())+
  theme( strip.text.x = element_blank() )


#Fig.5

#This one
((Fig.5A | Fig.5B | Fig.5C | Fig.5H ) + plot_layout(widths = c(1, 1, 1, 2))) / (Fig.5E | Fig.5F | Fig.5G | Fig.5D) + plot_layout(heights = c(1,2.25), widths = c(1.5,1))
#1300x1200

#Fig.5A  
(Fig.5A | Fig.5B | Fig.5C | Fig.5H ) + plot_layout(widths = c(1, 1, 1, 3)) #14x4

(Fig.5E  | Fig.5D  | Fig.5F | Fig.5G) #12x8

####################################################################################
####################################################################################
###################################Fig. 6###########################################
####################################################################################
####################################################################################

TPM_salmon_gff3_egg_clean <- read.csv("D:/Zenodo/TPM_salmon_gff3_egg_clean.csv")

####Select only genes from Chlorophyta and viridiplantae
TPM_salmon_gff3_egg1<- TPM_salmon_gff3_egg_clean[TPM_salmon_gff3_egg_clean$max_annot_lvl %like% "Chlorophyta", ]
TPM_salmon_gff3_egg3<- TPM_salmon_gff3_egg_clean[TPM_salmon_gff3_egg_clean$max_annot_lvl %like% "Virid", ]



TPM_salmon_gff3_egg3a<- rbind(TPM_salmon_gff3_egg1, TPM_salmon_gff3_egg3)

#Drop meandepth of coverage
TPM_salmon_gff3_egg3a= TPM_salmon_gff3_egg3a[ , -which(names(TPM_salmon_gff3_egg3a) %in% c("meandepthcov"))]

###Extract heatshock proteins
HSP<- TPM_salmon_gff3_egg3a[TPM_salmon_gff3_egg3a$Description %like% "heat shock protein", ]
HSP2<- TPM_salmon_gff3_egg3a[TPM_salmon_gff3_egg3a$Description %like% "HSP", ]
HSP1_2<- rbind(HSP, HSP2)

##Structure replace all
##Cobined plot
HSP1_2$Description2 = str_replace_all(HSP1_2$Description, "Belongs to the heat shock protein 70 family", "HSP70")
HSP1_2$Description2 = str_replace_all(HSP1_2$Description2, "heat shock protein 70", "HSP70")


HSP1_2 = dplyr::mutate(HSP1_2, Description2_pfams = paste(Description2, PFAMs,  sep='__'))
unique(HSP1_2$Description2_pfams)

HSP1_2$Description3 = str_replace_all(HSP1_2$Description2_pfams, "HSP70__HSP70", "HSP70")
HSP1_2$Description3 = str_replace_all(HSP1_2$Description3, "heat shock protein__DnaJ", "Other HSPs")
HSP1_2$Description3<- gsub("\\__D.*","",HSP1_2$Description3)
HSP1_2$Description3 = str_replace_all(HSP1_2$Description3, "heat shock protein binding", "Other HSPs")
HSP1_2$Description3 = str_replace_all(HSP1_2$Description3, "heat shock protein__-", "Other HSPs")


unique(HSP1_2$Description3)

#Calculate number of Heat Shock proteins per genome
HSP1_2b= HSP1_2[ , which(names(HSP1_2) %in% c("name","gene", "Description3"))]



HSP1_2bn <- HSP1_2b[!duplicated(HSP1_2b$gene),]
HSP1_2bn$count<- "1"
HSP1_2bn$count<- as.numeric(HSP1_2bn$count)

HSP1_2bn_2<- HSP1_2bn %>%
  dplyr::group_by(name, Description3) %>%
  dplyr::summarise(across(count, sum))

HSP1_2bn_2$name <- gsub("GCA_000002595.3", "GCA_000002595.3|Chlamydomonas reinhardtii", HSP1_2bn_2$name)
HSP1_2bn_2$name <- gsub("GCA_000147415.1", "GCA_000147415.1|Chlorella variabilis", HSP1_2bn_2$name)
HSP1_2bn_2$name <- gsub("GCA_000733215.1", "GCA_000733215.1|Auxenochlorella protothecoides", HSP1_2bn_2$name)
HSP1_2bn_2$name <- gsub("GCA_002245815.2", "GCA_002245815.2|Micractinium conductrix", HSP1_2bn_2$name)
HSP1_2bn_2$name <- gsub("GCA_001598975.1", "GCA_001598975.1|Parachlorella kessleri", HSP1_2bn_2$name)
HSP1_2bn_2$name <- gsub("GCA_002896455.3", "GCA_002896455.3|Chlorella sp. ArM0029B", HSP1_2bn_2$name)
HSP1_2bn_2$name <- gsub("GCA_003063905.1", "GCA_003063905.1|Chlorella sp. A99", HSP1_2bn_2$name)
HSP1_2bn_2$name <- gsub("GCA_004335565.1", "GCA_004335565.1|Nannochloris sp. RS", HSP1_2bn_2$name)
HSP1_2bn_2$name <- gsub("GCA_009720215.1", "GCA_009720215.1|Chlorella vulgaris", HSP1_2bn_2$name)
HSP1_2bn_2$name <- gsub("GCA_009928355.1", "GCA_009928355.1|Chlorella sp. CH2018", HSP1_2bn_2$name)
HSP1_2bn_2$name <- gsub("GCA_004335735.1", "GCA_004335735.1|Chlorella sp. KRBP", HSP1_2bn_2$name)
HSP1_2bn_2$name <- gsub("GCA_013372505.1", "GCA_013372505.1|Chlorella sp. BAC 9706", HSP1_2bn_2$name)
HSP1_2bn_2$name <- gsub("GCA_016906385.1", "GCA_016906385.1|Prototheca wickerhamii", HSP1_2bn_2$name)
HSP1_2bn_2$name <- gsub("GCA_019202925.1", "GCA_019202925.1|Chlorella desiccata (nom. nud.)", HSP1_2bn_2$name)
HSP1_2bn_2$name <- gsub("GCA_002794665.1", "GCA_002794665.1|Prototheca stagnorum", HSP1_2bn_2$name)
HSP1_2bn_2$name <- gsub("GCA_003255715.1", "GCA_003255715.1|Prototheca wickerhamii", HSP1_2bn_2$name)
HSP1_2bn_2$name <- gsub("GCA_002897115.2", "GCA_002897115.2|Prototheca cutis", HSP1_2bn_2$name)
HSP1_2bn_2$name <- gsub("GCA_004335555.1", "GCA_004335555.1|Nannochloris sp. X1", HSP1_2bn_2$name)
HSP1_2bn_2$name <- gsub("GCA_019044685.1", "GCA_019044685.1|Chlorella desiccata", HSP1_2bn_2$name)
HSP1_2bn_2$name <- gsub("GCA_008119945.1", "GCA_008119945.1|Chlorella vulgaris", HSP1_2bn_2$name)
HSP1_2bn_2$name <- gsub("GCA_015712045.1", "GCA_015712045.1|Parachlorella kessleri", HSP1_2bn_2$name)
HSP1_2bn_2$name <- gsub("GCA_001430745.1", "GCA_001430745.1|Auxenochlorella pyrenoidosa", HSP1_2bn_2$name)
HSP1_2bn_2$name <- gsub("GCA_009720205.1", "GCA_009720205.1|Chlorella vulgaris", HSP1_2bn_2$name)
HSP1_2bn_2$name <- gsub("GCA_001021125.1", "GCA_001021125.1|Chlorella vulgaris", HSP1_2bn_2$name)
HSP1_2bn_2$name <- gsub("GCA_002939045.1", "GCA_002939045.1|Chlorella sorokiniana", HSP1_2bn_2$name)
HSP1_2bn_2$name <- gsub("GCA_006782975.1", "GCA_006782975.1|Chlorella sp. Dachan",  HSP1_2bn_2$name)
HSP1_2bn_2$name <- gsub("GCA_002245835.2", "GCA_002245835.2|Chlorella sorokiniana", HSP1_2bn_2$name)
HSP1_2bn_2$name <- gsub("GCA_003116155.1", "GCA_003116155.1|Chlorella sorokiniana", HSP1_2bn_2$name)
HSP1_2bn_2$name <- gsub("GCA_003130725.1", "GCA_003130725.1|Chlorella sorokiniana", HSP1_2bn_2$name)
HSP1_2bn_2$name <- gsub("GCA_006782965.1", "GCA_006782965.1|Chlorella sorokiniana", HSP1_2bn_2$name)
HSP1_2bn_2$name <- gsub("GCA_006782985.1", "GCA_006782985.1|Chlorella sorokiniana", HSP1_2bn_2$name)
HSP1_2bn_2$name <- gsub("GCA_003709365.1", "GCA_003709365.1|Auxenochlorella protothecoides", HSP1_2bn_2$name)
HSP1_2bn_2$name <- gsub("Bin_40-contigs", "Lake Cadagno Chlorella-like MAG", HSP1_2bn_2$name)

HSP1_2bn_2$Description3 = factor(HSP1_2bn_2$Description3, levels=c('Belongs to the small heat shock protein (HSP20) family__HSP20',
                                                                   'Belongs to the chaperonin (HSP60) family__Cpn60_TCP1',
                                                                   'HSP70','Other HSPs'))

unique(HSP1_2bn_2$Description3)

####################################################################################
####################################################################################
###################################Fig. 6A###########################################
####################################################################################
####################################################################################

Plot_a_hsp1<- ggplot(data=HSP1_2bn_2, aes(y=name, x=count, fill=Description3))+
  geom_bar(stat="identity", position = "stack")+
  theme_bw()+
  scale_y_discrete(limits=c("GCA_000002595.3|Chlamydomonas reinhardtii", "GCA_004335735.1|Chlorella sp. KRBP", 
                            "GCA_002794665.1|Prototheca stagnorum","GCA_003255715.1|Prototheca wickerhamii", 
                            "GCA_016906385.1|Prototheca wickerhamii", "GCA_002897115.2|Prototheca cutis", 
                            "GCA_000733215.1|Auxenochlorella protothecoides", "GCA_003709365.1|Auxenochlorella protothecoides", 
                            "Lake Cadagno Chlorella-like MAG", "GCA_004335555.1|Nannochloris sp. X1", 
                            "GCA_004335565.1|Nannochloris sp. RS",
                            "GCA_019044685.1|Chlorella desiccata", "GCA_019202925.1|Chlorella desiccata (nom. nud.)",
                            "GCA_001598975.1|Parachlorella kessleri", "GCA_008119945.1|Chlorella vulgaris", "GCA_015712045.1|Parachlorella kessleri", 
                            "GCA_003063905.1|Chlorella sp. A99", "GCA_002245815.2|Micractinium conductrix", 
                            "GCA_001430745.1|Auxenochlorella pyrenoidosa", "GCA_002896455.3|Chlorella sp. ArM0029B", 
                            "GCA_000147415.1|Chlorella variabilis",  "GCA_009720205.1|Chlorella vulgaris", "GCA_009720215.1|Chlorella vulgaris",
                            "GCA_001021125.1|Chlorella vulgaris", "GCA_013372505.1|Chlorella sp. BAC 9706", 
                            "GCA_002939045.1|Chlorella sorokiniana", "GCA_006782975.1|Chlorella sp. Dachan", 
                            "GCA_006782985.1|Chlorella sorokiniana", "GCA_009928355.1|Chlorella sp. CH2018", 
                            "GCA_002245835.2|Chlorella sorokiniana", "GCA_003116155.1|Chlorella sorokiniana", 
                            "GCA_003130725.1|Chlorella sorokiniana", "GCA_006782965.1|Chlorella sorokiniana"), 
                   labels=c("GCA_000002595.3|Chlamydomonas reinhardtii", "GCA_004335735.1|Chlorella sp. KRBP", 
                            "GCA_002794665.1|Prototheca stagnorum","GCA_003255715.1|Prototheca wickerhamii", 
                            "GCA_016906385.1|Prototheca wickerhamii",
                            "GCA_002897115.2|Prototheca cutis", "GCA_000733215.1|Auxenochlorella protothecoides", 
                            "GCA_003709365.1|Auxenochlorella protothecoides", "Lake Cadagno Chlorella-like MAG", "GCA_004335555.1|Nannochloris sp. X1",
                            "GCA_004335565.1|Nannochloris sp. RS", 
                            "GCA_019044685.1|Chlorella desiccata", "GCA_019202925.1|Chlorella desiccata", 
                            "GCA_001598975.1|Parachlorella kessleri", "GCA_008119945.1|Chlorella vulgaris", 
                            "GCA_015712045.1|Parachlorella kessleri", "GCA_003063905.1|Chlorella sp. A99", 
                            "GCA_002245815.2|Micractinium conductrix", "GCA_001430745.1|Auxenochlorella pyrenoidosa", 
                            "GCA_002896455.3|Chlorella sp. ArM0029B", "GCA_000147415.1|Chlorella variabilis",  
                            "GCA_009720205.1|Chlorella vulgaris", "GCA_009720215.1|Chlorella vulgaris",
                            "GCA_001021125.1|Chlorella vulgaris", "GCA_013372505.1|Chlorella sp. BAC 9706", "GCA_002939045.1|Chlorella sorokiniana", 
                            "GCA_006782975.1|Chlorella sp. Dachan", "GCA_006782985.1|Chlorella sorokiniana", "GCA_009928355.1|Chlorella sp. CH2018", 
                            "GCA_002245835.2|Chlorella sorokiniana", "GCA_003116155.1|Chlorella sorokiniana", 
                            "GCA_003130725.1|Chlorella sorokiniana", "GCA_006782965.1|Chlorella sorokiniana"))+
  
  theme_bw()+
  ylab("Genomes")+
  xlab("Number of genes")+
  scale_fill_manual(name="Heat shock proteins (HSPs)", values=c("#D95F02", "#1B9E77", "#E7298A", "#E6AB02"), 
                    labels=c("HSP20", "HSP60", "HSP70", "Others"))+
  theme(legend.position="none")

HSP1_2$Lake_Depth = factor(HSP1_2$Lake_Depth, levels=c('13m','15mw','15mm','15_5m'))
HSP1_2$Category = factor(HSP1_2$Category, levels=c('LC_MAG','GCA'))


#Rename 
HSP1_2$name <- gsub("GCA_000002595.3", "GCA_000002595.3|Chlamydomonas reinhardtii", HSP1_2$name)
HSP1_2$name <- gsub("GCA_000147415.1", "GCA_000147415.1|Chlorella variabilis", HSP1_2$name)
HSP1_2$name <- gsub("GCA_000733215.1", "GCA_000733215.1|Auxenochlorella protothecoides", HSP1_2$name)
HSP1_2$name <- gsub("GCA_002245815.2", "GCA_002245815.2|Micractinium conductrix", HSP1_2$name)
HSP1_2$name <- gsub("GCA_001598975.1", "GCA_001598975.1|Parachlorella kessleri", HSP1_2$name)
HSP1_2$name <- gsub("GCA_002896455.3", "GCA_002896455.3|Chlorella sp. ArM0029B", HSP1_2$name)
HSP1_2$name <- gsub("GCA_003063905.1", "GCA_003063905.1|Chlorella sp. A99", HSP1_2$name)
HSP1_2$name <- gsub("GCA_004335565.1", "GCA_004335565.1|Nannochloris sp. RS", HSP1_2$name)
HSP1_2$name <- gsub("GCA_009720215.1", "GCA_009720215.1|Chlorella vulgaris", HSP1_2$name)
HSP1_2$name <- gsub("GCA_009928355.1", "GCA_009928355.1|Chlorella sp. CH2018", HSP1_2$name)
HSP1_2$name <- gsub("GCA_004335735.1", "GCA_004335735.1|Chlorella sp. KRBP", HSP1_2$name)
HSP1_2$name <- gsub("GCA_013372505.1", "GCA_013372505.1|Chlorella sp. BAC 9706", HSP1_2$name)
HSP1_2$name <- gsub("GCA_016906385.1", "GCA_016906385.1|Prototheca wickerhamii", HSP1_2$name)
HSP1_2$name <- gsub("GCA_019202925.1", "GCA_019202925.1|Chlorella desiccata (nom. nud.)", HSP1_2$name)
HSP1_2$name <- gsub("GCA_002794665.1", "GCA_002794665.1|Prototheca stagnorum", HSP1_2$name)
HSP1_2$name <- gsub("GCA_003255715.1", "GCA_003255715.1|Prototheca wickerhamii", HSP1_2$name)
HSP1_2$name <- gsub("GCA_002897115.2", "GCA_002897115.2|Prototheca cutis", HSP1_2$name)
HSP1_2$name <- gsub("GCA_004335555.1", "GCA_004335555.1|Nannochloris sp. X1", HSP1_2$name)
HSP1_2$name <- gsub("GCA_019044685.1", "GCA_019044685.1|Chlorella desiccata", HSP1_2$name)
HSP1_2$name <- gsub("GCA_008119945.1", "GCA_008119945.1|Chlorella vulgaris", HSP1_2$name)
HSP1_2$name <- gsub("GCA_015712045.1", "GCA_015712045.1|Parachlorella kessleri", HSP1_2$name)
HSP1_2$name <- gsub("GCA_001430745.1", "GCA_001430745.1|Auxenochlorella pyrenoidosa", HSP1_2$name)
HSP1_2$name <- gsub("GCA_009720205.1", "GCA_009720205.1|Chlorella vulgaris", HSP1_2$name)
HSP1_2$name <- gsub("GCA_001021125.1", "GCA_001021125.1|Chlorella vulgaris", HSP1_2$name)
HSP1_2$name <- gsub("GCA_002939045.1", "GCA_002939045.1|Chlorella sorokiniana", HSP1_2$name)
HSP1_2$name <- gsub("GCA_006782975.1", "GCA_006782975.1|Chlorella sp. Dachan",  HSP1_2$name)
HSP1_2$name <- gsub("GCA_002245835.2", "GCA_002245835.2|Chlorella sorokiniana", HSP1_2$name)
HSP1_2$name <- gsub("GCA_003116155.1", "GCA_003116155.1|Chlorella sorokiniana", HSP1_2$name)
HSP1_2$name <- gsub("GCA_003130725.1", "GCA_003130725.1|Chlorella sorokiniana", HSP1_2$name)
HSP1_2$name <- gsub("GCA_006782965.1", "GCA_006782965.1|Chlorella sorokiniana", HSP1_2$name)
HSP1_2$name <- gsub("GCA_006782985.1", "GCA_006782985.1|Chlorella sorokiniana", HSP1_2$name)
HSP1_2$name <- gsub("GCA_003709365.1", "GCA_003709365.1|Auxenochlorella protothecoides", HSP1_2$name)
HSP1_2$name <- gsub("Bin_40-contigs", "Lake Cadagno Chlorella-like MAG", HSP1_2$name)


####################################################################################
####################################################################################
###################################Fig. 6B##########################################
####################################################################################
####################################################################################
Plot_b2_hsp<- ggplot(data=HSP1_2, aes(y=name, x=GPM, color= Description3, shape=max_annot_lvl))+
  facet_grid(cols = vars(Lake_Depth))+
  geom_point(size=2.5)+
  scale_y_discrete(limits=c("GCA_000002595.3|Chlamydomonas reinhardtii", "GCA_004335735.1|Chlorella sp. KRBP", 
                            "GCA_002794665.1|Prototheca stagnorum","GCA_003255715.1|Prototheca wickerhamii", 
                            "GCA_016906385.1|Prototheca wickerhamii", "GCA_002897115.2|Prototheca cutis", 
                            "GCA_000733215.1|Auxenochlorella protothecoides", "GCA_003709365.1|Auxenochlorella protothecoides", 
                            "Lake Cadagno Chlorella-like MAG", "GCA_004335555.1|Nannochloris sp. X1", 
                            "GCA_004335565.1|Nannochloris sp. RS",
                            "GCA_019044685.1|Chlorella desiccata", "GCA_019202925.1|Chlorella desiccata (nom. nud.)",
                            "GCA_001598975.1|Parachlorella kessleri", "GCA_008119945.1|Chlorella vulgaris", "GCA_015712045.1|Parachlorella kessleri", 
                            "GCA_003063905.1|Chlorella sp. A99", "GCA_002245815.2|Micractinium conductrix", 
                            "GCA_001430745.1|Auxenochlorella pyrenoidosa", "GCA_002896455.3|Chlorella sp. ArM0029B", 
                            "GCA_000147415.1|Chlorella variabilis",  "GCA_009720205.1|Chlorella vulgaris", "GCA_009720215.1|Chlorella vulgaris",
                            "GCA_001021125.1|Chlorella vulgaris", "GCA_013372505.1|Chlorella sp. BAC 9706", 
                            "GCA_002939045.1|Chlorella sorokiniana", "GCA_006782975.1|Chlorella sp. Dachan", 
                            "GCA_006782985.1|Chlorella sorokiniana", "GCA_009928355.1|Chlorella sp. CH2018", 
                            "GCA_002245835.2|Chlorella sorokiniana", "GCA_003116155.1|Chlorella sorokiniana", 
                            "GCA_003130725.1|Chlorella sorokiniana", "GCA_006782965.1|Chlorella sorokiniana"), 
                   labels=c("GCA_000002595.3|Chlamydomonas reinhardtii", "GCA_004335735.1|Chlorella sp. KRBP", 
                            "GCA_002794665.1|Prototheca stagnorum","GCA_003255715.1|Prototheca wickerhamii", 
                            "GCA_016906385.1|Prototheca wickerhamii",
                            "GCA_002897115.2|Prototheca cutis", "GCA_000733215.1|Auxenochlorella protothecoides", 
                            "GCA_003709365.1|Auxenochlorella protothecoides", "Lake Cadagno Chlorella-like MAG", "GCA_004335555.1|Nannochloris sp. X1",
                            "GCA_004335565.1|Nannochloris sp. RS", 
                            "GCA_019044685.1|Chlorella desiccata", "GCA_019202925.1|Chlorella desiccata", 
                            "GCA_001598975.1|Parachlorella kessleri", "GCA_008119945.1|Chlorella vulgaris", 
                            "GCA_015712045.1|Parachlorella kessleri", "GCA_003063905.1|Chlorella sp. A99", 
                            "GCA_002245815.2|Micractinium conductrix", "GCA_001430745.1|Auxenochlorella pyrenoidosa", 
                            "GCA_002896455.3|Chlorella sp. ArM0029B", "GCA_000147415.1|Chlorella variabilis",  
                            "GCA_009720205.1|Chlorella vulgaris", "GCA_009720215.1|Chlorella vulgaris",
                            "GCA_001021125.1|Chlorella vulgaris", "GCA_013372505.1|Chlorella sp. BAC 9706", "GCA_002939045.1|Chlorella sorokiniana", 
                            "GCA_006782975.1|Chlorella sp. Dachan", "GCA_006782985.1|Chlorella sorokiniana", "GCA_009928355.1|Chlorella sp. CH2018", 
                            "GCA_002245835.2|Chlorella sorokiniana", "GCA_003116155.1|Chlorella sorokiniana", 
                            "GCA_003130725.1|Chlorella sorokiniana", "GCA_006782965.1|Chlorella sorokiniana"))+
  
  theme_bw()+
  ylab("Genomes")+
  xlab("Gene per million reads (GPM)")+
  
  theme(axis.ticks.y =element_blank())+
  theme(axis.title.y =element_blank())+
  theme(axis.text.y =element_blank())+
  scale_color_manual(name="Heat shock proteins (HSPs)", values=c("#D95F02", "#1B9E77", "#E7298A", "#E6AB02"), 
                     labels=c("HSP20", "HSP60", "HSP70", "Others"))+
  
  xlim(0,1000)+
  theme(axis.text.x=element_text(angle=45, hjust=1))+
  scale_shape_manual("EggNOGG annotation", values = c(15, 17,19))+
  theme(legend.position="bottom")


(Plot_a_hsp1 | Plot_b2_hsp) + plot_layout(widths = c(0.55, 1.75))


TPM_salmon_gff3_egg3a$Lake_Depth = factor(TPM_salmon_gff3_egg3a$Lake_Depth, levels=c('13m','15mw','15mm','15_5m'))
TPM_salmon_gff3_egg3a$Category = factor(TPM_salmon_gff3_egg3a$Category, levels=c('LC_MAG','GCA'))


###Get stats on number of genes per category
#stat_box_sum <- function(y, upper_limit = max(TPM_salmon_gff3_egg_clean$GPM)) {
#  DF <- data.frame(
#    y = max(y),
#    label = paste("N:", length(y), "\n",
#                  "Median:", median(y), "\n")
#  )
#  DF
#}
####################################################################################
####################################################################################
###################################Fig. S5A, A.1####################################
####################################################################################
####################################################################################

box1<- ggplot(data=TPM_salmon_gff3_egg3a, aes(y=factor(Lake_Depth), x=GPM, fill = factor(Category))) +
  geom_boxplot() +
  facet_grid(cols = vars(Category))+
  xlab("Gene per million reads (GPM)")+
  scale_fill_manual("Genomes", labels=c("Lake Cadagno Chlorella", "Others"), values=c("#D95F02", "#1B9E77"))+
  theme_bw()+
  theme(legend.position = "none")+
  scale_y_discrete("Lake Depth (m)", limits=c("15_5m", "15mm", "15mw", "13m")) +
  xlim(0,1900)

box2<- ggplot(data=TPM_salmon_gff3_egg3a, aes(y=factor(Lake_Depth), x=GPM, fill = factor(Category))) +
  geom_boxplot() +
  facet_grid(cols = vars(Category))+
  xlab("Gene per million reads (GPM)")+
  scale_fill_manual("Genomes", labels=c("Lake Cadagno Chlorella", "Others"), values=c("#D95F02", "#1B9E77"))+
  theme_bw()+
  theme(legend.position = "none")+
  scale_y_discrete("Lake Depth (m)", limits=c("15_5m", "15mm", "15mw", "13m"))+
  xlim(0,100)


  
box1 / box2

####################################################################################
####################################################################################
###################################THE END :) YAY!##################################
####################################################################################
####################################################################################





