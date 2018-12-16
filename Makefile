DEPENDENCIES := nothing
default: i915
.PHONY: install
.SILENT: clean uninstall patch download install i915

CKERNEL := "/usr/lib/modules/$(shell uname -r)"
CKERNELVERSION := $(shell uname -r | cut -d- -f1)
# 4.14.8
LOCALKERNEL := $(shell pwd)/linux-$(CKERNELVERSION)
# ./linux-4.14.8
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
			rm $(CKERNEL)/updates/i915.ko.xz; \
			fi
	rmdir $(CKERNEL)/updates || \
			echo "$(CKERNEL) Not Empty!"; \
			ls -lah $(CKERNEL)/updates/ || \
			echo "Nothing to uninstall!"

download:
	if [ ! -d $(LOCALKERNEL)/ ]; then \
			git clone --depth=1 --branch v$(CKERNELVERSION) \
				https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git $(LOCALKERNEL); \
				fi

patch: download
	# Patch to allow building "out-of-tree"	
	patch --forward -p1 --directory=linux-$(CKERNELVERSION) \
			< patches/i915-out-of-tree.patch || \
			echo "Already patched."
	# Patch to disable ghost LVDS display in i915 for x220/x230
	patch --forward -p1 --directory=linux-$(CKERNELVERSION) \
			< patches/i915-no-lvds-multi.patch || \
			echo "Already patched"

# default target
i915: patch clean
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
