# RNA-seq_analysis
Pipeline for 3'-mRNA seq (Tag-Seq) analysis

## 00-qual_report Directory

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
  
Here's a brief summary for the `01-qual-filter` directory and its contents to include in your `README.md` file on GitHub:

---

## 01-qual_filter Directory

This directory contains scripts for filtering and quality control of FASTQ files. The scripts are designed to be run in a Conda environment and perform trimming, quality filtering, and subsequent quality control (QC) reporting. Below is a brief summary of each script:

### Scripts

1. **cutadapt.sh**:
   - **Purpose**: Trims adapters and low-quality bases from the FASTQ files.
   - **Usage**: This script uses Cutadapt to remove adapter sequences and filter out low-quality reads, preparing the data for further analysis.

2. **QC_qual_filter.sh**:
   - **Purpose**: Performs additional quality filtering on the trimmed FASTQ files.
   - **Usage**: This script applies further quality filtering criteria to ensure that only high-quality reads are retained for downstream analysis.

3. **fastqc_data_txt.sh**:
   - **Purpose**: Extracts specific data from the FastQC output.
   - **Usage**: This script processes the FastQC output files to extract relevant quality metrics and summary statistics after filtering.

### Workflow

1. **Adapter Trimming**:
   - Use `cutadapt.sh` to trim adapter sequences and low-quality bases from the raw FASTQ files. This step ensures that the reads are clean and suitable for quality filtering.

2. **Quality Filtering**:
   - Use `QC_qual_filter.sh` to apply additional quality filtering to the trimmed FASTQ files. This step further refines the data by removing low-quality reads.

3. **Running FastQC**:
   - Use `fastqc_data_txt.sh` to perform quality control analysis on the filtered FASTQ files. This script will generate detailed QC reports and extract key metrics for review.


