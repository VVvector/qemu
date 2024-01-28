#!/bin/bash

cd ../
mkdir build
cd build
../qemu/qemu-8.2.0/configure
make
