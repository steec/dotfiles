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

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
#exec ck-launch-session dbus-launch openbox-session 

#~/bin/wireless.sh &

urxvtd &

sh ~/.fehbg &

numlockx &

xbindkeys & 

xrdb ~/.Xresources &

#cairo-compmgr &

#nm-applet & 

#thunar --daemon &

dropboxd &

#sh ~/code/shell/paperchanger.sh &

conky -c ~/.conkyrc | while read -r; do xsetroot -name "$REPLY"; done &

#conky -c ~/.conkyrc | dzen2 -p &

exec /home/stephen/bin/startdwm

#exec gnome-session
