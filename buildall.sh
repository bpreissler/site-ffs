#!/bin/bash

set -eu
set -o pipefail

build_date=$(date +%Y-%m-%d)
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

for target in ${TARGETS[@]}; do
	echo Building $target
	make -C gluon GLUON_TARGET=$target -j5 BUILD_DATE=$build_date GLUON_BRANCH=$branch GLUON_SITEDIR=../
done
