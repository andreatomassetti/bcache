# bcache
This repository is a *fork* of the upstreamed bcache module with some added functionalities.

Introducing a bcache control device (`/dev/bcache_ctrl`) that allows communicating to the driver from user space via IOCTL. The only IOCTL commands currently implemented, receives a struct cache_sb and uses it to register the backing device.

Registering a backing devie via the new provided IOCTL interface will prevent the device from the need of being formatted.

## Installation

Clone this GitHub repository:
```
git clone https://github.com/andreatomassetti/bcache.git
make
sudo insmod bcache.ko
```

## Usage

You can use an extended version of the `make-bcache` tool available here: https://github.com/andreatomassetti/bcache-tools

```
git clone https://github.com/andreatomassetti/bcache-tools.git -b ioctl_mod
make
make install
make-bcache --ioctl -B /dev/sdb
```
