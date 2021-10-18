#!/bin/bash

export LDFLAGS="-lgrib2c -ljasper -lnetcdf -lpng -lmysqlclient -lz -lm -fopenmp $LDFLAGS"
export CFLAGS="-I.. -fopenmp $CFLAGS"

rm -rf g2clib-* wgrib2/{fnlist,Gctpc,gctpc_ll2xy,new_grid_lambertc}.[ch]
cp $RECIPE_DIR/config.h wgrib2/config.h

pushd wgrib2
./function.sh
make

cp wgrib2 $PREFIX/bin
popd
