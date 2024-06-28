# GET THE MAPPING STATSISTICS FOR BAM FILS USING 'SAMTOOLS FALGASTAT'
MAPPING_DIR="/Users/bhaskara/Documents/PH_Stress_2019_Tagseq/03-map-filter/Map_filter"
MAP_STAT_DIR="Map_stats"

mkdir -p $MAP_STAT_DIR

for bam_file in $MAPPING_DIR/*.bam
do

base_name=$(basename $bam_file .bam)
samtools flagstat "$bam_file" > "$MAP_STAT_DIR/${base_name}.flagstat.txt"
echo "Statistics for $bam_file generated successfully."
done