#pooja.singh09@gmail.com
#tropheini phylogenomics singh et al
#nov2020
#fig3 timetree

library(devtools)
library(MCMCtreeR)

setwd("/Volumes/pooja2019/PhD_2015/PhD_research_projects/Phylogenomics_T37/2020/figures")

#read in reltime tree from c10 calibration

c10 <- readMCMCtree("/Volumes/pooja2019/PhD_2015/PhD_research_projects/Phylogenomics_T37/2017/T37_RelTime_01/T37_T51_L532_v2_FcC_supermatrix_upd_C10_GTR_M08_nexus.tre", from.file=TRUE)

c10 <- read.beast("/Volumes/pooja2019/PhD_2015/PhD_research_projects/Phylogenomics_T37/2017/T37_RelTime_01/T37_T51_L532_v2_FcC_supermatrix_upd_C10_GTR_M08_nexus.tre")

t <- c10@phylo
