#!/bin/bash

NDISP=''

if [ -z ${DISPLAY+x} ]; then
    NDISP=':0'
else 
    NDISP=$DISPLAY
fi

echo "Using DISPLAY $DISPLAY"

devices=( $(nvidia-smi -L | awk '{print $2}' | sed 's/.$//' | tr '\n' ' ') )
echo "Detected GPU devices $devices"

clock=100
mem=500
echo "Setting core to $clock and mem to $mem"

for id in "${devices[@]}"
do
    nvidia-settings -c $NDISP -a "[gpu:$id]/GPUFanControlState=1"
    nvidia-settings -c $NDISP -a "[fan:$id]/GPUTargetFanSpeed=100"
    nvidia-settings -c $NDISP -a "[gpu:$id]/GPUGraphicsClockOffset[3]=$clock"
    nvidia-settings -c $NDISP -a "[gpu:$id]/GPUMemoryTransferRateOffset[3]=$mem"
done

wait
