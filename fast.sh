#!/bin/bash

devices=( $(nvidia-smi -L | awk '{print $2}' | sed 's/.$//' | tr '\n' ' ') )
echo "Detected GPU devices $devices"

clock=100
mem=500
echo "Setting core to $clock and mem to $mem"

for id in "${devices[@]}"
do
    nvidia-settings -a "[gpu:$id]/GPUFanControlState=1"
    nvidia-settings -a "[fan:$id]/GPUTargetFanSpeed=88"
    nvidia-settings -a "[gpu:$id]/GPUGraphicsClockOffset[3]=$clock"
    nvidia-settings -a "[gpu:$id]/GPUMemoryTransferRateOffset[3]=$mem"
done

wait
