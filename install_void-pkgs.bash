#!/usr/bin/env bash
set -euxo pipefail

if [ -d "$VP_INS_DIR" ]
then
    cd "$VP_INS_DIR" || return
else
    mkdir -p "$VP_INS_DIR" && cd "$VP_INS_DIR" || return
fi

git clone git://github.com/void-linux/void-packages.git

cd "$VP_INS_DIR"/void-packages || return

sh binary-bootstrap

echo XBPS_ALLOW_RESTRICTED=yes >> "$VP_INS_DIR"/void-packages/etc/conf




