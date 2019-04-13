#!/bin/bash

set -eu
set -o pipefail

branch=nightly

TARGETS=(
	ar71xx-generic 
	ar71xx-nand 
	ar71xx-tiny 
	brcm2708-bcm2708 
	brcm2708-bcm2709 
	ipq40xx 
	mpc85xx-generic
	ramips-mt7620
	ramips-mt76x8
#	ramips-rt305x # build fails
	x86-64
	x86-generic
	x86-geode
)

sitedir=$(readlink -f $(dirname $0))
make -C gluon update GLUON_SITEDIR="$sitedir"

for target in ${TARGETS[@]}; do
	echo Building $target
	make -C gluon GLUON_TARGET=$target GLUON_BRANCH=$branch GLUON_SITEDIR="$sitedir" -j`nproc`
done
