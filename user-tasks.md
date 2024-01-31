# Post-install tasks for my laptop

## Runit 

- enable dbus, elogind
- disable dhcpcd, wpa_supplicant, enable NetworkManager 


## GUI

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