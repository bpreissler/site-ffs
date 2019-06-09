#!/bin/bash

set -eu
set -o pipefail

# autoupdater
# ====
#
# This script prints the name of the autoupdater branch depending on the build
# configuration. Its output is suitable for use as the GLUON_BRANCH build
# variable of gluon.
#
# The idea is to take whatever comes in the GLUON_BRANCH build variable,
# except when this value is not one of the well-known branch names; then fall
# back to 'nightly'.

default_gluon_branch_name="nightly"

case "${GLUON_BRANCH:-}" in
    "nightly" | "beta" | "stable")
        gluon_branch="$GLUON_BRANCH"
        ;;
    *):
        gluon_branch="$default_gluon_branch_name"
        ;;
esac

echo $gluon_branch
