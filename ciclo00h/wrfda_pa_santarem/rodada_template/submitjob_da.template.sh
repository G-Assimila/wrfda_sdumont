#!/bin/bash
#SBATCH --nodes=4                      #Numero de Nós
#SBATCH --ntasks=96                    #Numero total de tarefas MPI
#SBATCH -p cpu_dev                     #Fila (partition) a ser utilizada
#SBATCH -J WRF       #Nome job

module load cmake/3.17.3
module load python/3.8.2
module load openmpi/gnu/4.1.2_gcc-9.3_ucx_1.12+cuda-11.12
. /scratch/g-assimila/sdbase/spack/v0.17.1/share/spack/setup-env.sh
export SPACK_USER_CONFIG_PATH=/scratch/g-assimila/sdbase/spack/.config/v0.17.1

spack load --only dependencies wrf@4.2%gcc@9.3.0

export LD_LIBRARY_PATH=/scratch/g-assimila/sdbase/usr/lib64:$LD_LIBRARY_PATH

export WPS_DIR=$SLURM_SUBMIT_DIR/WPS
export WRF_DIR=$SLURM_SUBMIT_DIR/WRF/run
export WRFDA_DIR=$SLURM_SUBMIT_DIR/WRFDA/run
export OBSPROC_DIR=$SLURM_SUBMIT_DIR/OBSPROC/run

cd $WPS_DIR
srun -n 1 ./geogrid.exe
srun -n 1 ./ungrib.exe
srun -n 1 ./metgrid.exe
#rm GRIBFILE* && rm FILE*

export OMPI_MCA_opal_warn_on_missing_libcuda=0
export OMPI_MCA_mpi_cuda_support=0

cd $WRF_DIR
ln -sf $WPS_DIR/met_em* .

# Checa os niveis o numero de niveis dos arquivos met_em*
fmet_em=`ls -1 ${WPS_DIR}/met_em.* |head -1`
nmet_em_lev=`ncdump -h $(ls -1 ${WPS_DIR}/met_em.* |head -1) | grep BOTTOM-TOP_GRID_DIMENSION |awk '{print $3}'`
sed -i "s/num_metgrid_levels                  = NUMGRIDLEVELS/num_metgrid_levels                  = ${nmet_em_lev}/" ${WRF_DIR}/namelist.input

srun -n 1 ./real.exe 
srun -n $SLURM_NTASKS ./wrf.exe 
#rm met_em*
gzip rsl.*

cd $OBSPROC_DIR
srun -n 1 \
cat \
 /scratch/g-assimila/data/datain/rda.ucar.edu/ds351/little_r/ANO/OBS:DIAMIN \
 /scratch/g-assimila/data/datain/rda.ucar.edu/ds351/little_r/ANO/OBS:ANOMESDIAINI00 \
 /scratch/g-assimila/data/datain/rda.ucar.edu/ds351/little_r/ANO/OBS:ANOMESDIAINI06 \
 /scratch/g-assimila/julio.silva2/dados/obs/superficie/inmet/ANO/SURFACE_OBS-INMET-BR-ANOMESDIAINI00 \
 /scratch/g-assimila/data/datain/rda.ucar.edu/ds461/little_r/ANO/SURFACE_OBS:DIAMIN \
 /scratch/g-assimila/data/datain/rda.ucar.edu/ds461/little_r/ANO/SURFACE_OBS:ANOMESDIAINI00 \
 /scratch/g-assimila/data/datain/rda.ucar.edu/ds461/little_r/ANO/SURFACE_OBS:ANOMESDIAINI06 \
 >  ./OBS_ANOMESDIAINI00
srun -n 1 ./obsproc.exe

cd $WRFDA_DIR
srun -n 1 ./da_wrfvar.exe

rm $OBSPROC_DIR/OBS_ANOMESDIAINI00
