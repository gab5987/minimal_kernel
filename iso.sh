#!/bin/sh
set -e
. ./build.sh

mkdir -p isodir
mkdir -p isodir/boot
mkdir -p isodir/boot/grub

cp sysroot/boot/akuma.kernel isodir/boot/akuma.kernel
cat > isodir/boot/grub/grub.cfg << EOF
menuentry "akuma kernel" {
	multiboot /boot/akuma.kernel
}
EOF
grub-mkrescue -o akuma.iso isodir
