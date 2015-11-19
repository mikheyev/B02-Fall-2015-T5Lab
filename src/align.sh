#!/bin/bash
#SBATCH --job-name=snakemake
#SBATCH --partition=compute
#SBATCH --mem-per-cpu=4G
#SBATCH --cpus-per-task=8
#SBATCH --time=7-00:00:00
#SBATCH --ntasks=1
##SBATCH --mail-user=%u@oist.jp
##SBATCH --mail-type=BEGIN,FAIL,END
#SBATCH --input=none
#SBATCH --output=%j.out
##SBATCH --error=job_%j.err

. $HOME/.bashrc

a=(../data/reads/*R1*gz) #9
b=(../data/reads/*R2*gz)
f=${a["SLURM_ARRAY_TASK_ID"-1]}
r=${b["SLURM_ARRAY_TASK_ID"-1]}
base=$(basename $f | cut -d_ -f1)
bowbase=../../ref/ecoli

module load bowtie2/2.2.3
bowtie2 -p 6 -x $bowbase --rg-id $base --rg ID:$base --rg LB:Nextera --rg SM:$base --rg PL:ILLUMINA  -1 $f -2 $r | samtools view  -Su - | novosort --ram 20G -c 2 -i -o ../data/alignments/$base.bam -
