while read line
        do
        if [[ ${line:0:1} == '>' ]]
        then
                outfile=${line#>}.fa
                echo $line"_Sc" > $outfile
        else
                echo $line >> $outfile
       	fi
done < blast.Sc.out.bestest.fixed.extended.fasta.txt.fasta
