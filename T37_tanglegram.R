##Figures for Singh et al Tropheini anchored phlyogenomics
## pooja.singh09@gmail.com
## nov2020




#1 figure1

library("ape")
library("Biostrings")
library("ggplot2")
library("ggtree")
library(stringr)
require(phylobase)
library("colorspace")
library(svglite)
library(dendextend)
library(phylogram)

setwd("/Volumes/pooja2019/PhD_2015/PhD_research_projects/Phylogenomics_T37/2020/figures")


##read in tree, make sure to retain underscores between genus, species, and location names, these can then be coverted to spaces when plottting

astral <- read.tree("/Volumes/pooja2019/PhD_2015/PhD_research_projects/Phylogenomics_T37/2017/T37_genetrees/T37_v2_gene_trees/astral/T37.all.iqtree.astral.boot.site.N.2020.tre")

raxml<- read.tree("/Volumes/pooja2019/PhD_2015/PhD_research_projects/Phylogenomics_T37/2017/T37_supermatrix_raxml_2017/T37_FcC_supermatrix_best_part.treefile.ann.2020.tre")

#root trees

t1 <- root(astral, outgroup="Eretmodus_cyanostictus", resolve.root=T)
t2 <- root(raxml, outgroup="Eretmodus_cyanostictus", resolve.root=T)
t1$edge.length <- as.numeric(gsub("NaN", 0.04,t1$edge.length))


t1$tip.label[36] <- "Petrochromis_famula"
t1$tip.label[35] <- "Petrochromis_famula"
t1$tip.label[34] <- "Petrochromis_famula"
t1$tip.label[16] <- "Astatoreochromis_alluaudi"
t1$tip.label[17] <- "Astatoreochromis_alluaudi"


t2$tip.label[17] <- "Petrochromis_famula"
t2$tip.label[18] <- "Petrochromis_famula"
t2$tip.label[19] <- "Petrochromis_famula"
t2$tip.label[40] <- "Astatoreochromis_alluaudi"
t2$tip.label[41] <- "Astatoreochromis_alluaudi"



t1$tip.label <- gsub("_"," ",t1$tip.label)
t2$tip.label <- gsub("_"," ",t2$tip.label)


#convert to ultrametric

ut1 <- chronos(t1)
ut2 <- chronos(t2)


## convert phylo objects to dendrograms
dnd1 <- as.dendrogram(t1)
dnd2 <- as.dendrogram(t2)


pdf("T37_tanglegram.pdf", h=10, w=8)
tanglegram(dnd2, dnd1, margin_inner = 11, edge.lwd=2,common_subtrees_color_lines = FALSE)
dev.off()


## rearrange in ladderized fashion
dnd1 <- ladder(dnd1)
dnd2 <- ladder(dnd2)
## plot the tanglegram
dndlist <- dendextend::dendlist(dnd1, dnd2)
dendextend::tanglegram(dndlist, fast = TRUE, margin_inner = 15)
