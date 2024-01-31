#!/usr/bin/env bash
set -euxo pipefail

asdf_setup() {
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
    for plugin in "${ASDF_PLUGINS[@]}"
    do
        asdf plugin add "$plugin"
        asdf install "$plugin" latest
    done
}

kitty_setup() {
    if command -v kitty;
    then
        ln -s "$DOT_CONFIG_DIR"/kitty "$XDG_CONFIG_HOME"/kitty
    fi
}