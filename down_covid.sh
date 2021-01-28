#how to download fastq file
#go to firefox and search ncbi covid-19
#chose a file and go to bash
#run the command below

fastq-dump --split-files SRR13448536

#now i have two files because my data are two-paired

#quality control
fastqc SRR13448536_1.fastq
fastqc SRR13448536_2.fastq
 
#indexing
bwa index -p covid sequence.fasta

#perform bwa allignment to reference
bwa mem -M -t 8 covid SRR13448536_1.fastq SRR13448536_2.fastq >SRR13448536.sam

#samtools
samtools fixmate -O bam SRR13448536.sam SRR13448536.bam

#sort bam
samtools sort -T temp.prefix -O bam -@ 8 -o SRR13448536.sorted.bam SRR13448536.bam

