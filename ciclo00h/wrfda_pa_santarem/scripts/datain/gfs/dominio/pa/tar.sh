#!/bin/bash

for j in $(cat files000.txt);do
    echo "tar xvf $j"
    tar xvf $j
done
