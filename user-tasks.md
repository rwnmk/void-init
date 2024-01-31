# Post-install tasks for my laptop

## Microcode

```sh
xbps-reconfigure -f linux$(uname -r | sed 's/..[0-9]_[0-9]//g')
```

## Runit 

- enable dbus, elogind
- disable dhcpcd, wpa_supplicant, enable NetworkManager 


## GUI

i3 include is useful:

```sh
include $HOME/.config/i3/config.d/*
```

## Audio

#### Session Manager

```sh
mkdir -p /etc/pipewire/pipewire.conf.d
ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
```

#### Pulseaudio interface

```sh
mkdir -p /etc/pipewire/pipewire.conf.d
ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d/
```

#### Launching automatically

~/.xinitrc :

```sh
exec dbus-run-session /usr/bin/i3
```

~/.config/i3/config

```sh
exec --no-startup-id pipewire
```

## Display

```sh
# /etc/X11/xorg.conf.d/20-intel.conf
Section "Device"
        Identifier "Intel Graphics"
        Driver     "intel"
        Option     "AccelMethod" "sna"
        Option     "DRI" "2"
        Option     "TearFree" "true"
EndSection
```

## Font improvements

```sh
sudo ln -s /usr/share/fontconfig/conf.avail/10-hinting-slight.conf /etc/fonts/conf.d/
sudo ln -s /usr/share/fontconfig/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d/
sudo ln -s /usr/share/fontconfig/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d/
sudo ln -s /usr/share/fontconfig/conf.avail/50-user.conf /etc/fonts/conf.d/
sudo ln -s /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/
```

## Dev env

- podman for containers
- asdf for local environment management
    - https://asdf-vm.com/guide/getting-started.html
- rustup

## Misc

### VLC

> VLC automatically tries to use an available API, but you can override it by going to Tools > Preferences > Input & Codecs and choosing the suitable option under Hardware-accelerated decoding, e.g. Video Acceleration (VA) API for VA-API