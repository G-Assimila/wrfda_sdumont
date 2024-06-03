# Projeto G-Assimila no supercomputador Santos Dumont

## Acesso ao SDumont
- Fazer login no SDumont

  ```bash
  ssh <username>@login.sdumont.lncc.br
  ```
## Localização da instalação do WRF, WRFDA e WPS

O WRF, WRFDA e WPS compilados no SDumont, estão localizados nos seguintes diretórios:

```bash
WRF:
/scratch/g-assimila/sdbase/wrf-model/v4.2/WRF

WRFDA:
/scratch/g-assimila/sdbase/wrf-model/v4.2/WRFDA

WPS:
/scratch/g-assimila/sdbase/wrf-model/v4.2/WPS
```



## Localização dos dados de condição de contorno (GFS)

Os dados de condição de contorno são aramazenado no seguinte diretório:

```bash
/scratch/g-assimila/data/datain/gfs/dominio/
```

Por exemplo, os dados de uma região no estado do RJ, no período compreendendo os meses de junho a agosto, de 2018:

```bash
/scratch/g-assimila/data/datain/gfs/dominio/pa/2018
```

## Rodar o estudo de caso para domínio com centro em Santarém-PA
- O estudo de caso está localizado na seguinte pasta

  ```
  /scratch/g-assimila/sdbase/wrf-model/exemplo_wrf_pa
  ```

- Copiar a pasta para a área em sua conta

  ```bash
  $ cd $SCRATCH
  $ cp -r /scratch/g-assimila/sdbase/wrf-model/exemplo_wrf_pa/ .
  ```

- A estrutura de diretórios do exemplo

  ```bash
  exemplo_wrf_pa/
  ├── criardiretorios.sh
  ├── criarlinkgrib.sh
  ├── criarnamelist.sh
  ├── criarrodadas.sh
  ├── rodada_template
  │   ├── submitjob.sh
  │   ├── verificatempojob.sh
  │   ├── WPS
  │   └── WRF
  ├── submeterjobs.sh
  └── tudo_gassimila.sh
  ```

- Para criar as rodadas, utilizar o script `tudo_gassimila.sh`

  ```bash
  $ ./tudo_gassimila.sh 2018
  ```
  
  ***tudo_gassimila.sh***
  
  ```bash
  #!/bin/bash
  
  ano=${1}
  
  ./criardiretorios.sh ${ano}
  ./criarrodadas.sh ${ano}
  ./criarnamelist.sh ${ano}
  ./criarlinkgrib.sh ${ano}
  ```
  
- É criada a pasta `2018`, contendo rodadas configuras para cada dia do ano

  ```bash
  exemplo_wrf_pa
  ├── 2018
  │   ├── ABR
  │   ├── AGO
  │   ├── DEZ
  │   ├── FEV
  │   ├── JAN
  │   ├── JUL
  │   ├── JUN
  │   ├── MAI
  │   ├── MAR
  │   ├── NOV
  │   ├── OUT
  │   └── SET
  ├── criardiretorios.sh
  ├── criarlinkgrib.sh
  ├── criarnamelist.sh
  ├── criarrodadas.sh
  ├── rodada_template
  │   ├── submitjob.sh
  │   ├── verificatempojob.sh
  │   ├── WPS
  │   └── WRF
  ├── submeterjobs.sh
  ├── tudo_gassimila.sh
  ```

- Estrutura da pasta da rodada

  ```bash
  2018/
  ├── ABR
  │   ├── 01
  │   │   └── rodada
  │   │       ├── submitjob.sh
  │   │       ├── verificatempojob.sh
  │   │       ├── WPS
  │   │       └── WRF
  ```

