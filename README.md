# i915-nolvds
for use with x220 fhd mod, aka x320

It's really simple, instead of rebuilding your kernel every time there's an update, or being locked in to using just 1 kernel, now you can just rebuild this i915 against your own kernel headers.

```
sudo make # sudo because kernel-headers belong to root
sudo make install
reboot # so module can load
```
