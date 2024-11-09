#Trim-galore is wrapper includes packages for fastqc and cutadapt

# Define the directories
TRIMMED_DIR="qual_filter_files"
TRIMMED_QC_DIR="qual_filter_QC_files"

# Create the directory if it doesn't exist
#mkdir -p "$TRIMMED_DIR"
#mkdir -p "$TRIMMED_QC_DIR"

echo "Running fastqc on trimmed fastq data ..."
fastqc "$TRIMMED_DIR"/*_clean.fastq -t 10 --nogroup -o "$TRIMMED_QC_DIR"

# Unzip fastqc.zip files for fastqc_data.txt and summary.txt files
echo "Unzipping FastQC results..."
if ls "$TRIMMED_QC_DIR"/*_fastqc.zip 1> /dev/null 2>&1; then
    unzip "$TRIMMED_QC_DIR"/'*_fastqc.zip' -d "$TRIMMED_QC_DIR"
    echo "FastQC analysis complete."
else
    echo "No FastQC result zip files found in $TRIMMED_QC_DIR. Exiting."
    exit 1
fi
