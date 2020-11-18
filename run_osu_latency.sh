#!/bin/bash

echo "running osu_latency"

res_folder=$(pwd)/results/osu/latency
mkdir -p $res_folder

for container in "nocont" "singularity" "charliecloud"
do
	for nodes in 2 1
	do
		for ntasks in 1 2
		do
			if [[ $(( $nodes*$ntasks )) = 2 ]]; then
				echo -e "running $container with $nodes nodes, $ntasks tasks"
				out_folder=$res_folder/$container/$nodes/$ntasks/
				mkdir -p $out_folder
				sbatch --job-name osu_lat_$nodes \
					   --nodes $nodes \
					   --ntasks-per-node $ntasks \
					   --output=$out_folder/res_mpi.txt \
					   --err=$out_folder/err_mpi.txt \
					   --wait \
					   osu_$container.sh mpi/pt2pt/osu_latency
			fi
		done
	done
done