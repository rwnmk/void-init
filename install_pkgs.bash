#!/usr/bin/env bash
set -euxo pipefail

if [ "$PWD" != "$INIT_DIR" ]
then
    cd "$INIT_DIR" || exit
fi

xbps-install-voidpkgs() {
    xbps-install -Syv "$PKGS"
} 2>&1 | tee "INIT_DIR"/setup.log

xbps-install-voidpkgs && echo "Packages successfully installed"

# add while read for $PKGS and if services need enable echo 








