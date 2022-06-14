Singh et al 2022
_______________________________________________

ASTRAL: estimating species tree from gene tress
Mirabab et al 2014
________________________________________________

1. Concatenate all the IQtree gene trees
 cat *bestTree*

2. Run ASTRAL

java -Xmx10000M -jar /computation2/pooja/biotools/Astral/astral.4.7.12.jar -i all_IQtree_bestTrees.tre -o all_IQtree_bestTrees_astralTree.tre

3. Run ASTRAL with 100 bootstraps (site resampling)


java -Xmx10000M -jar /computation2/pooja/biotools/Astral/astral.4.7.12.jar -i all_IQtree_bestTrees.tre -b path_bs -r 100 -o all_IQtree_bestTrees_astral.boot.site.out &

3.1 extract ASTRAL tree

tail -1 all_IQtree_bestTrees_astral.boot.site.out > all_IQtree_bestTrees_astral.boot.site.tre

4. Run ASTRAL with bootstraps (gene resampling): cant use 100 bootstraps: You
seem to have asked for 100 but only 71 replicaes could be created.
 Note that for gene resampling, you need more input bootstrap replicates than
the number of species tee replicates.


java -Xmx10000M -jar /computation2/pooja/biotools/Astral/astral.4.7.12.jar -i all_IQtree_bestTrees.tre -b path_bs -g -o all_IQtree_bestTrees_astral.boot.gene.out &


4.1 extract ASTRAL tree

tail -1 all_IQtree_bestTrees_astral.boot.gene.out > all_IQtree_bestTrees_astral.boot.gene.tre

5. RENAMING taxa to proper names (NB: "I9151_1_62" was changed to "9151_1_62"
in name_conv_key_A because that's how it was encoded previously: this is a
mistake that needs to be fixed in the T37 and T38 analyses)
**in mac add .bk after the -i to fix \ error**

 paste name_conv_key_A name_conv_key_B | while read n k; do sed -i "s/$n/$k/g" all_IQtree_bestTrees_astralTree_N.tre; done
