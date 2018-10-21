# i915-nolvds
for use with x220 fhd mod, aka x320

example:
```
i915-nolvds="/home/somepath/i915-nolvds/drivers/gpu/drm/i915"
cd /usr/lib/modules/$(uname -r)/build/
make M="$i915-nolvds"

# make sure i915 isn't loadded, probably blacklist it...

insmod $i915-nolvds/i915.ko

```
