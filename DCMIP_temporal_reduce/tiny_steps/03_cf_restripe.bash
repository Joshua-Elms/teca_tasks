#!/bin/bash

# print commands as they run
set -e
set -x

# set output directory
data_root_out=$SCRATCH/teca_data/DCMIP_temporal_reduce
mkdir -p ${data_root_out}

VARIABLES3D="U V T Z Q R"
VARIABLESSFC="VAR_10U VAR_10V VAR_100U VAR_100V SP MSL TCW VAR_2T"
plevs_mb=(1000 925 850 700 600 500 400 300 250 200 150 100 50)

let n=${#plevs_mb[@]}-1
for i in `seq 0 $n`
do
    let plev_mb=${plevs_mb[${i}]}
    f_out=${plev_mb}

    echo "====================================================="
    echo "slicing 3d vars at ${plev_mb} mb"
    echo "====================================================="

    time srun -n 4                                                                                           \
        teca_cf_restripe                                                                                                    \
        --input_file era5_combined_dataset.mcf                                                                              \
        --regrid --dims 1440 721 1 --bounds 0 359.75 90 -90 ${plev_mb} ${plev_mb}                                                   \
        --output_file "${data_root_out}/pl/3d_vars_${plev_mb}hPa_%t%.nc" \
        --point_arrays ${VARIABLES3D} --file_layout yearly

done