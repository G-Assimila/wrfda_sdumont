#!/bin/sh
#
# this routine compares two grib2 files
# the files must have the same fields in the same order
#
set -x

# for wgrib2 v2.0.2+
wgrib2 $2 -var -lev -rpn "sto_1" -import_grib $1 -rpn "rcl_1:print_corr:print_rms" | \
grep -v "rpn_corr=1"
exit


# for older versions of wgrib2
#wgrib2 $1 -bin junk$$ >/dev/null
#wgrib2 $2 -var -lev -rpn "sto_1" -import_bin junk$$ -rpn "rcl_1:print_corr:print_rms" | \
#grep -v "rpn_corr=1"
#rm junk$$
#exit
