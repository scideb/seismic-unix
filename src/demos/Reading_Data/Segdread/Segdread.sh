#! /bin/sh


# SU must be installed with the XDR flag set
inputdata=3stomp_test.segd
outfile=temp.su

segdread tape=$inputdata verbose=1 ptmax=2 buff=0 aux=1 use_stdio=1 > $outfile


surange < $outfile

suxwigb < $outfile title="3 Stomp test (segd)" &

supswigb < $outfile title="3 Stomp test (segd)" > 3stomp_test.eps



# Sercel test. 
# Note, the sercel.segd file has the values of FFFFFFF for the second
# trace. This is not a number (NaN), so the output through sunan is 
# performed.

inputdata=sercel.segd
outfile=sercel_temp.su

segdread tape=$inputdata verbose=1 ptmax=2 buff=0 aux=1 use_stdio=1 |
sunan verbose=0 >  $outfile

surange < $outfile

suxwigb < $outfile title="Sercel Test" perc=95  &

supswigb < $outfile title="Sercel Test" perc=95 > sercel_test.eps

exit 0
