#!/bin/bash
#
# Example script to take IFSMGR.INC and dump all IFSMgr_Service enumerations
#file=/mnt/main/emu/win31ddk/DDK/386/include/ifsmgr.inc
#file=~/Downloads/x/ddk95/Inc32/IFSMGR.INC
#file=~/Downloads/win98ddk/98ddk/inc/win98/IFSMGR.INC
file=~/Downloads/winmeddk/NTDDK/inc/win_me/ifsmgr.inc
count=0

ver="4.90+"
device=0x0040

grep -R "IFSMgr_Service" $file | sed "s/^[\t ]*//" | sed "s/[\t ]\+/"$'\t'"/g" | cut -d $'\t' -f 2 | cut -d ',' -f 1 | sed -e 's/\x0D//g' | sed -e "s/IFSMgr_Service *//" | while read X; do
    counth=`printf '%-8s %04XH %04XH  %s' "$ver" $device $count "$X"`;
    echo "$counth"
    count=$(($count+1))
done

