# i915-nolvds
For use with x220/x230 nitrocaster or taobao fhd mod. If you want to disable LVDS ghost display in linux, this is what you want. 

It's really simple, instead of rebuilding your kernel every time there's an update, or being locked in to using just 1 kernel, now you can just rebuild this i915 against your own kernel headers.

Please make sure your kernel is up to date, and you've rebooted, this is because the makefile uses `uname -r` to check which kernel is running and installed. Pull requests to fix this or anything else are welcome.

```
sudo make # sudo because kernel-headers belong to root
sudo make install
reboot # so module can load
```

note: this was tested on arch linux, your mileage may vary.
