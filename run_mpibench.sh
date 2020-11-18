#!/bin/bash

echo "running mpiBench"

res_folder=$(pwd)/results/mpiBench
mkdir -p $res_folder


size=64K
for container in "nocont" "singularity" "charliecloud"
do
	for nodes in 2 4 5 6 7
	do
		for ntasks in 10 30 60
		do
			echo "running $container with $nodes nodes, $ntasks tasks, $size size"
			out_folder=$res_folder/$container/$nodes/$ntasks/$size
			mkdir -p $out_folder
			sbatch --job-name mpibench_$nodes \
				   --nodes $nodes \
				   --ntasks-per-node $ntasks \
				   --output=$out_folder/res_mpi.txt \
				   --err=$out_folder/err_mpi.txt \
				   --wait \
				   mpibench_$container.sh $size
		done
	done
done