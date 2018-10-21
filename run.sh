#!/bin/bash

#save run path as module root
i915nolvds=$(pwd)

echo "insmod ${i915nolvds}/gpu/drm/i915/i915.ko"

# make sure i915 isn't loadded, probably blacklist it...

sudo insmod ${i915nolvds}/gpu/drm/i915/i915.ko
