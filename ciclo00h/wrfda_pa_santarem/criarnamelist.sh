#!/bin/bash 
#
# Uso:
# ./criarramsin ano

ano=${1}

c1=`expr ${ano} % 4`
c2=`expr ${ano} % 100`
c3=`expr ${ano} % 400`
if [ $c1 -eq 0 ];then
   if [ $c2 -ne 0 ];then
      echo "Eh bissexto!"
      DD=('00' '31' '29' '31' '30' '31' '30' '31' '31' '30' '31' '30' '31')
   fi
   if [ $c3 -eq 0 ];then
      echo "Eh bissexto!"
      DD=('00' '31' '29' '31' '30' '31' '30' '31' '31' '30' '31' '30' '31')
   fi
else
   echo "Não é bissexto!"
   DD=('00' '31' '28' '31' '30' '31' '30' '31' '31' '30' '31' '30' '31')
fi 

mesprevnum=('000' '01' '02' '03' '04' '05' '06' '07' '08' '09' '10' '11' '12')
mesprev=('MMM' 'JAN' 'FEV' 'MAR' 'ABR' 'MAI' 'JUN' 'JUL' 'AGO' 'SET' 'OUT' 'NOV' 'DEZ')
diaprev=('00' '01' '02' '03' '04' '05' '06' '07' '08' '09' '10' '11' '12' '13' '14' '15' '16' '17' '18' '19' '20' '21' '22' '23' '24' '25' '26' '27' '28' '29' '30' '31')

for (( mes=6;mes<=8;mes++ )); do
    for (( dia=1;dia<=DD[${mes}];dia++ )); do
       dir=./${ano}/${mesprev[${mes}]}/${diaprev[${dia}]}/rodada/WPS
       if [ -d ${dir} ]; then
          echo "${dir}"
          sed 's/ANO/'${ano}'/g' ${dir}/namelist.wps.template | sed 's/MES/'${mesprevnum[${mes}]}'/g' | sed 's/DIAINI/'${diaprev[${dia}]}'/g' | sed 's/DIAFIM/'${diaprev[$((${dia}+2))]}'/g'  > ${dir}/namelist.wps
       fi
       dir=./${ano}/${mesprev[${mes}]}/${diaprev[${dia}]}/rodada/WRF/run
       if [ -d ${dir} ]; then
          echo "${dir}"
          sed 's/ANO/'${ano}'/g' ${dir}/namelist.input.template | sed 's/MES/'${mesprevnum[${mes}]}'/g' | sed 's/DIAINI/'${diaprev[${dia}]}'/g' | sed 's/DIAFIM/'${diaprev[$((${dia}+2))]}'/g'  > ${dir}/namelist.input
       fi
       dir=./${ano}/${mesprev[${mes}]}/${diaprev[${dia}]}/rodada/OBSPROC/run
       if [ -d ${dir} ]; then
          echo "${dir}"
          sed 's/ANO/'${ano}'/g' ${dir}/namelist.obsproc.template | sed 's/MES/'${mesprevnum[${mes}]}'/g' | sed 's/DIAINI/'${diaprev[${dia}]}'/g'  > ${dir}/namelist.obsproc
          sed 's/ANO/'${ano}'/g' ./${ano}/${mesprev[${mes}]}/${diaprev[${dia}]}/rodada/submitjob_da.template.sh | sed 's/MES/'${mesprevnum[${mes}]}'/g' | sed 's/DIAINI/'${diaprev[${dia}]}'/g'  > ./${ano}/${mesprev[${mes}]}/${diaprev[${dia}]}/rodada/submitjob_da.sh
#          cat  /scratch/g-assimila/data/datain/rda.ucar.edu/ds351/little_r/${ano}/OBS:${ano}${mesprevnum[${mes}]}${diaprev[${dia}]}12 \
#               /scratch/g-assimila/data/datain/rda.ucar.edu/ds461/little_r/${ano}/SURFACE_OBS:${ano}${mesprevnum[${mes}]}${diaprev[${dia}]}12 \
#            >  /scratch/g-assimila/data/datain/rda.ucar.edu/rda/little_r/${ano}/OBS_${ano}${mesprevnum[${mes}]}${diaprev[${dia}]}12
#          ln  -sf /scratch/g-assimila/data/datain/rda.ucar.edu/rda/little_r/${ano}/OBS_${ano}${mesprevnum[${mes}]}${diaprev[${dia}]}12 ${dir}/OBS_${ano}${mesprevnum[${mes}]}${diaprev[${dia}]}12
       fi
       dir=./${ano}/${mesprev[${mes}]}/${diaprev[${dia}]}/rodada/WRFDA/run
       if [ -d ${dir} ]; then
          echo "${dir}"
          sed 's/ANO/'${ano}'/g' ${dir}/namelist.input.template | sed 's/MES/'${mesprevnum[${mes}]}'/g' | sed 's/DIAINI/'${diaprev[${dia}]}'/g' | sed 's/DIAFIM/'${diaprev[$((${dia}+1))]}'/g'  > ${dir}/namelist.input
          ln -sf  ../../OBSPROC/run/obs_gts_${ano}-${mesprevnum[${mes}]}-${diaprev[${dia}]}_12\:00\:00.3DVAR ${dir}/ob.ascii
       fi
   done
done


