#!/bin/bash

export LDFLAGS="-lg2c -ljasper -lnetcdf -lpng -lmysqlclient -lsz -lz -lm -fopenmp $LDFLAGS"
export CFLAGS="-I.. -I$PREFIX/include/mysql -fopenmp $CFLAGS"

mkdir bld
cd bld
cmake ${CMAKE_ARGS} \
  -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
  -DCMAKE_BUILD_TYPE=Release \
  -DMAKE_FTN_API=ON \
  -DUSE_G2CLIB_HIGH=ON \
  -DUSE_G2CLIB_LOW=ON \
  -DUSE_JPEG=ON \
  -DUSE_MYSQL=ON \
  -DUSE_NETCDF=ON \
  -DUSE_OPENJPEG=ON \
  -DUSE_OPENMP=ON \
  -DUSE_PNG=ON \
  ..

make
make install

if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" ]]; then
  ctest --verbose
fi
