#!/bin/bash

# print commands as they run
set -e
set -x

# run the probe to determine number size of the dataset
time srun -n 64 teca_temporal_reduction \
    --input_file era5_combined_dataset.mcf \
    --output_file mean_%t%.nc \
    --operator average --interval all \
    --verbose 1 \
    --point_arrays T VAR_2T SP