- Para os meses de junho, julho e agosto, as rodadas estão prontas para serem executadas

  ```bash
  $ ls exemplo_wrf_pa/2018/JUN/01/rodada/WPS/
  2018          GRIBFILE.AAC  GRIBFILE.AAH  GRIBFILE.AAM  GRIBFILE.AAR  GRIBFILE.AAW   metgrid                ungrib.exe
  geogrid       GRIBFILE.AAD  GRIBFILE.AAI  GRIBFILE.AAN  GRIBFILE.AAS  GRIBFILE.AAX   metgrid.exe            Vtable
  geogrid.exe   GRIBFILE.AAE  GRIBFILE.AAJ  GRIBFILE.AAO  GRIBFILE.AAT  GRIBFILE.AAY   namelist.wps
  GRIBFILE.AAA  GRIBFILE.AAF  GRIBFILE.AAK  GRIBFILE.AAP  GRIBFILE.AAU  GRIBFILE.AAZ   namelist.wps.template
  GRIBFILE.AAB  GRIBFILE.AAG  GRIBFILE.AAL  GRIBFILE.AAQ  GRIBFILE.AAV  link_grib.csh  ungrib
  ```

  ```bash
  $ ls exemplo_wrf_pa/2018/JUN/01/rodada/WRF/run/
  aerosol.formatted                 CLM_ASM_ICE_DRC_DATA             ishmael-gamma-tab.bin       real.exe
  aerosol_lat.formatted             CLM_DRDSDT0_DATA                 ishmael-qi-qc.bin           RRTM_DATA
  aerosol_lon.formatted             CLM_EXT_ICE_DFS_DATA             ishmael-qi-qr.bin           RRTM_DATA_DBL
  aerosol_plev.formatted            CLM_EXT_ICE_DRC_DATA             kernels.asc_s_0_03_0_9      RRTMG_LW_DATA
  BROADBAND_CLOUD_GODDARD.bin       CLM_KAPPA_DATA                   kernels_z.asc               RRTMG_LW_DATA_DBL
  bulkdens.asc_s_0_03_0_9           CLM_TAU_DATA                     LANDUSE.TBL                 RRTMG_SW_DATA
  bulkradii.asc_s_0_03_0_9          co2_trans                        masses.asc                  RRTMG_SW_DATA_DBL
  CAM_ABS_DATA                      coeff_p.asc                      MPTABLE.TBL                 SOILPARM.TBL
  CAM_AEROPT_DATA                   coeff_q.asc                      namelist.input              SOILPARM.TBL_Kishne_2017
  CAMtr_volume_mixing_ratio.A1B     constants.asc                    namelist.input.template     tc.exe
  CAMtr_volume_mixing_ratio.A2      create_p3_lookupTable_1.f90      ndown.exe                   termvels.asc
  CAMtr_volume_mixing_ratio.RCP4.5  ETAMPNEW_DATA                    ozone.formatted             tr49t67
  CAMtr_volume_mixing_ratio.RCP6    ETAMPNEW_DATA_DBL                ozone_lat.formatted         tr49t85
  CAMtr_volume_mixing_ratio.RCP8.5  ETAMPNEW_DATA.expanded_rain      ozone_plev.formatted        tr67t85
  capacity.asc                      ETAMPNEW_DATA.expanded_rain_DBL  p3_lookup_table_1.dat-v4.1  URBPARM.TBL
  CCN_ACTIVATE.BIN                  GENPARM.TBL                      p3_lookup_table_2.dat-v4.1  URBPARM_UZE.TBL
  CLM_ALB_ICE_DFS_DATA              grib2map.tbl                     README.namelist             VEGPARM.TBL
  CLM_ALB_ICE_DRC_DATA              gribmap.txt                      README.rasm_diag            wind-turbine-1.tbl
  CLM_ASM_ICE_DFS_DATA              HLC.TBL                          README.tslist               wrf.exe
  ```

