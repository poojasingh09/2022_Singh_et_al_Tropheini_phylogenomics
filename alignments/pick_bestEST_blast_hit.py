
f1 = './b.txt'
f2 = 'blast.Sc.out'
f3 = 'blast.Sc.out.bestest'

f1 = open(f1, 'r')
f2 = open(f2, 'r')
f3 = open(f3, 'a')

ref = f1.readlines()
check = f2.readlines()

for line in ref:
	loci = line.split('\t')[0]
	totsize = line.split('\t')[1]
        size = line.split('\t')[2].strip()
	#raw_input(loci)

	for ch in check:
		hitloci = ch.split('\t')[1].strip()
		hitpercent = ch.split('\t')[2].strip()
		hitsize = ch.split('\t')[3].strip()
		alles = ch.strip()
		#raw_input(hitsize)

		if hitloci == loci:
			#raw_input(ch)
			if int(hitsize) >= int(size):
			#	final = check.groupby([hitloci]).max()[hitpercent]
				#raw_input(final)
				final = (alles + "\t" + totsize + "\n")
				
				f3.write(final)
f1.close()
f2.close()
f3.close()	
