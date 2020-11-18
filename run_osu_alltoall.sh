#!/bin/bash

echo "running osu_alltoall"

res_folder=$(pwd)/results/osu/alltoall
mkdir -p $res_folder

for container in "nocont" "singularity" "charliecloud"
do
	for nodes in 1 2 3 4 5 6 7
	do
		for ntasks in 10 30
		do
			echo -e "running $container with $nodes nodes, $ntasks tasks"
			out_folder=$res_folder/$container/$nodes/$ntasks/
			mkdir -p $out_folder
			sbatch --job-name osu_all_$nodes \
				   --nodes $nodes \
				   --ntasks-per-node $ntasks \
				   --output=$out_folder/res_mpi.txt \
				   --err=$out_folder/err_mpi.txt \
				   --wait \
				   osu_$container.sh mpi/collective/osu_alltoall -f
		done
	done
done