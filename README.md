# Bulk RNA-seq Analysis
Pipeline for 3'-mRNA seq (Tag-Seq) analysis

## 00-qual_report

This directory contains scripts to generate quality reports for raw FASTQ files. The scripts are designed to be run in a Conda environment and provide detailed quality control (QC) reports. Below is a brief summary of each script:

### Scripts

1. **concat.sh**:
   - **Purpose**: Concatenates multiple FASTQ files into a single file for each sample.
   - **Usage**: This script finds all FASTQ files corresponding to each sample, concatenates them, and prepares them for quality analysis.

2. **fastqc_data_txt.sh**:
   - **Purpose**: Extracts specific data from the FASTQC output.
   - **Usage**: This script processes the FASTQC output files to extract relevant quality metrics and summary statistics.

3. **run_fastqc.sh**:
   - **Purpose**: Runs the FastQC tool on the raw FASTQ files.
   - **Usage**: This script executes FastQC on all FASTQ files in the directory, generating detailed QC reports for each file.

### Workflow

1. **Concatenation**:
   - Use `concat.sh` to concatenate raw FASTQ files for each sample, ensuring they are ready for quality analysis.

2. **Running FastQC**:
   - Use `run_fastqc.sh` to perform quality control analysis on the concatenated FASTQ files. This script will generate HTML and text reports detailing the quality metrics.

3. **Data Extraction**:
   - Use `fastqc_data_txt.sh` to extract and summarize specific quality metrics from the FastQC output files, providing a concise overview of the results.

---

## 01-qual_filter

This directory contains scripts for filtering and quality control of FASTQ files. The scripts are designed to be run in a Conda environment and perform trimming, quality filtering, and subsequent quality control (QC) reporting. Below is a brief summary of each script:

### Scripts

1. **cutadapt.sh**:
   - **Purpose**: Trims adapters and low-quality bases from the FASTQ files.
   - **Usage**: This script uses Cutadapt to remove adapter sequences and filter out low-quality reads, preparing the data for further analysis.

2. **QC_qual_filter.sh**:
   - **Purpose**: Extracting quality report for the trimmed FASTQ files.
   - **Usage**: This script uses fastqc ensures that only high-quality reads are retained for downstream analysis.
   - 
3. **fastqc_data_txt.sh**:
   - **Purpose**: Extracts specific data from the FastQC output.
   - **Usage**: This script processes the FastQC output files to extract relevant quality metrics and summary statistics after filtering.

### Workflow

1. **Adapter Trimming**:
   - Use `cutadapt.sh` to trim adapter sequences and low-quality bases from the raw FASTQ files. This step ensures that the reads are clean and suitable for quality filtering.

2. **Quality Filtering**:
   - Use `QC_qual_filter.sh` This script uses fastqc ensures that only high-quality reads are retained for downstream analysis.

3. **Running FastQC**:
   - Use `fastqc_data_txt.sh` to perform quality control analysis on the filtered FASTQ files. This script will generate detailed QC reports and extract key metrics for review.
 
---

## 02-mapping

This directory contains a script for aligning sequencing reads to a reference genome using the BWA-MEM algorithm. The script is designed to be run in a Conda environment and performs read alignment, generating aligned sequences in SAM format. Below is a brief summary of the script:

### Script

1. **bwa-mem.sh**:
   - **Purpose**: Aligns sequencing reads to a reference genome using the BWA-MEM algorithm.
   - **Usage**: This script takes raw or preprocessed FASTQ files and aligns them to a specified reference genome, outputting the results in SAM format for further analysis.

### Workflow

1. **Read Alignment**:
   - Use `bwa-mem.sh` to perform read alignment. This step maps the sequencing reads to the reference genome, producing aligned sequences in SAM format.

---
Here's a revised summary for the `03-map-filter` directory to include in your `README.md` file on GitHub, focusing on the process and purpose without providing specific script commands:

---

## 03-map-filter

This directory contains scripts for converting SAM files to BAM format, filtering and sorting BAM files, marking duplicates, and generating mapping statistics as part of an RNA-seq data processing pipeline. These scripts are designed to be run in a Conda environment, ensuring reproducibility and ease of use.

### Scripts

1. **samtoolsfilter.sh**:
   - **Purpose**: Converts SAM files to BAM format, filters out reads with a mapping quality less than 30, and sorts the BAM files.
   - **Functionality**: Uses SAMtools to ensure that only high-quality, properly sorted reads are retained for further analysis.

2. **markdup.sh**:
   - **Purpose**: Marks duplicate reads in the filtered and sorted BAM files.
   - **Functionality**: Utilizes Picard to identify and mark duplicate reads, which can result from PCR amplification during library preparation. Marking duplicates is essential for accurate downstream analysis.

3. **map-stat.sh**:
   - **Purpose**: Generates mapping statistics for the filtered and duplicate-marked BAM files.
   - **Functionality**: Employs tools like SAMtools or Picard to produce comprehensive mapping statistics, helping to assess the quality and efficiency of the mapping process.

### Workflow

1. **Converting and Filtering Reads**:
   - The first step is to convert SAM files to BAM format. During this process, reads with a mapping quality less than 30 are filtered out, and the resulting BAM files are sorted. This ensures that only high-quality, properly sorted reads are retained for further analysis.

2. **Marking Duplicates**:
   - The next step is to mark duplicate reads in the filtered and sorted BAM files. Duplicate reads, which can result from PCR amplification during library preparation, are identified and marked to minimize their impact on downstream analyses.

3. **Generating Mapping Statistics**:
   - The final step involves generating comprehensive mapping statistics for the filtered and duplicate-marked BAM files. These statistics help evaluate the quality and efficiency of the mapping process, providing insights into the overall data quality.







