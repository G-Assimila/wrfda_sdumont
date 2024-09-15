#!/bin/bash
for i in 06 07 08; do
   for ((j=1; j<=9; j++));	do
      cd ${i}0${j}/
      rm ./gfs.0p25.2018${i}0${j}00.f000.grib2 
      cd ../
   done
done

for i in 06 07 08; do
   for ((j=10; j<=31; j++));	do
      cd ${i}${j}/
      rm ./gfs.0p25.2018${i}0${j}00.f000.grib2 
      cd ../
   done
done

#rm -r 0631

