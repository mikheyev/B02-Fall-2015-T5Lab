#!/bin/bash
#SBATCH --job-name=fb
#SBATCH --partition=compute
#SBATCH --mem-per-cpu=4G
#SBATCH --cpus-per-task=1
#SBATCH --time=7-00:00:00
#SBATCH --ntasks=1
##SBATCH --mail-user=%u@oist.jp
##SBATCH --mail-type=BEGIN,FAIL,END
#SBATCH --input=none
#SBATCH --output=%j.out
##SBATCH --error=job_%j.err

. $HOME/.bashrc

export TEMPDIR=/genefs/MikheyevU/temp
export TEMP=/genefs/MikheyevU/temp
export TMP=/genefs/MikheyevU/temp

ref=../ref/sequence.fasta

freebayes --ploidy 1 -f $ref --bam ../data/alignments/*bam -v ../data/var/raw.vcf


