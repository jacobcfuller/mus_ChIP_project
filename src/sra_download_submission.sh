#PBS -S /bin/bash
#PBS -q batch
#PBS -N sra_download_convert
#PBS -l nodes=1:ppn=48:mwnode
#PBS -l mem=120gb
#PBS -l walltime=`96`:00:00
#PBS -M jacobcfuller93@gmail.com
#PBS -m ae
#PBS -j oe

fetch=/home/jcfuller/mus_chIP_project/Accessions/mus_accessions.txt

arr=()
while read -r line
do
    arr+=("$line")
done < ${fetch}

shell_opt="a:"$(echo ${arr[@]} | sed 's/ /;/g')


/home/jcfuller/scripts/parallel_bash.py \
    -s /home/jcfuller/mus_chIP_project/download_sra_and_convert_to_fastq/download_sra_and_convert_to_fastq.sh \
    -t 48 \
    ${shell_opt}
