# Bulk RNA-seq Analysis
Pipeline for 3'-mRNA seq (Tag-Seq) analysis

The scripts are designed to be run in a Conda environment.

## 00-qual_report

This directory contains scripts to generate quality reports for raw FASTQ files. Below is a brief summary of each script:

### Scripts Overview

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

This directory contains scripts for filtering and quality control of FASTQ files. The scripts are designed to perform trimming, quality filtering, and subsequent quality control (QC) reporting. Below is a brief summary of each script:

### Scripts Overview

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

This directory contains a script for aligning sequencing reads to a reference genome using the BWA-MEM algorithm. The script is designed to perform read alignment, generating aligned sequences in SAM format. Below is a brief summary of the script:

### Script Overview

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

This directory contains scripts for converting SAM files to BAM format, filtering and sorting BAM files, marking duplicates, and generating mapping statistics as part of an RNA-seq data processing pipeline. 

### Scripts Overview

1. **samtoolsfilter.sh**:
   - **Purpose**: Converts SAM files to BAM format, filters out reads with a mapping quality less than 30, and sorts the BAM files.
   - **Functionality**: Uses SAMtools to ensure that only high-quality, properly sorted reads are retained for further analysis.

2. **markdup.sh**:
   - **Purpose**: Marks duplicate reads in the filtered and sorted BAM files.
   - **Functionality**: Utilizes Picard to identify and mark duplicate reads, which can result from PCR amplification during library preparation. Marking duplicates is essential for accurate downstream analysis.

3. **map-stat.sh**:
   - **Purpose**: Generates mapping statistics for the filtered and duplicate-marked BAM files.
   - **Functionality**: Functionality: Uses SAMtools to produce comprehensive mapping statistics. Specifically, samtools flagstat is used to generate statistics and save them to a specified directory.

### Workflow

1. **Converting and Filtering Reads**:
   - The first step is to convert SAM files to BAM format. During this process, reads with a mapping quality less than 10 are filtered out, and the resulting BAM files are sorted. This ensures that only high-quality, properly sorted reads are retained for further analysis.

2. **Marking Duplicates**:
   - The next step is to mark duplicate reads in the filtered and sorted BAM files. Duplicate reads, which can result from PCR amplification during library preparation, are identified and marked to minimize their impact on downstream analyses.

3. **Generating Mapping Statistics**:
   - The final step involves generating comprehensive mapping statistics for the filtered and duplicate-marked BAM files. These statistics help evaluate the quality and efficiency of the mapping process, providing insights into the overall data quality.

---

Here's a revised summary for the `04-count` directory to include in your `README.md` file on GitHub, specifically mentioning the `featureCount.sh` script:

---

## 04-count

This directory contains a script named `featureCount.sh` for counting the number of mapped reads in RNA-seq data using the featureCounts tool. The script processes BAM files to generate read counts for each gene, facilitating downstream differential expression analysis. Below is a summary of the script's purpose and workflow:

### Script Overview

**featureCount.sh**:
- **Purpose**: Counts the number of mapped reads for each gene in the provided BAM files.
- **Functionality**: Uses the featureCounts tool to process BAM files and generate a count table, essential for subsequent differential expression analysis.

### Workflow

1. **Setup Directories**:
   - The script creates a directory for storing the count files generated from the BAM files.

2. **Processing BAM Files**:
   - The script iterates through each BAM file in the specified mapping directory.
   - For each BAM file, it extracts the base name and uses featureCounts to count the reads mapped to each gene based on a provided annotation file.

3. **FeatureCounts Parameters**:
   - **Annotation File**: The script uses a gene annotation file in GFF3 format to identify gene locations.
   - **Read Extensions**: No extensions are applied to the reads (both 5' and 3' extensions are set to 0).
   - **Strand Specificity**: The script considers the strand-specific information.
   - **Quality Filtering**: Only primary alignments are counted, and duplicate reads are ignored.
   - **Additional Parameters**: Includes options for read quality filtering, minimum fragment length, and the number of threads for parallel processing.

4. **Output**:
   - For each BAM file, a count table is generated and saved in the counts directory. The count table contains the read counts for each gene, which can be used for downstream differential expression analysis.