- Por exemplo, para rodar o WRF no dia 1 de junho de 2018

  ```bash
  $ cd exemplo_wrf_pa/2018/JUN/01/rodada/
  $ sbatch submitjob.sh
  ```

  ***submitjob.sh***

  ```bash
  #!/bin/bash
  #SBATCH --nodes=1                      #Numero de Nós
  #SBATCH --ntasks=24                    #Numero total de tarefas MPI
  #SBATCH -p cpu_dev                     #Fila (partition) a ser utilizada
  #SBATCH -J WRF                         #Nome job
  
  module load cmake/3.17.3
  module load python/3.8.2
  module load openmpi/gnu/4.1.2_gcc-9.3_ucx_1.12+cuda-11.12
  . /scratch/g-assimila/sdbase/spack/v0.17.1/share/spack/setup-env.sh
  export SPACK_USER_CONFIG_PATH=/scratch/g-assimila/sdbase/spack/.config/v0.17.1
  
  spack load --only dependencies wrf@4.2%gcc@9.3.0
  
  export LD_LIBRARY_PATH=/scratch/g-assimila/sdbase/usr/lib64:$LD_LIBRARY_PATH
  
  export WPS_DIR=$SLURM_SUBMIT_DIR/WPS
  export WRF_DIR=$SLURM_SUBMIT_DIR/WRF/run
  
  cd $WPS_DIR
  ./geogrid.exe
  ./ungrib.exe
  ./metgrid.exe
  #rm GRIBFILE* && rm FILE*
  
  cd $WRF_DIR
  ln -s $WPS_DIR/met_em* .
  export OMPI_MCA_mpi_cuda_support=0
  srun -n 1 ./real.exe
  srun -n $SLURM_NTASKS ./wrf.exe
  #rm met_em*
  gzip rsl.*
  ```

- Confome o cabeçaho do script SLURM, a execução é realizada em um nó (` --nodes=1`), com 24 processos MPI (`--ntasks=24`), e na fila cpu_dev (`-p cpu_dev`)

- Para acompanhar a rodada, usar o comando `squeue`

  ```bash
  $ squeue -u $USER
               JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
            10998545   cpu_dev      WRF roberto.  R       0:13      1 sdumont1207
  ```

- Para manter a saída em tela do comando `squeue`, pode-se combinar com o comando `watch`:

  ```bash
  $ watch squeue -u $USER
               JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
            10998545   cpu_dev      WRF roberto.  R       0:13      1 sdumont1207
  ```

  

- Ao final da execução do job, os seguintes arquivos devem ter sido gerados na pasta `WRF/run/ `:

  ```bash
  wrfbdy_d01
  wrfinput_d01
  wrfout_d01_2018-06-01_00:00:00
  wrfout_d01_2018-06-02_00:00:00
  wrfout_d01_2018-06-03_00:00:00
  ```

- A saída em tela da execução é armazenada em um arquivo com nome simalar a **slurm-10893601.out**, onde a numeração refere-se ao ID do job.

- A fim de verificar o tempo de execução do job, rodar o script **verificatempojob.sh**, tendo como parâmetro o ID do job

  ```bash
  $ ./verificatempojob.sh 10893601
     Elapsed
  ----------
    00:08:16
    00:08:16
    00:00:05
    00:06:52
  ```

  ***verificatempojob.sh***

  ```bash
  #!/bin/bash
  
  jobid=${1}
  
  sacct -j ${jobid} --format="elapsed"
  ```

- O tempo de execução é dado em *hora:minutos:seguntos*

- Para um pouco mais de detalhes sobre a execução

  ```bash
  $ sacct -j 10893601
         JobID    JobName  Partition    Account  AllocCPUS      State ExitCode
  ------------ ---------- ---------- ---------- ---------- ---------- --------
  10893601            WRF    cpu_dev g-assimila          1  COMPLETED      0:0
  10893601.ba+      batch            g-assimila          1  COMPLETED      0:0
  10893601.0     real.exe            g-assimila          1  COMPLETED      0:0
  10893601.1      wrf.exe            g-assimila          1  COMPLETED      0:0
  ```
