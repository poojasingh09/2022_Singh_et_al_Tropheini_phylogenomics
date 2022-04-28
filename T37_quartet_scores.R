##Figures for Singh et al Tropheini anchored phlyogenomics
## pooja.singh09@gmail.com
## nov2020
## plot pp vs quartet score vs gene trees considered




#1 figure1

library("ape")
library("Biostrings")
library("ggplot2")
library("ggtree")
library(stringr)
require(phylobase)
library("colorspace")
library(svglite)
library(qdapRegex)



tree <- read.tree("/Volumes/pooja2019/PhD_2015/PhD_research_projects/Phylogenomics_T37/2017/T37_genetrees/T37_v2_gene_trees/astral/2020/T37.all.iqtree.astral.boot.site.scored.tre2.N")


tree1 <- read.tree("/Volumes/pooja2019/PhD_2015/PhD_research_projects/Phylogenomics_T37/2017/T37_genetrees/T37_v2_gene_trees/astral/T37.all.iqtree.astral.boot.site.N.2020.tre")



#root tree

t2 <- root(tree, outgroup="Eretmodus_cyanostictus", resolve.root=T)
t1 <- root(tree1, outgroup="Eretmodus_cyanostictus", resolve.root=T)

t1$node.label[1] <- "0"
t1$node.label[2] <- "0"

genus <- str_split(t2$tip.label, pattern="_",simplify = TRUE)[,1]
species <- str_split(t2$tip.label, pattern="_",simplify = TRUE)[,2]
local <- str_split(t2$tip.label, pattern="_",n=3, simplify = TRUE)[,3]

d <- data.frame(label = t2$tip.label, genus = genus,species = species, geo = local)
d$tribe <- c(replicate(9, "Tropheini"),replicate(1, "Orthochromini"),replicate(1, "Eretmodini"),replicate(17, "Haplochromini"),replicate(23, "Tropheini"))

## fix famula

d$species[36] <- "famula"
d$species[35] <- "famula"
d$species[34] <- "famula"
d$species[16] <- "alluaudi"
d$species[17] <- "alluaudi"


##



q1 <- sapply(strsplit(t2$node.label,";"), `[`, 1)
q11 <- sapply(strsplit(q1,"="), `[`, 2)

pb <- t1$node.label


en <- sapply(strsplit(t2$node.label,";"), `[`, 11)
en1 <- rm_between(en, "=", "]", extract=TRUE)
en2 <- (as.numeric(en1)/532)*100

#plot 

pdf("T37_quartet_scores.pdf", h=4,w=6)
par(mfrow=c(1,2))
plot(q11, en2, xlab="Quartet score", ylab="% of total loci", pch=19, xlim=c(0,1), ylim=c(0,100))
plot(q11, pb, xlab="Quartet score", ylab="Posterior probability", pch=19, col="darkgrey", xlim=c(0,1), ylim=c(0,100))
dev.off()


