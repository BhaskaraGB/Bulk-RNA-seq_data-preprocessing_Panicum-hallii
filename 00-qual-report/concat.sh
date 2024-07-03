#!/bin/bash

# 1. Extract sample names from a metadata file (meta_noheader).
# 2. Find FASTQ files corresponding to these sample names in the specified input directory (fastq_files).
# 3. Concatenate these FASTQ files and store the result in an output directory (concat_files).

#!/bin/bash

# Define the input directory containing your FASTQ files
INPUT_DIR="fastq_files"
META_FILE="meta_noheader"

# Define the output directory for concatenated files
OUTPUT_DIR="concat_files"
mkdir -p "$OUTPUT_DIR"

# Extract sample names from the metadata file (assuming sample names are in the first column)
SAMPLES=$(awk -F, '{print $1}' "$META_FILE")

# Loop through each sample
for SAMPLE_ID in $SAMPLES; do
    echo "Processing sample: $SAMPLE_ID"

    # Find the FASTQ files for the current sample
    FILES=$(find "$INPUT_DIR" -name "${SAMPLE_ID}*.fastq.gz" -type f)

    # Check if there are FASTQ files found
    if [ -n "$FILES" ]; then
        # Print the files to be concatenated for debugging
        echo "Files to be concatenated for $SAMPLE_ID:"
        echo "$FILES"
        
        # Concatenate the files using gzip -dc and redirect the output to a new compressed file
        gzip -dc $FILES | gzip > "$OUTPUT_DIR/${SAMPLE_ID}_concat.fastq.gz"
        echo "Files for sample $SAMPLE_ID have been concatenated into $OUTPUT_DIR/${SAMPLE_ID}_concat.fastq.gz"
    else
        echo "Error: No FASTQ files found for sample $SAMPLE_ID"
    fi
done

echo "Concatenation complete. Combined files are located in $OUTPUT_DIR."
