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
DIRROOT=$PWD
for (( mes=6;mes<=8;mes++ )); do
       dir=${DIRROOT}/${ano}/${mesprev[${mes}]}
       if [ -d ${dir} ]; then
          cd ${dir}
          echo "ln -sf /scratch/g-assimila/data/datain/genbe/dominio/pa/santarem/${ano}_${mesprev[${mes}]}.dat be.dat"
          ln -sf /scratch/g-assimila/data/datain/genbe/dominio/pa/santarem/${ano}_${mesprev[${mes}]}.dat be.dat
       fi
done
cd ${DIRROOT}

