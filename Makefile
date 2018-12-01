LOCAL := $(shell pwd)
CKERNEL := "/usr/lib/modules/$(shell uname -r)"
DEPENDENCIES := nothing
default: build
.PHONY: install

build:
	echo Building $(LOCAL) using $(CKERNEL)/build
	cd $(CKERNEL)/build; \
			make M="$(LOCAL)/gpu/drm/i915"
	xz -z $(LOCAL)/gpu/drm/i915/i915.ko

install:
	# backup existing i915, and move the existing one to a .tmp
	# todo: if make errors, replace i915.ko.xz with the .tmp
	cd $(CKERNEL)/kernel/drivers/gpu/drm/i915; \
	if [ ! -f i915.ko.xz.lvds.bak ]; then \
			echo "No backup found!"; \
			cp i915.ko.xz i915.ko.xz.lvds.bak; \
			echo "Current i915.ko.xz backed up."; fi; \
    mv i915.ko.xz i915.ko.xz.tmp
	
	cp $(LOCAL)/gpu/drm/i915/i915.ko.xz \
			$(CKERNEL)/kernel/drivers/gpu/drm/i915/i915.ko.xz
	
	# rebuild initramfs if i915 should be included
	if grep -q i915 '/etc/mkinitcpio.conf'; then \
			mkinitcpio -P; \
    fi;
	
	echo "Done! Reboot to load the new i915 module."

#todo clean:
#todo all-kernels:
