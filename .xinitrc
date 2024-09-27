#!/bin/sh

userresources=$HOME/.Xresources
#usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
#sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

#if [ -f $sysmodmap ]; then
#    xmodmap $sysmodmap
#fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

#if [ -f "$usermodmap" ]; then
#    xmodmap "$usermodmap"
#fi

# user init scripts and settings
#[ -r ~/.Xmodmap ] && xmodmap ~/.Xmodmap
[ -r ~/.Xresources ] && xrdb -merge ~/.Xresources
[ -r ~/.xprofile ] && . ~/.xprofile

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#==== start some shit
mpd &

#==== set session type
export XDG_SESSION_TYPE="x11"

#==== for gnome x11
#export XDG_SESSION_TYPE=x11
#export GDK_BACKEND=x11
#xautolock -time 10 -locker 'lock | xset dpms force off' -corners '+-00' -cornerdelay 15 -notify 15 -notifier "notify-send 'Screen will lock in 15 s'" &
#exec gnome-session

#==== for i3
#export XDG_SESSION_DESKTOP="i3"
#export XDG_CURRENT_DESKTOP="i3"
#exec dbus-run-session i3 2>&1 | tee ~/.i3.log

#==== for dwm
#export XDG_SESSION_DESKTOP="dwm"
#export XDG_CURRENT_DESKTOP="dwm"
#exec dwmstart.sh

#==== for dwm-flex
#export XDG_SESSION_DESKTOP="dwm"
#export XDG_CURRENT_DESKTOP="dwm"
#exec dwm-flexstart.sh

#==== for dusk
#export XDG_SESSION_DESKTOP="dusk"
#export XDG_CURRENT_DESKTOP="dusk"
#exec duskstart.sh

#==== for dk
#export XDG_SESSION_DESKTOP="dk"
#export XDG_CURRENT_DESKTOP="dk"
#exec dbus-run-session dk 2>&1 | tee ~/.dk.log

#==== for qtile
#export XDG_SESSION_DESKTOP="qtile"
#export XDG_CURRENT_DESKTOP="qtile"
#exec dbus-run-session qtile start

#==== for openbox
export XDG_SESSION_DESKTOP="openbox"
export XDG_CURRENT_DESKTOP="openbox"
exec dbus-run-session openbox-session 2>&1 | tee ~/.openbox.log

#==== for fluxbox
#export XDG_SESSION_DESKTOP="fluxbox"
#export XDG_CURRENT_DESKTOP="fluxbox"
#exec dbus-run-session startfluxbox

#exec dbus-run-session startxfce4

#==== for fvwm3
#export XDG_SESSION_DESKTOP="fvwm"
#export XDG_CURRENT_DESKTOP="fvwm"
#exec dbus-run-session fvwmstart.sh
