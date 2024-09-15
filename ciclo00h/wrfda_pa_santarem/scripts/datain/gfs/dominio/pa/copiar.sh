#!/bin/bash

DIRORIG=/scratch/g-assimila/data/datain/gfs/dominio/pa
for j in $(cat files.txt);do
    cp $DIRORIG/${j} .
done
