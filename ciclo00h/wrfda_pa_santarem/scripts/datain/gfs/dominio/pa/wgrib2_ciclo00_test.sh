#!/bin/bash

year=${1}
dirIN=/scratch/g-assimila/data/datain/rda.ucar.edu/ds084.1/ciclo00/${year}
dirOUT=/scratch/g-assimila/data/datain/gfs/dominio/pa/compare/${year}_system

dirWORK=$PWD
cd ${dirIN}
ls -A1 *.grib2 > ${dirWORK}/files.txt
cd ${dirWORK}

for j in $(cat files.txt);do
    #wgrib2 gfs.0p25.2016062200.f000.grib2 -small_grib -60:-50 -7:2 gfs.0p25.2016062200.f000.new2.grib2
    echo "wgrib2 ${dirIN}/${j} -small_grib -60:-50 -7:2 ${dirOUT}/${j}"
    wgrib2 ${dirIN}/${j} -small_grib -60:-50 -7:2 ${dirOUT}/${j}
done

