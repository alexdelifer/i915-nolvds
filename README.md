# i915-nolvds
For use with x220/x230 nitrocaster or taobao fhd mod. If you want to disable LVDS ghost display in linux, this is what you want. 

It's really simple, instead of rebuilding your kernel every time there's an update, or being locked in to using just 1 kernel, now you can just rebuild this i915 against your own kernel headers.

Please make sure your kernel is up to date, and you've rebooted, this is because the makefile uses `uname -r` to check which kernel is running and installed. Pull requests to fix this or anything else are welcome.

```
sudo make
# this will download the linux kernel source code git repo, about 1.28 gb... sorry.
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
Q: Why does this download the entire linux git repo?

A: Because it makes it easy to `git fetch` and `git checkout v4.20.0` or whatever new kernel version is out. Then I just repatch it and we're back in action. If anybody cares, I have a version that downloads a tar.xz from kernel.org and uses that, but I prefer this method.  

Note: This was tested on Arch Linux on a Taobao X220, your mileage may vary.
