# Counting mapped reads using featureCounts
MAPPING_DIR="Mapping_Dir"
COUNT_DIR="Counts_dir"
ANNOTATION_FILE="/Users/bhaskara/Documents/Reference_Annotation/PH_HAL_REF/PhalliiHAL_591_v2.2.gene.gff3"

mkdir -p "$COUNT_DIR"

for i in "$MAPPING_DIR"/*.bam; 
do 
    base=$(basename "$i" .bam)
    featureCounts -a "$ANNOTATION_FILE" \
    -o "$COUNT_DIR"/"${base}.counts.tab" \
    -t gene \
    -g ID \
    --readExtension5 0 \
   --readExtension3 0 \
    -s 1 \
    -Q 0 \
    -d 50 \
    -T 4 \
    --primary \
    --ignoreDup \
    "$i"
    echo "Count file for $i generated successfully."
done