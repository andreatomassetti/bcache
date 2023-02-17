/* SPDX-License-Identifier: GPL-2.0 */
#ifndef __BCACHE_IOCTL_CODES_H__
#define __BCACHE_IOCTL_CODES_H__

#include <linux/blkdev.h>
#include <linux/ioctl.h>
#include <linux/types.h>

#include "bcache_ondisk.h"

struct bch_register_device {
	char dev_name[BDEVNAME_SIZE];
	struct cache_sb sb;
};

#define BCH_IOCTL_MAGIC (0xBC)

/** Start new cache instance, load cache or recover cache */
#define BCH_IOCTL_REGISTER_DEVICE	_IOWR(BCH_IOCTL_MAGIC, 1, struct bch_register_device)

#endif
