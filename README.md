# bcache
This repository is a *fork* of the upstreamed bcache module with some added functionalities.

Introducing a bcache control device (`/dev/bcache_ctrl`) that allows communicating to the driver from user space via IOCTL. The only IOCTL commands currently implemented, receives a `struct cache_sb` and uses it to register the backing device.

Registering a backing device via the new provided IOCTL interface will prevent the device from the need of being formatted.

## Compatibility
Tested and compatible with Linux kernel:
- v5.13
- v5.11
- v5.4*

*: need this patch to be applied
```patch
--- /lib/modules/5.4.0-107-generic/build/include/trace/events/bcache.h.orig	2022-04-07 11:41:33.718904155 +0000
+++ /lib/modules/5.4.0-107-generic/build/include/trace/events/bcache.h	2022-04-07 11:41:58.814969279 +0000
@@ -164,7 +164,7 @@
 	),

 	TP_fast_assign(
-		memcpy(__entry->uuid, c->sb.set_uuid, 16);
+		memcpy(__entry->uuid, c->set_uuid, 16);
 		__entry->inode		= inode;
 		__entry->sector		= bio->bi_iter.bi_sector;
 		__entry->nr_sector	= bio->bi_iter.bi_size >> 9;
@@ -200,7 +200,7 @@
 	),

 	TP_fast_assign(
-		memcpy(__entry->uuid, c->sb.set_uuid, 16);
+		memcpy(__entry->uuid, c->set_uuid, 16);
 	),

 	TP_printk("%pU", __entry->uuid)

```

## Installation

Clone this GitHub repository:
```
git clone https://github.com/andreatomassetti/bcache.git
make
sudo make install
sudo modprobe bcache.ko
```

## Usage

You can use an extended version of the `make-bcache` tool available here: https://github.com/andreatomassetti/bcache-tools

```
git clone https://github.com/andreatomassetti/bcache-tools.git -b ioctl_mod
make
make install
make-bcache --ioctl -B /dev/sdb
```
