for i in `ls *.mafft | cut -f 1 -d"."`;

do

cat $i".random_allele_gms.fas.mafft" | head -n 2 > $i

rm $i
#awk '/^>/ {gsub(/.fa(sta)?$/,"",FILENAME);printf(">%s\n",FILENAME);next;} {print}' $i >> T37loci.fasta

done
