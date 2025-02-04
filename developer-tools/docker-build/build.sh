#!/bin/bash

MAKEJOBS=-j3
HOST=x86_64-unknown-linux-gnu
DEP_OPTS="NO_UPNP=1 ALLOW_HOST_PACKAGES=1"

make $MAKEJOBS -C depends HOST=$HOST $DEP_OPTS

./autogen.sh
mkdir -p build/$HOST && cd build/$HOST
../../configure LDFLAGS="-static-libstdc++" --cache-file=config.cache --prefix=/work/depends/$HOST --enable-werror --enable-zmq --enable-reduce-exports
make $MAKEJOBS
