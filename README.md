# lammps-docker
Dockerfile for LAMMPS with Kokkos. To run LAMMPS in an image built from this Dockerfile, you could do something like:

mpirun -n 1 lmp -k on g 1 -sf kk -pk kokkos cuda/aware on neigh full comm device binsize 2.8 -var x 8 -var y 4 -var z 8 -in in.txt

If you wanted to run LAMMPS with a single gpu, and an input file named 'in.txt'
