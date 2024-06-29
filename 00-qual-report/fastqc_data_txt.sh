#!/bin/bash
# programmer:Bhaskara GB
#This script processes FastQC results to extract the total number of sequences from each fastqc_data.txt file 
#and compiles this information into a CSV file.

# Define the directory containing FastQC results
FASTQC_DIR="fastqc_results" # Directory to store fastqc.zip results
OUTPUT_CSV="fastqc_total_sequences.csv"

# Initialize the CSV file
echo "Filename,Total_Sequences" > $OUTPUT_CSV

# Iterate through each fastqc_data.txt file in the FASTQC_DIR
for fastqc_data_file in "$FASTQC_DIR"/*/fastqc_data.txt
do
    # Extract the base filename (directory name)
    base_filename=$(basename $(dirname "$fastqc_data_file"))
    
    # Extract the total number of sequences
    total_sequences=$(grep "Total Sequences" "$fastqc_data_file" | awk '{print $3}')
    
    # Write the result to the CSV file
    echo "$base_filename,$total_sequences" >> $OUTPUT_CSV
done

echo "Total sequences counts saved to $OUTPUT_CSV"
