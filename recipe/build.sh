#!/bin/bash

export LDFLAGS="-lgrib2c -ljasper -lnetcdf -lpng -lmysqlclient -lz -lm -fopenmp ${LDFLAGS}"
export CFLAGS="-I.. -I${PREFIX}/include ${CFLAGS} -fopenmp"


export FC=$FC
export USE_IPOLATES=3

rm -r wgrib2/{fnlist,Gctpc,gctpc_ll2xy,new_grid_lambertc}.[ch]

cp ${RECIPE_DIR}/config.h wgrib2/config.h

pushd wgrib2
make fnlist.h fnlist.c
make

cp wgrib2 ${PREFIX}/bin
popd