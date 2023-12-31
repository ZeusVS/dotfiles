setxkbmap -option 'caps:ctrl_modifier';xcape -e 'Caps_Lock=Escape'&

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xrdb -merge ~/.config/X11/.Xresources
exec i3
