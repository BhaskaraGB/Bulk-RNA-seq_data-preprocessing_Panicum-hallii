# RNA-seq_analysis
Pipeline for 3'-mRNA seq (Tag-Seq) analysis

## 01-qual_report Directory

This directory contains scripts to generate quality reports for raw FASTQ files. The scripts are designed to be run in a Conda environment and provide detailed quality control (QC) reports. Below is a brief summary of each script:

### Scripts

1. concat.sh:
   - Purpose: Concatenates multiple FASTQ files into a single file for each sample.
   - Usage: This script finds all FASTQ files corresponding to each sample, concatenates them, and prepares them for quality analysis.

2. fastqc_data_txt.sh:
   - Purpose: Extracts specific data from the FASTQC output.
   - Usage: This script processes the FASTQC output files to extract relevant quality metrics and summary statistics.

3. run_fastqc.sh:
   - **Purpose**: Runs the FastQC tool on the raw FASTQ files.
   - **Usage**: This script executes FastQC on all FASTQ files in the directory, generating detailed QC reports for each file.

### Workflow

1. Concatenation:
   - Use `concat.sh` to concatenate raw FASTQ files for each sample, ensuring they are ready for quality analysis.

2. Running FastQC:
   - Use `run_fastqc.sh` to perform quality control analysis on the concatenated FASTQ files. This script will generate HTML and text reports detailing the quality metrics.

3. Data Extraction:
   - Use `fastqc_data_txt.sh` to extract and summarize specific quality metrics from the FastQC output files, providing a concise overview of the results.



