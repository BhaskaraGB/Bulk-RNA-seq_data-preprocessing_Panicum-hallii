# Step 1: Activate the fastqc_env in terminal (conda activate fastqc_env).

# Step 2: Navigate to the directory where you want to store your input files and output results. 

# Define the directories
INPUT_DIR="concat_files"  # Directory to store fastq.gz files
FASTQC_DIR="fastqc_results" # Directory to store fastqc.zip results

# Create directories if they do not already exist
mkdir -p "$FASTQC_DIR" 

# Step 3: Run fastqc on all fastq.gz files in the input directory:
echo "Running fastqc on raw data ..."
fastqc -t 10 "$INPUT_DIR"/*_concat.fastq.gz --nogroup -o "$FASTQC_DIR"

# The FastQC command also generates fastqc.html files, which can be opened in a web browser for detailed quality control reports.

# Step 4: Unzip fastqc.zip files for fastqc_data.txt and summary.txt files
echo "Unzipping FastQC results..."
if ls "$FASTQC_DIR"/*_fastqc.zip 1> /dev/null 2>&1; then
    unzip "$FASTQC_DIR"/'*_fastqc.zip' -d "$FASTQC_DIR"
    echo "FastQC analysis complete."
else
    echo "No FastQC result zip files found in $FASTQC_DIR. Exiting."
    exit 1
fi
