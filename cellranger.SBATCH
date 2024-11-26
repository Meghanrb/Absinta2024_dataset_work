#!/bin/bash
#SBATCH --job-name=3SRR.SBATCH
#SBATCH --output=z01.%x
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=mrb339@georgetown.edu
#SBATCH --nodes=1
#SBATCH --ntasks=1           # This should be 1, as we'll be using background processes or parallel
#SBATCH --cpus-per-task=1   # Adjust based on your system needs
#SBATCH --time=72:00:00
#SBATCH --mem=120G

# Define the reference transcriptome
TRANSCRIPTOME="/home/mrb339/huang_lab/refdata-gex-GRCh38-2020-A/"

# Define the parent directory where the fastqs are located
FASTQ_DIR="/home/mrb339/huang_lab/fastqs"


# Define an array of sample names or directories with fastq data
SAMPLES=("SRR15235936" "SRR15235937" "SRR15235938" "SRR15235939")
# Loop through the samples and run cellranger count for each
for SAMPLE in "${SAMPLES[@]}"; do
  # Run cellranger count for each sample in the background to run in parallel
  cellranger count --id=${SAMPLE}_count \
    --transcriptome=${TRANSCRIPTOME} \
    --fastqs=${FASTQ_DIR}/${SAMPLE} \
    --create-bam=true &

  # Optionally, sleep a little to avoid overwhelming the system (if needed)
  sleep 1
done

# Wait for all background jobs to complete before finishing the script
wait
