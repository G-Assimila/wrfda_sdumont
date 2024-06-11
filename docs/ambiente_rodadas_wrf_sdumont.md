# Projeto G-Assimila no supercomputador Santos Dumont

## Acesso ao SDumont
Fazer login no SDumont

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

Os dados de condição de contorno são armazenadoS no seguinte diretório:

```bash
/scratch/g-assimila/data/datain/gfs/dominio/
```

Por exemplo, os dados de uma região no estado do Pará, no período compreendendo os meses de junho a agosto, de 2018:

```bash
/scratch/g-assimila/data/datain/gfs/dominio/pa/2018
```

## Rodar o estudo de caso para domínio com centro em Santarém-PA
- Baixar os scripts de criação das rodadas e de submissão dos jobs na área `SCRATCH` em sua conta

  ```bash
  $ cd $SCRATCH
  $ git clone https://github.com/G-Assimila/wrfda_sdumont.git
  ```

- A estrutura de diretórios do repositório baixado

  ```bash
  wrfda_sdumont/
  ├── ciclo00h
  │   └── wrfda_pa_santarem
  │       ├── criardiretorios.sh
  │       ├── criarlinkgrib.sh
  │       ├── criarnamelist.sh
  │       ├── criarrodadas.sh
  │       ├── rodada_template
  │       ├── submeterjobs.sh
  │       └── tudo_gassimila.sh
  ├── ciclo12h
  │   └── wrfda_pa_santarem
  │       ├── criardiretorios.sh
  │       ├── criarlinkgrib.sh
  │       ├── criarnamelist.sh
  │       ├── criarrodadas.sh
  │       ├── rodada_template
  │       ├── submeterjobs.sh
  │       └── tudo_gassimila.sh
  ├── docs
  │   └── ambiente_rodadas_wrf_sdumont.md (este arquivo)
  └── README.md
  ```

  Os diretórios `ciclo00h` e `ciclo12h` são relativos às rodadas com condição inicial às `00h` e `12h`, respectivamente.

