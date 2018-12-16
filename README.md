# i915-nolvds
For use with x220/x230 nitrocaster or taobao fhd mod. If you want to disable LVDS ghost display in linux, this is what you want. 

It's really simple, instead of rebuilding your kernel every time there's an update, or being locked in to using just 1 kernel, now you can just rebuild this i915 against your own kernel headers.

Please make sure your kernel is up to date, and you've rebooted, this is because the makefile uses `uname -r` to check which kernel is running and installed. Pull requests to fix this or anything else are welcome.

```
make
sudo make install
reboot # so module can load
```
Q: How do I know it worked?

A: You'll know, but you can run this to be sure.
``` 
$ dmesg | grep i915
[    1.150666] i915: loading out-of-tree module taints kernel.
```
Q: I don't like it. 

A: No problem.
```
sudo make uninstall
```

Note: This was tested on Arch Linux on a Taobao X220, your mileage may vary.
