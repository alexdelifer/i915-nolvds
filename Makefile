DEPENDENCIES := nothing
default: i915.ko.xz
.PHONY: install

CKERNEL := "/usr/lib/modules/$(shell uname -r)"
CKERNELVERSION := $(shell uname -r | cut -d- -f1)
LOCALKERNEL := $(shell pwd)/linux-$(CKERNELVERSION)
LOCALI915 := $(LOCALKERNEL)/drivers/gpu/drm/i915

clean:
	cd $(LOCALKERNEL); \
			find ./ -name "*.o" -delete; \
			find ./ -name "*.ko" -delete; \
			find ./ -name "*.ko.gz" -delete; \
			find ./ -name "*.rej" -delete
	make -C $(CKERNEL)/build M="$(LOCALI915)" clean

update:
	if [ ! -d linux-$(CKERNELVERSION)/ ]; then \
			wget https://mirrors.edge.kernel.org/pub/linux/kernel/v4.x/linux-$(CKERNELVERSION).tar.xz; \
			echo "Extracting, please wait..."; \
			tar xf linux-$(CKERNELVERSION).tar.xz; \
			rm linux-$(CKERNELVERSION).tar.xz; \
			# allows building out-of-tree
			patch --forward -p1 --directory=linux-$(CKERNELVERSION) \
			< patches/i915-out-of-tree.patch; \
			# switch eDP-3 with LVDS for modded thinkpads
			patch --forward -p1 --directory=linux-$(CKERNELVERSION) \
			< patches/i915-no-lvds.patch; \
			fi

i915.ko.xz: clean update
	echo Building $(LOCAL) using $(CKERNEL)/build
	make -C $(CKERNEL)/build M="$(LOCALI915)"
	xz -z $(LOCALI915)/i915.ko

install:
	cd $(CKERNEL)/kernel/drivers/gpu/drm/i915; \
	if [ ! -f i915.ko.xz.lvds.bak ]; then \
			echo "No backup found!"; \
			cp i915.ko.xz i915.ko.xz.lvds.bak; \
			echo "Current i915.ko.xz backed up."; fi; \
    mv i915.ko.xz i915.ko.xz.tmp
	
	cp $(LOCALI915)/i915.ko.xz \
			$(CKERNEL)/kernel/drivers/gpu/drm/i915/i915.ko.xz
	
	# rebuild initramfs if i915 should be included
	if grep -q i915 '/etc/mkinitcpio.conf'; then \
			mkinitcpio -P; \
    fi;
	
	echo "Done! Reboot to load the new i915 module."

#todo all-kernels:
