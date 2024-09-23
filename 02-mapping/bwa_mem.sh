#!/bin/bash
# Set the directories and files
TRIMMED_DIR="/Users/bhaskara/Documents/PH_Stress_2019_Tagseq/01-qual-filter/qual_filter_files"
OUTPUT_DIR="BWA_Mapping"
REFERENCE_GENOME="/Users/bhaskara/Documents/Reference_Annotation/PH_HAL_REF/PhalliiHAL_591_v2.0.softmasked.fa"

# Create output directory if it does not exist
mkdir -p "$OUTPUT_DIR"

# Run bwa mem on each file in the trimmed directory
for fastq_file in "$TRIMMED_DIR"/*_concat_clean.fastq; do
    # Extract the base name of the file (without directory and extension)
    base_name=$(basename "$fastq_file" _concat_clean.fastq)
    
    # Run bwa mem to produce the SAM file
    bwa mem -M -t 10 "$REFERENCE_GENOME" "$fastq_file" > "$OUTPUT_DIR/${base_name}.sam"
    
    echo "Processed $fastq_file: output saved to $OUTPUT_DIR/${base_name}.sam"
done

echo "BWA MEM alignment complete. SAM files are located in $OUTPUT_DIR."
