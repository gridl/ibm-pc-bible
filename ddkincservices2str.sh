#!/bin/bash
#
# Example script to take INT13.INC and dump all INT13_Service enumerations
#file=/mnt/main/emu/win31ddk/DDK/386/include/int13.inc
#file=~/Downloads/x/ddk95/Inc32/INT13.INC
#file=~/Downloads/win98ddk/98ddk/inc/win98/INT13.INC
file=~/Downloads/winmeddk/NTDDK/inc/win_me/int13.inc
count=0

ver="4.90+"
device=0x0020

grep -R "Int13_Service" $file | cut -d $'\t' -f 2 | cut -d ',' -f 1 | sed -e 's/\x0D//g' | sed -e "s/Int13_Service *//" | while read X; do
    counth=`printf '%-8s %04XH %04XH  %s' "$ver" $device $count "$X"`;
    echo "$counth"
    count=$(($count+1))
done

