# Bash
[[ -f "$HOME/.bashrc" ]] && . .bashrc

# Export variables
export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="firefox"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_MUSIC_DIR="$HOME/Music/"
export PATH
export QT_QPA_PLATFORMTHEME=gtk2
export _JAVA_AWT_WM_NONREPARENTING=1
export GTK_THEME='buttonteset'
export $(dbus-launch)

export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

# set PATH
[ -d "$HOME/.local/bin" ] && PATH="$PATH:$HOME/.local/bin"
[ -d "$HOME/.bin" ] && PATH="$PATH:$HOME/.bin"

# Lf icons
[ -f ~/.config/lf/icons ] && {
	LF_ICONS="$(tr '\n' ':' <~/.config/lf/icons)" \
		&& export LF_ICONS
}

# startx automatically
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
startx
fi
