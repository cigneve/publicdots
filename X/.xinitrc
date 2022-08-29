#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap

# Keymap
#setxkbmap tr
# Touchpad typing
xinput set-prop "ELAN050A:01 04F3:3158 Touchpad" "libinput Disable While Typing Enabled" 0
# Tap to click
xinput set-prop "ELAN050A:01 04F3:3158 Touchpad" "libinput Tapping Enabled" 1
# Enable numlock
numlockx on
# Disable fucking beep sound
xset -b

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

# Start local desktop files
dex -s ~/.config/autostart/ -a &
udiskie &

# Start geoclue (actually don't)
#dex /etc/xdg/autostart/geoclue-demo-agent.desktop &

xrdb -merge ~/.config/kanagawa

# Sometimes i envy awesomewm rices so it should stay here for quick access
#exec awesome
exec bspwm
