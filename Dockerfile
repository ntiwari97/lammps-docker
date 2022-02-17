FROM nvcr.io/nvidia/nvhpc:22.1-devel-cuda_multi-ubuntu20.04 as builder
WORKDIR /opt/
RUN wget -O /opt/lammps-stable.tar.gz https://download.lammps.org/tars/lammps-stable.tar.gz
RUN mkdir lammps
RUN tar xf lammps-stable.tar.gz -C lammps --strip-components 1
WORKDIR /opt/lammps/
# If you want to edit GPU/CPU arch, modify the 'Makefile.kokkos_cuda_mpi' file in src/MAKE/OPTIONS and save it in the same directory as this Dockerfile. Default GPU arch is Volta.
#COPY Makefile.kokkos_cuda_mpi /opt/lammps-29Sep2021/MAKE/OPTIONS/

WORKDIR /opt/lammps/src/
RUN make yes-rigid
RUN make yes-granular
RUN make yes-kspace
RUN make yes-manybody
RUN make yes-misc
RUN make yes-molecule
RUN make yes-molfile
RUN make yes-class2
RUN make yes-kokkos
RUN make yes-extra-dump
RUN make kokkos_cuda_mpi -j 4
ENV PATH="/opt/lammps/src/:${PATH}"
