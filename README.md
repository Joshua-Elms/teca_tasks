This is just a collection of random TECA jobs I have to run on Perlmutter, BigRed, or anywhere else.

Here are the instructions from Travis to activate TECA on Perlmutter: 
```
module use /global/common/software/m1517/teca/perlmutter_gpu/develop/modulefiles/
module load teca
``` 

Interactive jobs for testing a TECA pipeline can be requested with:
```
salloc --nodes 1 --qos interactive --time 01:00:00 --constraint gpu --gpus 4 --account m1517
```

To reattach to a running job node, try one of: 
```
sattach <jobid>.0
# or
srun --pty --overlap --jobid <jobid> bash
```