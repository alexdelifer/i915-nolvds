# i915-nolvds

I bricked by laptop flashing coreboot :( I don't use this anymore. Good luck!

For use with x220/x230 nitrocaster or K.K. fhd mod. If you want to disable LVDS ghost display in linux, this is what you want. 

It's really simple, instead of rebuilding your kernel every time there's an update, or being locked in to using just 1 kernel, now you can just rebuild this i915 against your own kernel headers.

There's two ways you can install this, DKMS or just plain make. To use dkms, you must have it installed.

### DKMS

```
sudo ./dkms-install.sh
reboot # so module can load
```

### Make
```
make
sudo make install
reboot # so module can load
```
## Did it load?
How do I know it worked?

You won't have an unreachable first monitor, but you can run this to be sure.
``` 
$ dmesg | grep i915
[    1.150666] i915: loading out-of-tree module taints kernel.
```
## Uninstalling

Don't like it? No problem.

### DKMS
```
sudo ./dkms-remove.sh
```

### Make
```
sudo make uninstall
```

Note: This was tested on Arch Linux on a K.K. X220 from Taobao, your mileage may vary.
