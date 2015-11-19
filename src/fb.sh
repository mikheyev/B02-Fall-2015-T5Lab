#!/bin/bash
#$ -q short
#$ -j y
#$ -cwd
#$ -N cl
#$ -l h_vmem=10G
#$ -l virtual_free=10G

. $HOME/.bashrc

export TEMPDIR=/genefs/MikheyevU/temp
export TEMP=/genefs/MikheyevU/temp
export TMP=/genefs/MikheyevU/temp

ref=../ref/sequence.fasta

freebayes --ploidy 1 -f $ref --bam ../data/alignments/*bam -v ../data/var/raw.vcf


