# i915-nolvds
For use with x220/x230 nitrocaster or taobao fhd mod. If you want to disable LVDS ghost display in linux, this is what you want. 

It's really simple, instead of rebuilding your kernel every time there's an update, or being locked in to using just 1 kernel, now you can just rebuild this i915 against your own kernel headers.

Please make sure your kernel is up to date, and you've rebooted, this is because the makefile uses `uname -r` to check which kernel is running and installed. Pull requests to fix this or anything else are welcome.

```
sudo make # sudo because kernel-headers belong to root
sudo make install
reboot # so module can load
```
How do I know it worked?
``` 
$ dmesg | grep i915
[    1.150666] i915: loading out-of-tree module taints kernel.
```

You don't like it? No problem.
```
sudo make uninstall
```

note: this was tested on arch linux on a taobao x220, your mileage may vary.
