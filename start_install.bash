#!/usr/bin/env bas
set -euxo pipefail

export INIT_DIR="$HOME/.local/void-init"
export DOT_CONFIG_DIR="$INIT_DIR/dots/xdg_config_home"
export VP_INS_DIR="$HOME/.local/vp-src"
export ASDF_PLUGINS=(rust nodejs go)
FISH_INSTALL="$(command -v fish)"
export FISH_INSTALL
PKGS=$(tr '\n' ' ' < "$INIT_DIR"/packages)
export PKGS

if [ "$PWD" != "$INIT_DIR" ]
then
    cd "$INIT_DIR" || exit && echo "Error: could not cd to HOME/.local/void-init"
fi

. "$INIT_DIR/install_pkgs.bash"
. "$INIT_DIR/install_void-pkgs.bash"
. "$INIT_DIR/install_dev.bash"

echo "Post-install task script finished execution"

unset INIT_DIR
unset VP_INS_DIR
unset PKGS

