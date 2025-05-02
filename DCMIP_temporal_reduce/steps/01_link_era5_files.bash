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
YEARS="
1979 1980 1981 1982 1983 1984 
1985 1986 1987 1988 1989 1990 
1991 1992 1993 1994 1995 1996 
1997 1998 1999 2000 2001 2002 
2003 2004 2005 2006 2007 2008
2009 2010 2011 2012 2013 2014
2015 2016 2017 2018 2019"
MONTHS="01 02 03 04 05 06 07 08 09 10 11 12"

# error-out on any failure
set -e 

# surface variables
for var in $VARIABLEESFC
do
    echo $var
    for yearmonth in $YEARMONTHS
    do
        echo $yearmonth
        # link the files for each yearmonth
        ln -s ${ERA5_BASE}/e5.oper.an.sfc/*${yearmonth}/*${var}*.nc ${LINK_DIR}
    done
done

# 3D variables
for var in $VARIABLES3D
do
    echo $var
    for yearmonth in $YEARMONTHS
    do
        echo $yearmonth
        # link the files for each yearmonth
        ln -s ${ERA5_BASE}/e5.oper.an.pl/*${yearmonth}/*${var}*.nc ${LINK_DIR}
    done
done

# write the link directory name to the terminal for checking in the MCF file
echo 'Make sure that the `data_root` directory in the MCF file matches the directory below:'
echo `realpath $LINK_DIR`
