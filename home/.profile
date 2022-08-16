export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="firefox"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_MUSIC_DIR="$HOME/Music/"
export PATH
#export QR_QPA_PLATFORM="gtk2"
export QT_QPA_PLATFORMTHEME=qt5ct
export _JAVA_AWT_WM_NONREPARENTING=1
export $(dbus-launch)
# set PATH so it includes user's private ~/.local/bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$PATH:$HOME/.local/bin"
fi

if [ -d "$HOME/.bin" ] ;
  then PATH="$PATH:$HOME/.bin"
fi

# startx automatically
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
startx
# logout after stopping x
# logout
fi
