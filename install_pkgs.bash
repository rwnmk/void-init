#!/usr/bin/env bash
set -euxo pipefail

if [ "$PWD" != "$INIT_DIR" ]
then
    cd "$INIT_DIR" || exit
fi

get-temp-sudo() {
    read -srp "Provide your sudo password so the script can run setup commands with temporary elevation: " pw
    printf "\n"
}

update-existing-pkgs() {
    echo "$pw" | sudo xbps-install -Syu
}

install-new-pkgs() {
    echo "$pw" | sudo xbps-install -Syv "$PKGS"  | tee -a "$VINIT_LOG" > /dev/null
} 2>&1 | tee "INIT_DIR"/setup.log

reconfigure-kernel() {
    echo "$pw" | sudo xbps-reconfigure -f linux"$(uname -r | sed 's/..[0-9]_[0-9]//g')" | tee -a "$VINIT_LOG" > /dev/null
}

get-temp-sudo
update-existing-pkgs
install-new-pkgs
reconfigure-kernel


# post-update

# fill pw variable with crap and unset
pw="$(date | md5sum)"
unset pw





