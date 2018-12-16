#!/bin/bash
# upgrade local i915 version from linux kernel

newkernel="~/src/linux"


for i in ../linux/drivers/gpu/drm/i915/*
do
        echo "$i"
done

#for file in $newkernel/drivers/platform/x86/

# enum files to upgrade
#for i in platform/*/* 
#do
#        echo "$i"
#done
#
#for i in gpu/*/*/* 
#do
#        echo "$i"
#done

# headers

