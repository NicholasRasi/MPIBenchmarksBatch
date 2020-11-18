# MPIBenchmarksBatch

This repo contains a set of scripts that initialize a MPI benchmark environment.

### Usage
#### Init
Init the container images and write the Slurm batch script with one of the following script:

- `ini_benchmarks.sh`: it initializes the MPI batch scripts in the `~/workspace/bench` folder
- `ini_benchmarks_local.sh <num_of_workers>`: it initializes the MPI batch scripts in the `~/workspace/bench` folder and copies the container images to the local disk

#### Run
After the initialization of the batch scripts, the benchmark execution can be started with:

- `run_mpibench.sh`: it starts the mpiBench benchmarks
- `run_osu_alltoall.sh` it starts the OSU alltoall benchmarks
- `run_osu_latency.sh` it starts the OSU latency benchmarks
