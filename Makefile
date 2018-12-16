DEPENDENCIES := nothing
default: i915.ko.xz
.PHONY: install

CKERNEL := "/usr/lib/modules/$(shell uname -r)"
CKERNELVERSION := $(shell uname -r | cut -d- -f1)
LOCALKERNEL := $(shell pwd)/linux
LOCALI915 := $(LOCALKERNEL)/drivers/gpu/drm/i915

clean:
	cd $(LOCALKERNEL); \
			find ./ -name "*.o" -delete; \
			find ./ -name "*.ko" -delete; \
			find ./ -name "*.ko.gz" -delete; \
			find ./ -name "*.rej" -delete
	make -C $(CKERNEL)/build M="$(LOCALI915)" clean

uninstall:
	if [ -f $(CKERNEL)/updates/i915.ko.xz ]; then \
			rm $(CKERNEL)/updates/i915.ko.xz; fi

update:
	# Clone torvald's repo
	if [ ! -d linux/ ]; then \
			git clone https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git linux; fi
	# Update, checkout current kernel, reset repo 
	cd linux; \
			git fetch; \
			git checkout v$(CKERNELVERSION); \
			git checkout .
	# Patch to allow building "out-of-tree"	
	patch --forward -p1 --directory=linux \
			< patches/i915-out-of-tree.patch
	# Patch to disable ghost LVDS display in i915 for x220/x230
	patch --forward -p1 --directory=linux \
			< patches/i915-no-lvds-multi.patch

# default target
i915.ko.xz: update clean
	echo Building $(LOCAL) using $(CKERNEL)/build
	make -C $(CKERNEL)/build M="$(LOCALI915)"
	xz -z $(LOCALI915)/i915.ko

install: uninstall
	# too easy, drop modded .ko.gz in /usr/lib/modules/`uname -r`/updates , depmod, build initram and reboot...
	if [ ! -d $(CKERNEL)/updates/ ]; then \
			mkdir $(CKERNEL)/updates; fi
		
	cp $(LOCALI915)/i915.ko.xz \
			$(CKERNEL)/updates/i915.ko.xz
		
	depmod
		
	if grep -q i915 '/etc/mkinitcpio.conf'; then \
		mkinitcpio -P; \
		fi;
	
	echo "Done! Reboot to load the new i915 module."




#todo all-kernels:
