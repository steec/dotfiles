#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xset +fp /usr/share/fonts/local
xset fp rehash

#cairo-compmgr &

#xcompmgr &

urxvtd &

sh ~/.fehbg &

numlockx &

xbindkeys & 

xrdb ~/.Xresources &

#thunar --daemon &

#tint2 &

#dropboxd &

mpd &

#systemd --user &

#sh ~/code/shell/paperchanger.sh &

conky -c ~/.conkyrc | while read -r; do xsetroot -name "$REPLY"; done &

#exec ck-launch-session dbus-launch openbox-session 
#exec i3
exec /home/stephen/bin/startdwm
#exec enlightenment_start
#exec openbox-session
#exec awesome
#exec wmii
