# Mark duplicated alignements using picard
#!/bin/bash

# Define the directory containing the BAM files
MAPPING_DIR="/Users/bhaskara/Documents/PH_Stress_2019_Tagseq/03-map-filter/Map_filter"

# Define the output directory
OUTPUT_DIR="Marked_dups"

# Create the output directory if it doesn't exist
mkdir -p $OUTPUT_DIR

# Iterate through each BAM file in the mapping directory
for bam_file in $MAPPING_DIR/*.bam; do
    # Extract the base name of the file (without path and extension)
    base_name=$(basename $bam_file .bam)
    
    #Define the output BAM file and metrics file paths
    output_bam="$OUTPUT_DIR/${base_name}_dedup.bam"
    metrics_file="$OUTPUT_DIR/${base_name}_metrics.txt"
    
    # Run Picard MarkDuplicates
    picard MarkDuplicates \
        I=$bam_file \
        O=$output_bam \
        M=$metrics_file \
        REMOVE_DUPLICATES=false \
        ASSUME_SORTED=true
    
    echo "Processed $bam_file, output saved to $output_bam"
done
