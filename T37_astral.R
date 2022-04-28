##Figures for Singh et al Tropheini anchored phlyogenomics
## pooja.singh09@gmail.com
## nov2020




#1 figure1

library(ape)
library(Biostrings)
library(ggplot2)
library(ggtree)
library(stringr)
require(phylobase)
library(colorspace)
library(svglite)
library(phylogram)


setwd("/Volumes/pooja2019/PhD_2015/PhD_research_projects/Phylogenomics_T37/2020/figures")


##read in tree, make sure to retain underscores between genus, species, and location names, these can then be coverted to spaces when plottting

tree <- read.tree("/Volumes/pooja2019/PhD_2015/PhD_research_projects/Phylogenomics_T37/2017/T37_genetrees/T37_v2_gene_trees/astral/T37.all.iqtree.astral.boot.site.N.2020.tre")


tree1 <- read.tree("/Volumes/pooja2019/PhD_2015/PhD_research_projects/Phylogenomics_T37/2017/T37_genetrees/T37_v2_gene_trees/astral/2020/T37.all.iqtree.astral.boot.site.scored.tre1.N")


#root tree

t2 <- root(tree, outgroup="Eretmodus_cyanostictus", resolve.root=T)
t1 <- root(tree1, outgroup="Eretmodus_cyanostictus", resolve.root=T)

t2$edge.length <- as.numeric(gsub("NaN", 0.04,t2$edge.length))
t2$node.label[1] <- ""
t2$tip.label <- gsub("_", " ", t2$tip.label, fixed=T)

t1$edge.length <- as.numeric(gsub("NaN", 0.04,t2$edge.length))
t1$node.label[1] <- ""
t1$tip.label <- gsub("_", " ", t2$tip.label, fixed=T)



t1$node.label[1] <- "100"
t1$node.label[2] <- "100"

t2$node.label[1] <- ""
t2$node.label[2] <- ""


#edit BS vals

t2$node.label <- gsub("\\..*","",t2$node.label)
t1$node.label <- gsub("\\..*","",t1$node.label)


##

genus <- str_split(t2$tip.label, pattern=" ",simplify = TRUE)[,1]
species <- str_split(t2$tip.label, pattern=" ",simplify = TRUE)[,2]
local <- str_split(t2$tip.label, pattern=" ",n=3, simplify = TRUE)[,3]

d <- data.frame(label = t2$tip.label, genus = genus,species = species, geo = local)
d$tribe <- c(replicate(9, "Tropheini"),replicate(1, "Orthochromini"),replicate(1, "Eretmodini"),replicate(17, "Haplochromini"),replicate(23, "Tropheini"))

## fix famula

d$species[36] <- "famula"
d$species[35] <- "famula"
d$species[34] <- "famula"
d$species[16] <- "alluaudi"
d$species[17] <- "alluaudi"



#plot

pdf("T37_astral.pdf", width=10, height=8)
ggtree(t2, size=1.2) %<+% d  + geom_tiplab(aes(label=paste0('italic(', genus, ')~italic(', species, ')~plain(',geo, ')')), parse=TRUE, hjust=-0.1) + geom_nodelab(cex=3, hjust = 0.1) + xlim(NA,8) + geom_treescale()
dev.off()




t2$quartet <- as.numeric(t1$node.label)
t2$quartet[1] <- 100
t2$quartet[2] <- 100
plotBranchbyTrait(t2,t2$quartet,mode="node", prompt=TRUE, palette="gray")





a <-cbind(t2$tip.label, as.numeric(t2$quartet))
a1 <- data.frame(do.call(rbind, lapply(1:nrow(a), function(x) t(a[x,]))))



