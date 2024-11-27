# Absinta2024_dataset_work
Below is metadata

Run	ReleaseDate	LoadDate	spots	bases	spots_with_mates	avgLength	size_MB	AssemblyName	download_path	Experiment	LibraryName	LibraryStrategy	LibrarySelection	LibrarySource	LibraryLayout	InsertSize	InsertDev	Platform	Model	SRAStudy	BioProject	Study_Pubmed_id	ProjectID	Sample	BioSample	SampleType	TaxID	ScientificName	SampleName	g1k_pop_code	source	g1k_analysis_group	Subject_ID	Sex	Disease	Tumor	Affection_Status	Analyte_Type	Histological_Type	Body_Site	CenterName	Submission	dbgap_study_accession	Consent	RunHash	ReadHash
SRR15235936	9/2/21 11:30	7/24/21 16:44	244167324	29055911556	244167324	119	12657		https://sra-downloadb.be-md.ncbi.nlm.nih.gov/sos3/sra-pub-zq-24/SRR015/15235/SRR15235936/SRR15235936.lite.1	SRX11541838		RNA-Seq	cDNA	TRANSCRIPTOMIC	PAIRED	0	0	ILLUMINA	Illumina HiSeq 2500	SRP329679	PRJNA749443	3	749443	SRS9576822	SAMN20369768	simple	9606	Homo sapiens	GSM5470483							no					GEO	SRA1264020		public	AEE4F1204A2C054345CB61D8091F6117	02A425C9C72CB35400826C42FA06C092![image](https://github.com/user-attachments/assets/2c9313e3-47f1-4d80-9b0e-a6acc0a0afc2)

# Workflow:

## 1. Copied files to directory 
LONGON TO INTERACTIVE NODE: srun --pty bash
gsutil -m cp -r gs://gu-biology-pi-jh1659/SRR1* .
OR write a slurm script: https://hpc.georgetown.edu/how-to-transfer-files/transferring-data-from-or-to-gcs

## 2. Align Reads with Cell ranger

### downloaded cellranger OR call it
For calling it:
make sure you are on a compute node!!
export PATH=/home/mrb339/huang_lab/cellranger-8.0.1:$PATH
For downloading:
see details here: https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/using/tutorial_in#login

### Ran Cellranger 
[cellranger.SBATCH](https://github.com/Meghanrb/Absinta2024_dataset_work/blob/main/cellranger.SBATCH) for the slurm script

