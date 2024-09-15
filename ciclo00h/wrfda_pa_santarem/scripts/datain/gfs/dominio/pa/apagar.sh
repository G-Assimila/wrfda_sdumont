#!/bin/bash
for i in 06 07 08; do
for ((j=1; j<=9; j++));	do

rm -fr ${i}0${j}/
done
done

for i in 06 07 08; do
for ((j=10; j<=31; j++));	do

rm -fr ${i}${j}/
done
done

#rm -r 0631

