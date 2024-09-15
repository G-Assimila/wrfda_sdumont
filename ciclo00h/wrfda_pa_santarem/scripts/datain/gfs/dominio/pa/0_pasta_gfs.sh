#!/bin/bash
for i in 06 07 08; do
for ((j=1; j<=9; j++));	do

mkdir ${i}0${j}
cp -p gfs.0p25.2018${i}0${j}00.f* ${i}0${j}
done
done

for i in 06 07 08; do
for ((j=10; j<=31; j++));	do

mkdir ${i}${j}
cp -p gfs.0p25.2018${i}${j}00.f* ${i}${j}
done
done

#rm -r 0631

