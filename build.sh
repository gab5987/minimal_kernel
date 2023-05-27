#!/bin/sh
set -e
. ./config.sh

PROJECTS="kernel"

# export PREFIX=/usr
# export EXEC_PREFIX=$PREFIX
# export BOOTDIR=/boot
# export LIBDIR=$EXEC_PREFIX/lib
# export INCLUDEDIR=$PREFIX/include

export MAKE=${MAKE:-make}

export SYSROOT="$(pwd)/sysroot"
export CC="$CC --sysroot=$SYSROOT"


for PROJECT in $PROJECTS; do
  (cd $PROJECT && DESTDIR="$SYSROOT" $MAKE)
done

mv kernel/os-image.bin .