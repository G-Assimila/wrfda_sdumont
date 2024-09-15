#!/bin/bash

year=${1}

for i in 06 07 08; do
   for ((j=1; j<=9; j++));	do
      mkdir ${i}0${j}00
      cd ${i}0${j}00/
      echo "ln -sf ../gfs.0p25.${year}${i}0${j}00.f* ."
      ln -sf ../gfs.0p25.${year}${i}0${j}00.f* .
      cd ../
   done
done

for i in 06 07 08; do
   for ((j=10; j<=31; j++));	do
      mkdir ${i}${j}00
      cd ${i}${j}00/
      echo "ln -sf ../gfs.0p25.${year}${i}${j}00.f* ."
      ln -sf ../gfs.0p25.${year}${i}${j}00.f* .
      cd ../
   done
done

#rm -r 0631

