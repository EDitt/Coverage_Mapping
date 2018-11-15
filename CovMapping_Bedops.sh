#!/bin/bash

#PBS -q mesabi           
#PBS -l walltime=24:00:00,nodes=3:ppn=16,mem=22gb 
#PBS -m abe 
#PBS -M edittmar@umn.edu

cd ~/Cov_mapping/Bedops

module load bedops_ML/2.4.20
module load samtools_ML/1.8.0


while read line; 
do bam2bed < $line > $line.bed; done < bam_files2.txt #converts bam files to bed files (needed in bedops)

REGIONS_FILE=/panfs/roc/groups/9/morrellp/edittmar/Cov_mapping/Bedops/captured_50x_partsRef.bed

while read line;
do bedmap --echo --count --bases-uniq-f REGIONS_FILE $line > Results/\$line.overlap; done < bam_files3.txt
