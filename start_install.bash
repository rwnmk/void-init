#!/usr/bin/env bas
set -euxo pipefail

export INIT_DIR="$HOME/.local/void-init"
export VINIT_LOG="$INIT_DIR/setup.log"
export DOT_CONFIG_DIR="$INIT_DIR/dots/xdg_config_home"
export VP_INS_DIR="$HOME/.local/vp-src"
export VINIT_ASDF_PLUGINS=(
                            rust 
                            nodejs 
                            go 
                            direnv
                          )
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
unset VINIT_LOG
unset DOT_CONFIG_DIR
unset VP_INS_DIR
unset PKGS
unset VINIT_ASDF_PLUGINS
unset FISH_INSTALL
unset PKGS

