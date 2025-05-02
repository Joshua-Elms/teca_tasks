Alright this is a bit complicated, let's talk about what I set out to do and what I've accomplished. 

Goal: Compute the ERA5 1979-2019 DJF 0z mean for each variable in SFNO

Steps: 
1. Activate `teca` (see repo README). Request an interactive GPU node on perlmutter. 
2. Link all files into one place (`01_link_era5_files.bash`). This helps with... something? Not entirely sure, but it's definitely easier to organize subsequent steps if all the ERA5 data you'll be working with is pseudo-aggregated into one dir. Also probably a good way to filter data so that TECA doesn't have to look at so much. 
3. Probed metadata (`02_metadata_probe.bash`). This shows a readout of the entire dataset you linked into the previous folder, or at least the variables you ask it to show. I had to construct an .mcf file (`era5_combined_dataset.mcf`) first to actually run this command, which made it a bit simpler and helped keep the details separate. 
4. Computed the mean (`03_temporal_reduction.bash`). This one is also complicated, but we'll talk through the cmd line options I included ([docs](https://teca.readthedocs.io/en/latest/applications.html#teca-temporal-reduction)):
    1. `--input_file era5_combined_dataset.mcf` - same as step 3, outlines the data for TECA. 
    2. `--output_file mean_%t%.nc` - path to output, %t% is first timestep of output
    3. `--operator average` - take the mean
    4. `--interval all` - condense all timesteps into one
    5. `--time_index_file keep_times.txt` - integer `time` values over which this should be applied
    6. `--point_arrays T VAR_2T MSL <more>` - all variable names to operate on

Status -- errrrrm message just errored out at literally every step for the entire time, but that's cause I only provided like 3 timesteps for it to take the mean over... probably too limited

ToDo: 
1. Use TECA CF Restripe to a) subset down to 13 levels and b) subset down to 00z only, then
2. Pass output from restripe into teca_temporal_reduction