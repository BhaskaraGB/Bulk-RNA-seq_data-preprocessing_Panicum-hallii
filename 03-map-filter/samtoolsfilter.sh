#The script iterates over each .sam file in the specified directory.
#For each file, it converts the SAM file to a BAM file, 
#Filters out reads with a mapping quality less than 10, and sorts the BAM file.
#The resulting sorted BAM file is saved in the same directory with the same base name as the original SAM file, but with a .bam extension.

#Define directory
INPUT_DIR="/Users/bhaskara/Documents/PH_Stress_2019_Tagseq/02-mapping/BWA_Mapping"
SAMTOOLS_DIR="Map_filter"

#create directory
mkdir -p "$SAMTOOLS_DIR"

# Covert sam files to bam files
for i in "$INPUT_DIR"/*.sam ;
do
#Extract the basename without the directory and extenstion 
base_name=$(basename "$i" .sam)

#convert SAM to BAM, filter out reads with MAPq < 10 and sort the BAM file 
samtools view -b -q 10 $i | samtools sort -@ 1 -m 2G -o "$SAMTOOLS_DIR/${base_name}.bam" -

 # Print a message indicating the processed file and the output file
    echo "Processed $i: output saved to $SAMTOOLS_DIR/${base_name}.bam"
done

