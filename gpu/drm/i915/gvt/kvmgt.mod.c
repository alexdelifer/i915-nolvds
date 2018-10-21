#include <linux/module.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

MODULE_INFO(vermagic, VERMAGIC_STRING);
MODULE_INFO(name, KBUILD_MODNAME);

__visible struct module __this_module
__attribute__((section(".gnu.linkonce.this_module"))) = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};

#ifdef RETPOLINE
MODULE_INFO(retpoline, "Y");
#endif

static const struct modversion_info ____versions[]
__used
__attribute__((section("__versions"))) = {
	{ 0x79fd9982, "module_layout" },
	{ 0x2d3385d3, "system_wq" },
	{ 0x1681e08a, "kmalloc_caches" },
	{ 0x2ae4273f, "kvm_get_kvm" },
	{ 0x1ed8b599, "__x86_indirect_thunk_r8" },
	{ 0x301fa007, "_raw_spin_unlock" },
	{ 0xdf0f75c6, "eventfd_signal" },
	{ 0x5b858555, "mdev_set_drvdata" },
	{ 0x81fd20d9, "__srcu_read_unlock" },
	{ 0x3a7b1c6c, "kvm_read_guest" },
	{ 0x981a7d68, "vfio_unregister_notifier" },
	{ 0xdf566a59, "__x86_indirect_thunk_r9" },
	{ 0xad27f361, "__warn_printk" },
	{ 0x9b7fe4d4, "__dynamic_pr_debug" },
	{ 0x6729d3df, "__get_user_4" },
	{ 0xc29957c3, "__x86_indirect_thunk_rcx" },
	{ 0xad0d12ed, "mdev_unregister_device" },
	{ 0x54f4fd00, "mdev_dev" },
	{ 0xa6093a32, "mutex_unlock" },
	{ 0x999e8297, "vfree" },
	{ 0x11104392, "mdev_register_device" },
	{ 0xb348a850, "ex_handler_refcount" },
	{ 0x97651e6c, "vmemmap_base" },
	{ 0x91715312, "sprintf" },
	{ 0xf1d803b8, "mdev_get_drvdata" },
	{ 0x6c28be5a, "vfio_info_add_capability" },
	{ 0x16fdbac8, "vfio_register_notifier" },
	{ 0xece784c2, "rb_first" },
	{ 0xd9a5ea54, "__init_waitqueue_head" },
	{ 0xb44ad4b3, "_copy_to_user" },
	{ 0xf1c9fddf, "current_task" },
	{ 0xeb7e8797, "debugfs_create_ulong" },
	{ 0xa22f98fc, "kvm_slot_page_track_add_page" },
	{ 0x9a76f11f, "__mutex_init" },
	{ 0x27e1a049, "printk" },
	{ 0x3b3a235a, "vfio_device_get_from_dev" },
	{ 0xd67364f7, "eventfd_ctx_fdget" },
	{ 0x4c9d28b0, "phys_base" },
	{ 0xa7fd827c, "kvm_page_track_unregister_notifier" },
	{ 0xa558d4b2, "kvm_is_visible_gfn" },
	{ 0x4d9b652b, "rb_erase" },
	{ 0x57a71d0a, "debugfs_remove" },
	{ 0x9e9fdd9d, "memunmap" },
	{ 0x41aed6e7, "mutex_lock" },
	{ 0x54c99fac, "mem_section" },
	{ 0x3a979e5c, "vfio_unpin_pages" },
	{ 0x7f53682f, "__srcu_read_lock" },
	{ 0xbb0e1b5e, "mdev_parent_dev" },
	{ 0x4320af79, "use_mm" },
	{ 0x7cd8d75e, "page_offset_base" },
	{ 0x893c3bb1, "kvm_page_track_register_notifier" },
	{ 0x40a9b349, "vzalloc" },
	{ 0xb601be4c, "__x86_indirect_thunk_rdx" },
	{ 0x9df03b9d, "idr_get_next" },
	{ 0xb67e2df7, "kvm_slot_page_track_remove_page" },
	{ 0xdb7305a1, "__stack_chk_fail" },
	{ 0x2ea2c95c, "__x86_indirect_thunk_rax" },
	{ 0xd3de8ea8, "kvm_write_guest" },
	{ 0xbdfb6dbb, "__fentry__" },
	{ 0xc565cb9d, "kmem_cache_alloc_trace" },
	{ 0xdbf17652, "_raw_spin_lock" },
	{ 0xb5fc3176, "kvm_put_kvm" },
	{ 0xa5526619, "rb_insert_color" },
	{ 0x37a0cba, "kfree" },
	{ 0x2e1e5b6f, "remap_pfn_range" },
	{ 0x69acdf38, "memcpy" },
	{ 0x6fb83bbb, "mdev_from_dev" },
	{ 0xc34a45c0, "gfn_to_pfn" },
	{ 0x969c73d9, "vfio_device_put" },
	{ 0x9291cd3b, "memdup_user" },
	{ 0x2e0d2f7f, "queue_work_on" },
	{ 0xadc044b7, "vfio_set_irqs_validate_and_prepare" },
	{ 0x941f2aaa, "eventfd_ctx_put" },
	{ 0x19567d06, "vfio_info_cap_shift" },
	{ 0xd98148b2, "unuse_mm" },
	{ 0x248369be, "vfio_pin_pages" },
	{ 0x362ef408, "_copy_from_user" },
	{ 0x62f1be44, "dma_ops" },
	{ 0x88db9f48, "__check_object_size" },
	{ 0x4f668318, "gfn_to_memslot" },
	{ 0x7c2d098f, "krealloc" },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=kvm,mdev,vfio";


MODULE_INFO(srcversion, "1832EC3559EE9A9070FFC3D");
