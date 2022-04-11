# SPDX-License-Identifier: GPL-2.0

BCACHE_MODULE = bcache

obj-m = $(BCACHE_MODULE).o
bcache-y := alloc.o bset.o btree.o closure.o debug.o extents.o\
	io.o journal.o movinggc.o request.o stats.o super.o sysfs.o trace.o\
	util.o writeback.o features.o control.o

KVERSION = $(shell uname -r)
MODULES_DIR = /lib/modules/$(KVERSION)
BCACHE_MODULE_PATH = $(MODULES_DIR)/kernel/drivers/md/bcache

PWD=$(shell pwd)

all:
	make -C $(MODULES_DIR)/build M=$(PWD) modules
clean:
	make -C $(MODULES_DIR)/build M=$(PWD) clean

install:
	@echo "Installing bcache module"
	@install -m 755 -d $(DESTDIR)/$(BCACHE_MODULE_PATH)
	@install -m 644 $(BCACHE_MODULE).ko $(DESTDIR)$(BCACHE_MODULE_PATH)/$(BCACHE_MODULE).ko
