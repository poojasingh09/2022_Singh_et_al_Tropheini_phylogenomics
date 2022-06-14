
Singh et al 2022: Gene flow analysis

F-branch analysis
F-branch is a recently developed summary of many F4 admixture ratio tests (a type of ABBA/BABA statistic) [cite Patterson et al. 2010 https://doi.org/10.1534/genetics.112.145037] that is able to identify patterns allele sharing between non-sister branches of a phylogeny that are consistent with gene flow [cite Malinksy et al. 2020  DOI: 10.1111/1755-0998.13265]. To apply f-branch to the phylogenetic groups identified in Figure 1, we first converted the mulit-FASTA supermatrix to VCF format using snp-sites (https://github.com/sanger-pathogens/snp-sites) with the option -v. A custom script  (script 1) was used to update the header, set the genotypes to '0/0' and '1/1' instead of 0 and 1 as required by Dsuite, remove multiallelic sites, and set deletions as missing genotypes './.'. The latter is necessary to retain sites where one of the samples did not align. Next, the F4-ratio was calculated for the groups and input tree shown in Figure 1 and Eretmodus cyanostictus set as ougroup using Dsuite with the command line `Dsuite Dtrios -t tree.newick --JKnum 10 input.vcf tropheini_groups_SETS.txt`.  We used the output of this to compute f-branch using the functions dstat.get_fmin_tree and dstat.get_branch_mat available in (https://github.com/feilchenfeldt/pypopgen3).  For this we only retained F4-ratio values with an associated block-jackknife p-value < 0.05 as calculated by Dsuite. All other F4-ratios were set to 0. The results are shown in Figure 4D.

Script used is fbranch.py

