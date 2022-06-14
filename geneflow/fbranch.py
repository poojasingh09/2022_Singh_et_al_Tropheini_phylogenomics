allowed_bases = ['A','C','T','G']
with open(vcf_raw) as fi, \
      open(vcf_del_to_N, 'w') as fo:
    i = 0
    for line in fi.readlines():
        
        if line.startswith('##'):
            fo.write(line)
        elif line.startswith('#'):
            for i, (s,e) in partitions.iterrows():
                l = e - s
                fo.write("##contig=<ID=locus{},length={}>\n".format(i, l))
            #rename samples in vcf to match tree
            line=line.replace('"','').replace('Tropheus_moorii_Mpimbwe1',
                                         'Tropheus_moorii_Mpimbwe')
            fo.write(line)
        else:
            sline = line.strip().split()
            alts = sline[4].split(',')
            cont = 0
            # skip site if there is an ambiguous base (Y,R, etc.)
            for b in alts:
                if not (b in allowed_bases or b == '*'):
                    cont = 1
            if cont:
                continue
            # biallelic sites
            if len(alts) == 1:
                for j in range(9,len(sline)):
                    if sline[j] == '0':
                        sline[j] = '0/0'
                    elif sline[j] == '1':
                        sline[j] = '1/1'
            # biallelic sites with a deletion            
            elif (len(alts) == 2) and ('*' in alts):
                s = alts.index('*')

                for j in range(9, len(sline)):
                    if sline[j] == '0':
                        sline[j] = '0/0'
                    # set deletions to missing genotypes
                    elif sline[j] == str(s+1):
                        sline[j] = './.'
                    else:
                        sline[j] = '1/1'
                sline[4] = alts[0] if s else alts[1]
            #skip over multiallelic sites
            else:
                continue
                
            #rename loci to chromosomes:
            p = int(sline[1])
            partition = partitions[(partitions['start'] <= p)&(p <= partitions['end'])].iloc[0]
            chrom = partition.name
            s,e = partition.values
            sline[0] = 'locus{}'.format(chrom)
            sline[1] = str(p - s)      
                
            fo.write('\t'.join(sline) + '\n')

