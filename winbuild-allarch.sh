#!/bin/bash

make clean || echo clean
rm -f config.status
./autogen.sh || echo done
CFLAGS="-O3 -march=native -Wall" CXXFLAGS="$CFLAGS -std=gnu++11 -fpermissive" ./configure --with-curl
make -j 4
strip -s cpuminer.exe