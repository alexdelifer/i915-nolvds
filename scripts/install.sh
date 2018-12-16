#!/bin/bash

#save run path as module root
i915nolvds="$(pwd)"

#cd to kernel headers on arch linux
cd /usr/lib/modules/$(uname -r)/kernel/drivers/gpu/drm/i915

if [ ! -f i915.ko.xz.lvds.bak ]; then
        echo "Backup not Found!"
        mv i915.ko.xz i915.ko.xz.lvds.bak
        echo "i915.ko.xz backup to to i915.ko.xz.lvds.bak"
fi
rm i915.ko.xz
cp ${i915nolvds}/gpu/drm/i915/i915.ko ./i915.ko
xz -z ./i915.ko

if grep -q i915 "/etc/mkinitcpio.conf"; then
        mkinitcpio -P
fi

echo "Done!"

#echo "make M=${i915nolvds}/gpu/drm/i915"
#sudo make M="${i915nolvds}/gpu/drm/i915"

# make sure i915 isn't loadded, probably blacklist it...

#insmod $i915-nolvds/i915.ko
