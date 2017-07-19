#!/bin/sh

usermodmap=$HOME/.Xmodmap
userresources=$HOME/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f "$usermodmap" ]; then
    xmodmap $usermodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge $userresources
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#compton -b
#sh Scripts/rwall.sh

mpd
redshift &
setxkbmap de
xset s off -dpms
pulseaudio --start
hsetroot -fill Bilder/Wallpaper/gIJ.jpg

exec i3
