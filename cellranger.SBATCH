#!/bin/bash
#SBATCH --job-name=cellranger_cnts.SBATCH --output=z01.%x
#SBATCH --mail-type=END,FAIL --mail-user=mrb339@georgetown.edu
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1 --time=24:00:00
#SBATCH --mem=120G

cellranger count --id=cellranger2 \
--transcriptome=/home/mrb339/huang_lab/refdata-gex-GRCh38-2020-A/ \
--fastqs=/home/mrb339/huang_lab/s9_S1_L001_fastqs/ \
--create-bam=true
