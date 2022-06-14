#QUERY=blast.On.out.best.fasta
SUBJECT=Or.fasta 
#SUBJECT=/netapp/home/singh/pooja_phd/data/cichlid_reference_genomes/new_Oreochromis/20120125_MapAssembly.anchored.assembly.fasta
#SUBJECT=/netapp/home/singh/pooja_phd/data/cichlid_reference_genomes/Neolamprologous_brichardi/N_brichardi_v1.assembly.fasta
#SUBJECT=/netapp/home/singh/pooja_phd/data/cichlid_reference_genomes/Astatotilapia_burtoni/H_burtoni_v1.assembly.fasta
#SUBJECT=/netapp/home/singh/pooja_phd/data/cichlid_reference_genomes/Metriaclima_zebra/M_zebra_v0.assembly.fasta
#SUBJECT=/netapp/home/singh/pooja_phd/data/cichlid_reference_genomes/Pundimilia_nyererei/P_nyererei_v1.assembly.fasta
#SUBJECT=/netapp/home/singh/pooja_phd/data/cichlid_reference_genomes/Tropheus_moorii/tm_genome_draft.fasta
#SUBJECT=/netapp/home/singh/pooja_phd/data/cichlid_reference_genomes/Petrochromis_trewavasae/pt_genome_draft.fasta
#QUERY=/netapp/home/singh/pooja_phd/data/cichlid_reference_genomes/Midas/Midas_v5.7_anchored.fasta
QUERY=T37loci.fasta



/cl_tmp/singh/tools/ncbi/bin/formatdb -p F -i $SUBJECT
/cl_tmp/singh/tools/ncbi/bin/blastall -p blastn -i $QUERY -d $SUBJECT -m 8 -a 8 > blast.Or.out
