#!/bin/bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/libtool/build-aux/config.* ./build-aux

./configure --prefix="${PREFIX}" \
            --enable-static=no \
            --enable-libgdbm-compat
make -j${CPU_COUNT}
if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" ]]; then
  make check
fi
make install
