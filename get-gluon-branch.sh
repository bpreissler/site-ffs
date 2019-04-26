#!/bin/bash

set -eu
set -o pipefail

# autoupdater
# ====
#
# For commit builds, the autoupdater shall be off, i.e. GLUON_BRANCH unset.
# For nightly, GLUON_BRANCH must be nightly.
# For beta, GLUON_BRANCH must be beta.
# For stable, GLUON_BRANCH must be stable.

gluon_branch=""

if [[ "${CI_PIPELINE_SOURCE:-}" = "schedule" ]]; then
    gluon_branch="nightly"
fi

case "${CI_COMMIT_TAG:-}" in
beta/*)
    gluon_branch="beta"
;;
stable/*)
    gluon_branch="stable"
;;
esac

# Else: Commit build
echo $gluon_branch
