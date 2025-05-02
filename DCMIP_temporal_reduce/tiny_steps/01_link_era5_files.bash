#!/bin/bash

# combine all the ERA5 files into a single directory for easy access
# This script creates symbolic links to the ERA5 files in a specified directory.

LINK_DIR=era5_links/
mkdir -p ${LINK_DIR}

ERA5_BASE="/global/cfs/cdirs/m3522/cmip6/ERA5"

# set the variables to analyze
VARIABLES3D="128_131_u 128_132_v 128_130_t 128_129_z 128_133_q 128_157_r"
VARIABLEESFC="128_165_10u 128_166_10v 228_246_100u 228_247_100v 128_134_sp 128_151_msl 128_136_tcw 128_167_2t"
# getting error from "too many arguments" when linking all years at once, so 
# we will do it month-by-month
YEARS="2019"
MONTHS="12"


# error-out on any failure
set -e 

# surface variables
for var in $VARIABLEESFC
do
    for year in $YEARS
    do
        echo $year
        # link the files for each year-month
        for month in $MONTHS
        do
            echo $month
            ln -s ${ERA5_BASE}/e5.oper.an.sfc/*${year}${month}/*${var}*.nc ${LINK_DIR}
        done
    done
done

# 3D variables
for var in $VARIABLES3D
do
    for year in $YEARS
    do
        echo $year
        # link the files for each year-month
        for month in $MONTHS
        do
            echo $month
            ln -s ${ERA5_BASE}/e5.oper.an.pl/*${year}${month}/*${var}*.nc ${LINK_DIR}
        done
    done
done

# write the link directory name to the terminal for checking in the MCF file
echo 'Make sure that the `data_root` directory in the MCF file matches the directory below:'
echo `realpath $LINK_DIR`
