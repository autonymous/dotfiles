#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# load system Xresources
if [ -f $sysresources ]; then xrdb -merge $sysresources; fi
if [ -f $sysmodmap ]; then xmodmap $sysmodmap; fi

# load user Xresources
if [ -f "$userresources" ]; then xrdb -merge "$userresources"; fi
if [ -f "$usermodmap" ]; then xmodmap "$usermodmap"; fi

# load all xinitrc.d/ scripts
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# virtualbox
if [ -f /usr/bin/VBoxClient-all ]; then /usr/bin/VBoxClient-all; fi

# lock desktop timer
xautolock -time 10 -locker "i3lock-wrapper" &

# inital wallpaper, next wallpapers are switched by cron
feh --bg-scale "$(find ~/Documents/interfacelift-downloader/wallpapers/*.jpg | shuf -n1)"

exec i3 # >> ~/i3.log 2>&1

# vim:filetype=sh
