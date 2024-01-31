# Void-init

This is my personal set of system & dotfile init scripts for my specific desktop and laptop, in my preferred install location(s). This script is intended to be run once only after a system reinstall.

I highly recommend not using this for your own system but feel free to browse.

> Desktop:
> - AMD CPU
> - NVidia GPU
> - Multi-monitor
> 
> Laptop:
> - Intel CPU & integrated GPU
> - No multi-monitor

## Usage

```
mkdir -p $HOME/.local
cd $HOME/.local
git pull www.github.com/rwnmk/void-init
cd void-init
bash start_install.bash
```

You will be asked for sudo privileges in order to allow the script to install packages. See the script for how this is handled and whether you are comfortable with the security implications.

Other actions requiring root (i.e. runit services, xorg graphics config, etc) are not performed. These manual actions are described in `user-tasks.md`. The script does not include these as the risk of borking your system is simply not worthwhile the couple of minutes it takes to do these tasks. I might develop this later with very conservative setopts & error-handling.

## How it works

- `start_install.bash`
    - `install_pkgs.bash`
        - package installer updates the system then installs all packages from void-init/packages
        - then xbps-reconfigure called just in case
    - `install_void-pkgs.bash`
        - installs void-packages from git so nonfree repo packages can be installed
        - any desired packages are then built & installed from void-init/nonfree-packages
    - `install_dev.bash`
        - tells asdf to add and install plugins from VINIT_ASDF_PLUGINS variable
        - any other development-specific packages are installed here (i.e. containers)
    - `configure_dots.bash`
        - git pull rwnmk/dotfiles
            - this repo includes a link-dots.bash script for tracking and updating linked files
        - creates any required folders, then symlinks various user config files into $HOME and $XDG_CONFIG_HOME
        - note that $XDG_USER_HOME itself is not linked, in order to skip including files which may contain private/transient information

## System setup

- i3 as wm
- programs like chromium, obsidian, spotify etc installed
- flatpak available

### Usage notes

Run `startx` from tty to launch i3

~/.xinitrc :: contains programs to run before the window manager session launches

~/.config/i3/config.d/startup :: contains programs to run after the wm session launches


### CLI & Development environment

- login & interactive shell is the void default, dash
- kitty terminal is configured to launch fish as the interactive shell, however
    - this means we get nice interactivity and prevent fish from messing up $PATH, as it is wont to do when set as the login shell
- shell scripts are written in bash as I prefer it
- fzf (with neovim integration installed)
- neovim with a couple of plugins for editing in the terminal
- vscode as default GUI editor
- 
- podman for containers
- asdf for toolchain management
    - https://asdf-vm.com/guide/getting-started.html
- direnv for CLI environment management

### Miscellany

#### VLC + VA-API

Override VLCs default video acceleration by going to Tools > Preferences > Input & Codecs and choosing the suitable option under Hardware-accelerated decoding, e.g. Video Acceleration (VA) API for VA-API.