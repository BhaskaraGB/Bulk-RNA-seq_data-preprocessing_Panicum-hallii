#Actiavte trim-galore in conda. 
#Trim-galore includes packages for fastqc and cutadapt

#The THREADS variable is set to 10.
THREADS=10

#Define directories
INPUT_DIR="/Users/bhaskara/Documents/PH_Stress_2019_Tagseq/00-qual-report/concat_fastq_files"
TRIMMED_DIR="qual_filter_files"

# Create the directories if it doesn't exist
#mkdir -p "$RAW_DIR"
mkdir -p "$TRIMMED_DIR"

# Run cutadapt for each file in the RAW_DIR
for i in "$INPUT_DIR"/*.fastq.gz
do
    # Extract the base filename without the path and extension
    base=$(basename "$i" .fastq.gz)
    
    # Define the output filename
    output="$TRIMMED_DIR/${base}_clean.fastq"
    
    # Run cutadapt with the provided commands
    cutadapt -j "$THREADS" -a A{15} "$i" -u 9 -m 70 | \
    cutadapt -j "$THREADS" -a T{15} -m 70 - | \
    cutadapt -j "$THREADS" -g ACACGACGCTCTTCCGATCT -O 12 - | \
    cutadapt -j "$THREADS" -a ATCTCGTATGCCGTCTTCTG -O 12 -m 70 -o "$output" -

done



