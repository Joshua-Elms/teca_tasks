#!/bin/bash

# print commands as they run
set -e
set -x

# run the probe to determine number size of the dataset
time srun -n 64 teca_metadata_probe --input_file era5_combined_dataset.mcf

: 'Output
-----------------------------------
+ srun -n 64 teca_metadata_probe --input_file era5_combined_dataset.mcf
STATUS: [0:140666717777920] [/pscratch/sd/t/taobrien/TECA_superbuild/site/TECA_superbuild/build-gpu-develop-c3979b34/TECA-prefix/src/TECA/alg/teca_normalize_coordinates.cxx:665 5.0.0-313-gc3979b3]
STATUS: The y-axis will be transformed to be in ascending order.

A total of 2160 steps available. Using the gregorian calendar. Times are specified
in units of hours since 1900-01-01 00:00:00. The available times range from
2019-1-1 0:0:0 (1.04314e+06) to 2019-12-31 22:59:60 (1.0519e+06). The available
data contains: 1 years; 3 seasons; 12 months; 365 days;

Mesh dimension: 3D
Mesh coordinates: longitude, latitude, level
Mesh extents: 0, 1439, 0, 720, 0, 36
Mesh bounds: 0, 359.75, -90, 90, 1, 1000

18 data arrays available

  Id    Name         Type         Centering     Dimensions                            Shape                    
-------------------------------------------------------------------------------------------------------------
  1     MSL          NC_FLOAT     point 2D      [time, latitude, longitude]           [2160, 721, 1440]        
  2     Q            NC_FLOAT     point 3D      [time, level, latitude, longitude]    [2160, 37, 721, 1440]    
  3     R            NC_FLOAT     point 3D      [time, level, latitude, longitude]    [2160, 37, 721, 1440]    
  4     SP           NC_FLOAT     point 2D      [time, latitude, longitude]           [2160, 721, 1440]        
  5     T            NC_FLOAT     point 3D      [time, level, latitude, longitude]    [2160, 37, 721, 1440]    
  6     TCW          NC_FLOAT     point 2D      [time, latitude, longitude]           [2160, 721, 1440]        
  7     U            NC_FLOAT     point 3D      [time, level, latitude, longitude]    [2160, 37, 721, 1440]    
  8     V            NC_FLOAT     point 3D      [time, level, latitude, longitude]    [2160, 37, 721, 1440]    
  9     VAR_100U     NC_FLOAT     point 2D      [time, latitude, longitude]           [2160, 721, 1440]        
  10    VAR_100V     NC_FLOAT     point 2D      [time, latitude, longitude]           [2160, 721, 1440]        
  11    VAR_10U      NC_FLOAT     point 2D      [time, latitude, longitude]           [2160, 721, 1440]        
  12    VAR_10V      NC_FLOAT     point 2D      [time, latitude, longitude]           [2160, 721, 1440]        
  13    VAR_2T       NC_FLOAT     point 2D      [time, latitude, longitude]           [2160, 721, 1440]        
  14    Z            NC_FLOAT     point 3D      [time, level, latitude, longitude]    [2160, 37, 721, 1440]    
  15    latitude     NC_DOUBLE    point 1D      [latitude]                            [721]                    
  16    level        NC_DOUBLE    point 1D      [level]                               [37]                     
  17    longitude    NC_DOUBLE    point 1D      [longitude]                           [1440]                   
  18    time         NC_INT       point 0D      [time]                                [2160]                   


real    0m15.484s
user    0m0.045s
sys     0m0.053s
'