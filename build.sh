#!/bin/bash

#save run path as module root
i915nolvds=$(pwd)

#cd to kernel headers on arch linux
cd /usr/lib/modules/$(uname -r)/build/

echo "make M=${i915nolvds}/drivers/gpu/drm/i915"
sudo make M="${i915nolvds}/drivers/gpu/drm/i915"

# make sure i915 isn't loadded, probably blacklist it...

#insmod $i915-nolvds/i915.ko
