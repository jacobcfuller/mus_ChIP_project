#!/bin/bash
#running sissrs. Practice


export PATH=${PATH}:/Volumes/MW_18TB/Jacob_Fuller/White_lab/mus_chIP_project/SISSRs

echo "Type the strain you want to run, followed by [Enter]:"

read strain_name

cd /Volumes/MW_18TB/Lucas_Nell/lan/musChIP/bed

input_chip_bed=B6-9R-13R_Y_Dq.bed
chip_bed="${strain_name}"_Y_Dq.bed

echo "What p-value do you want to use?"
read p_val


input_dna_bed=`echo ${input_chip_bed} | sed 's/_D/_Di/g; s/_H/_Hi/g'`

output_name=${chip_bed/%.bed/}_Pv${p_val/#0./}.bsites

output_dir=/Volumes/MW_18TB/Jacob_Fuller/White_lab/mus_chIP_project/chIP_calls

sissrs.pl -i ${chip_bed} -o ${output_dir}/${output_name} \
	-s 2700000000 -a -F 1000 -E 10 -p ${p_val} -b ${input_dna_bed}