- Por exemplo, para criar as rodadas com condição inicial às `00h`, utilizar o script `tudo_gassimila.sh`

  ```bash
  $ cd wrfda_sdumont/ciclo00h/wrfda_pa_santarem
  $ ./tudo_gassimila.sh 2016
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
  
- É criada a pasta `2016`, contendo rodadas configuras para cada dia do ano

  ```bash
  wrfda_sdumont/ciclo00h/wrfda_pa_santarem/2016
  ├── ABR
  ├── AGO
  ├── DEZ
  ├── FEV
  ├── JAN
  ├── JUL
  ├── JUN
  ├── MAI
  ├── MAR
  ├── NOV
  ├── OUT
  └── SET
  ```
  
- Estrutura da pasta da rodada

  ```bash
  wrfda_sdumont/ciclo00h/wrfda_pa_santarem/2016
  ├── JUN
  │   ├── 01
  │   │   └── rodada
  │   │       ├── OBSPROC
  │   │       ├── submitjob_da.template.sh
  │   │       ├── verificatempojob.sh
  │   │       ├── WPS
  │   │       ├── WRF
  │   │       └── WRFDA
  ```

- Para os meses de junho, julho e agosto, as rodadas estão prontas para serem executadas

- **WPS:**

  ```bash
  wrfda_sdumont/ciclo00h/wrfda_pa_santarem/2016/JUN/01/rodada/WPS
  ├── 2016 -> /scratch/g-assimila/data/datain/gfs/dominio/pa/2016
  ├── geogrid -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WPS/geogrid/
  ├── geogrid.exe -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WPS/geogrid/src/geogrid.exe
  ├── GRIBFILE.AAA -> ./2016/060100/gfs.0p25.2016060100.f000.grib2
  ├── GRIBFILE.AAB -> ./2016/060100/gfs.0p25.2016060100.f003.grib2
  ├── GRIBFILE.AAC -> ./2016/060100/gfs.0p25.2016060100.f006.grib2
  ├── GRIBFILE.AAD -> ./2016/060100/gfs.0p25.2016060100.f009.grib2
  ├── GRIBFILE.AAE -> ./2016/060100/gfs.0p25.2016060100.f012.grib2
  ├── GRIBFILE.AAF -> ./2016/060100/gfs.0p25.2016060100.f015.grib2
  ├── GRIBFILE.AAG -> ./2016/060100/gfs.0p25.2016060100.f018.grib2
  ├── GRIBFILE.AAH -> ./2016/060100/gfs.0p25.2016060100.f021.grib2
  ├── GRIBFILE.AAI -> ./2016/060100/gfs.0p25.2016060100.f024.grib2
  ├── GRIBFILE.AAJ -> ./2016/060100/gfs.0p25.2016060100.f027.grib2
  ├── GRIBFILE.AAK -> ./2016/060100/gfs.0p25.2016060100.f030.grib2
  ├── GRIBFILE.AAL -> ./2016/060100/gfs.0p25.2016060100.f033.grib2
  ├── GRIBFILE.AAM -> ./2016/060100/gfs.0p25.2016060100.f036.grib2
  ├── GRIBFILE.AAN -> ./2016/060100/gfs.0p25.2016060100.f039.grib2
  ├── GRIBFILE.AAO -> ./2016/060100/gfs.0p25.2016060100.f042.grib2
  ├── GRIBFILE.AAP -> ./2016/060100/gfs.0p25.2016060100.f045.grib2
  ├── GRIBFILE.AAQ -> ./2016/060100/gfs.0p25.2016060100.f048.grib2
  ├── GRIBFILE.AAR -> ./2016/060100/gfs.0p25.2016060100.f051.grib2
  ├── GRIBFILE.AAS -> ./2016/060100/gfs.0p25.2016060100.f054.grib2
  ├── GRIBFILE.AAT -> ./2016/060100/gfs.0p25.2016060100.f057.grib2
  ├── GRIBFILE.AAU -> ./2016/060100/gfs.0p25.2016060100.f060.grib2
  ├── GRIBFILE.AAV -> ./2016/060100/gfs.0p25.2016060100.f063.grib2
  ├── GRIBFILE.AAW -> ./2016/060100/gfs.0p25.2016060100.f066.grib2
  ├── GRIBFILE.AAX -> ./2016/060100/gfs.0p25.2016060100.f069.grib2
  ├── GRIBFILE.AAY -> ./2016/060100/gfs.0p25.2016060100.f072.grib2
  ├── link_grib.csh -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WPS/link_grib.csh
  ├── metgrid -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WPS/metgrid/
  ├── metgrid.exe -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WPS/metgrid/src/metgrid.exe
  ├── namelist.wps
  ├── namelist.wps.template
  ├── ungrib -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WPS/ungrib/
  ├── ungrib.exe -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WPS/ungrib/src/ungrib.exe
  └── Vtable -> ungrib/Variable_Tables/Vtable.GFS 
  ```


- **WRF:**

  ```bash
  wrfda_sdumont/ciclo00h/wrfda_pa_santarem/2016/JUN/01/rodada/WRF
  └── run
      ├── aerosol.formatted -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/aerosol.formatted
      ├── aerosol_lat.formatted -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/aerosol_lat.formatted
      ├── aerosol_lon.formatted -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/aerosol_lon.formatted
      ├── aerosol_plev.formatted -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/aerosol_plev.formatted
      ├── BROADBAND_CLOUD_GODDARD.bin -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/BROADBAND_CLOUD_GODDARD.bin
      ├── bulkdens.asc_s_0_03_0_9 -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/bulkdens.asc_s_0_03_0_9
      ├── bulkradii.asc_s_0_03_0_9 -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/bulkradii.asc_s_0_03_0_9
      ├── CAM_ABS_DATA -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/CAM_ABS_DATA
      ├── CAM_AEROPT_DATA -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/CAM_AEROPT_DATA
      ├── CAMtr_volume_mixing_ratio.A1B -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/CAMtr_volume_mixing_ratio.A1B
      ├── CAMtr_volume_mixing_ratio.A2 -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/CAMtr_volume_mixing_ratio.A2
      ├── CAMtr_volume_mixing_ratio.RCP4.5 -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/CAMtr_volume_mixing_ratio.RCP4.5
      ├── CAMtr_volume_mixing_ratio.RCP6 -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/CAMtr_volume_mixing_ratio.RCP6
      ├── CAMtr_volume_mixing_ratio.RCP8.5 -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/CAMtr_volume_mixing_ratio.RCP8.5
      ├── capacity.asc -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/capacity.asc
      ├── CCN_ACTIVATE.BIN -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/CCN_ACTIVATE.BIN
      ├── CLM_ALB_ICE_DFS_DATA -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/CLM_ALB_ICE_DFS_DATA
      ├── CLM_ALB_ICE_DRC_DATA -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/CLM_ALB_ICE_DRC_DATA
      ├── CLM_ASM_ICE_DFS_DATA -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/CLM_ASM_ICE_DFS_DATA
      ├── CLM_ASM_ICE_DRC_DATA -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/CLM_ASM_ICE_DRC_DATA
      ├── CLM_DRDSDT0_DATA -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/CLM_DRDSDT0_DATA
      ├── CLM_EXT_ICE_DFS_DATA -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/CLM_EXT_ICE_DFS_DATA
      ├── CLM_EXT_ICE_DRC_DATA -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/CLM_EXT_ICE_DRC_DATA
      ├── CLM_KAPPA_DATA -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/CLM_KAPPA_DATA
      ├── CLM_TAU_DATA -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/CLM_TAU_DATA
      ├── co2_trans -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/co2_trans
      ├── coeff_p.asc -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/coeff_p.asc
      ├── coeff_q.asc -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/coeff_q.asc
      ├── constants.asc -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/constants.asc
      ├── create_p3_lookupTable_1.f90 -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/create_p3_lookupTable_1.f90
      ├── ETAMPNEW_DATA -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/ETAMPNEW_DATA
      ├── ETAMPNEW_DATA_DBL -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/ETAMPNEW_DATA_DBL
      ├── ETAMPNEW_DATA.expanded_rain -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/ETAMPNEW_DATA.expanded_rain
      ├── ETAMPNEW_DATA.expanded_rain_DBL -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/ETAMPNEW_DATA.expanded_rain_DBL
      ├── GENPARM.TBL -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/GENPARM.TBL
      ├── grib2map.tbl -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/grib2map.tbl
      ├── gribmap.txt -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/gribmap.txt
      ├── HLC.TBL -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/HLC.TBL
      ├── ishmael-gamma-tab.bin -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/ishmael-gamma-tab.bin
      ├── ishmael-qi-qc.bin -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/ishmael-qi-qc.bin
      ├── ishmael-qi-qr.bin -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/ishmael-qi-qr.bin
      ├── kernels.asc_s_0_03_0_9 -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/kernels.asc_s_0_03_0_9
      ├── kernels_z.asc -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/kernels_z.asc
      ├── LANDUSE.TBL -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/LANDUSE.TBL
      ├── masses.asc -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/masses.asc
      ├── MPTABLE.TBL -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/MPTABLE.TBL
      ├── namelist.input
      ├── namelist.input.template
      ├── ndown.exe -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/ndown.exe
      ├── ozone.formatted -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/ozone.formatted
      ├── ozone_lat.formatted -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/ozone_lat.formatted
      ├── ozone_plev.formatted -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/ozone_plev.formatted
      ├── p3_lookup_table_1.dat-v4.1 -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/p3_lookup_table_1.dat-v4.1
      ├── p3_lookup_table_2.dat-v4.1 -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/p3_lookup_table_2.dat-v4.1
      ├── README.namelist -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/README.namelist
      ├── README.rasm_diag -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/README.rasm_diag
      ├── README.tslist -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/README.tslist
      ├── real.exe -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/real.exe
      ├── RRTM_DATA -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/RRTM_DATA
      ├── RRTM_DATA_DBL -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/RRTM_DATA_DBL
      ├── RRTMG_LW_DATA -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/RRTMG_LW_DATA
      ├── RRTMG_LW_DATA_DBL -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/RRTMG_LW_DATA_DBL
      ├── RRTMG_SW_DATA -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/RRTMG_SW_DATA
      ├── RRTMG_SW_DATA_DBL -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/RRTMG_SW_DATA_DBL
      ├── SOILPARM.TBL -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/SOILPARM.TBL
      ├── SOILPARM.TBL_Kishne_2017 -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/SOILPARM.TBL_Kishne_2017
      ├── tc.exe -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/tc.exe
      ├── termvels.asc -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/termvels.asc
      ├── tr49t67 -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/tr49t67
      ├── tr49t85 -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/tr49t85
      ├── tr67t85 -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/tr67t85
      ├── URBPARM.TBL -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/URBPARM.TBL
      ├── URBPARM_UZE.TBL -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/URBPARM_UZE.TBL
      ├── VEGPARM.TBL -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/VEGPARM.TBL
      ├── wind-turbine-1.tbl -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/wind-turbine-1.tbl
      └── wrf.exe -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRF/run/wrf.exe
  ```

- **OBSPROC:**

  ```bash
  wrfda_sdumont/ciclo00h/wrfda_pa_santarem/2016/JUN/01/rodada/OBSPROC/
  └── run
      ├── namelist.obsproc
      ├── namelist.obsproc.template
      ├── obserr.txt -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRFDA/var/obsproc/obserr.txt
      └── obsproc.exe -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRFDA/var/obsproc/obsproc.exe
  ```
  
- **WRFDA:**

  ```bash
  wrfda_sdumont/ciclo00h/wrfda_pa_santarem/2016/JUN/01/rodada/WRFDA/
  └── run
      ├── be.dat -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRFDA/var/run/be.dat.cv3
      ├── da_wrfvar.exe -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRFDA/var/build/da_wrfvar.exe
      ├── fg -> ../../WRF/run/wrfinput_d01
      ├── LANDUSE.TBL -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRFDA/run/LANDUSE.TBL
      ├── namelist.input
      ├── namelist.input.template
      ├── ob.ascii -> ../../OBSPROC/run/obs_gts_2016-06-01_00:00:00.3DVAR
      └── obsproc.exe -> /scratch/g-assimila/sdbase/wrf-model/v4.2/WRFDA/var/obsproc/obsproc.exe
  ```
  
  
  
- Por exemplo, para rodar o WRFDA no dia 2 de junho de 2016

  ```bash
  $ cd wrfda_sdumont/ciclo00h/wrfda_pa_santarem/2016/JUN/01/rodada/
  $ sbatch submitjob_da.sh
  Submitted batch job 11100698
  ```

  ***submitjob_da.sh***

  ```bash
  #!/bin/bash
  #SBATCH --nodes=1                      #Numero de Nós
  #SBATCH --ntasks=24                    #Numero total de tarefas MPI
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
  #srun -n $SLURM_NTASKS ./wrf.exe
  #rm met_em*
  gzip rsl.*
  
  cd $OBSPROC_DIR
  srun -n 1 \
  cat \
   /scratch/g-assimila/data/datain/rda.ucar.edu/ds351/little_r/2016/OBS:2016053118 \
   /scratch/g-assimila/data/datain/rda.ucar.edu/ds351/little_r/2016/OBS:2016060100 \
   /scratch/g-assimila/data/datain/rda.ucar.edu/ds351/little_r/2016/OBS:2016060106 \
   /scratch/g-assimila/julio.silva2/dados/obs/superficie/inmet/2016/SURFACE_OBS-INMET-BR-2016060100 \
   /scratch/g-assimila/data/datain/rda.ucar.edu/ds461/little_r/2016/SURFACE_OBS:2016053118 \
   /scratch/g-assimila/data/datain/rda.ucar.edu/ds461/little_r/2016/SURFACE_OBS:2016060100 \
   /scratch/g-assimila/data/datain/rda.ucar.edu/ds461/little_r/2016/SURFACE_OBS:2016060106 \
   >  ./OBS_2016060100
  srun -n 1 ./obsproc.exe
  
  cd $WRFDA_DIR
  srun -n 1 ./da_wrfvar.exe
  
  rm $OBSPROC_DIR/OBS_2016060100
  ```

- Confome o cabeçaho do script SLURM, a execução é realizada em um nó (` --nodes=1`), com 24 processos MPI (`--ntasks=24`), e na fila cpu_dev (`-p cpu_dev`)

- Para acompanhar a rodada, usar o comando `squeue`

  ```bash
  $ squeue --me
               JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
            11100698   cpu_dev      WRF roberto.  R       0:03      1 sdumont1311
  ```

- Para manter a saída em tela do comando `squeue`, pode-se combinar com o comando `watch`:

  ```bash
  $ watch squeue --me
               JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
            11100698   cpu_dev      WRF roberto.  R       0:03      1 sdumont1311
  ```

  

- Ao final da execução do job, os seguintes arquivos devem ter sido gerados:

  - na pasta `WRF/run/ ` (é realizada somente a execução de `./real`, o `./wrf.exe` não é executado:

    ```bash
    wrfbdy_d01
    wrfinput_d01
    ```
    
  - na pasta `OBSPROC/run`
  
    ```bash
    obs_gts_2016-06-01_00:00:00.3DVAR
    ```
  
  - na pasta `WRFDA/run`
  
    ```
    namelist.output.da
    qcstat_conv_01
    statistics
    wrfvar_output
    ```
  
- A saída em tela da execução é armazenada em um arquivo com nome similar a **slurm-11107751.out**, onde a numeração refere-se ao ID do job.

- A fim de verificar o tempo de execução do job, rodar o script **verificatempojob.sh**, tendo como parâmetro o ID do job

  ```bash
  $ ./verificatempojob.sh 11107751
         JobID    JobName    Elapsed  Partition    Account  AllocCPUS      State ExitCode
  ------------ ---------- ---------- ---------- ---------- ---------- ---------- --------
  11107751            WRF   00:04:52    cpu_dev g-assimila         24  COMPLETED      0:0
  11107751.ba+      batch   00:04:52            g-assimila         24  COMPLETED      0:0
  11107751.0   geogrid.e+   00:00:08            g-assimila         24  COMPLETED      0:0
  11107751.1   ungrib.exe   00:00:04            g-assimila         24  COMPLETED      0:0
  11107751.2   metgrid.e+   00:00:14            g-assimila         24  COMPLETED      0:0
  11107751.3     real.exe   00:00:09            g-assimila         24  COMPLETED      0:0
  11107751.4          cat   00:01:07            g-assimila         24  COMPLETED      0:0
  11107751.5   obsproc.e+   00:02:47            g-assimila         24  COMPLETED      0:0
  11107751.6   da_wrfvar+   00:00:11            g-assimila         24  COMPLETED      0:0
  ```

  ***verificatempojob.sh***

  ```bash
  #!/bin/bash
  
  jobid=${1}
  
  sacct -j ${jobid} --format="JobID, JobName, Elapsed, Partition, Account, AllocCPUS, State, ExitCode"
  ```  