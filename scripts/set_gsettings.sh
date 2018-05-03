# A collection of gsettings that I like.

gsettings set org.gnome.desktop.background show-desktop-icons false
gsettings set org.gnome.desktop.wm.preferences focus-mode 'sloppy'
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.desktop.peripherals.touchpad click-method 'areas'

gsettings set org.gnome.shell enable-hot-corners false
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface show-battery-percentage true

gsettings set org.gnome.mutter workspaces-only-on-primary false

gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Shift><Alt>exclam']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Shift><Alt>at']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Shift><Alt>numbersign']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Shift><Alt>dollar']"

gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Alt>1']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Alt>2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Alt>3']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Alt>4']"

gsettings set org.gnome.desktop.wm.keybindings close "['<Shift><Alt>q']"
gsettings set org.gnome.desktop.wm.keybindings minimize "['<Shift><Alt>w']"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-left "['<Shift><Alt>e']"
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-right "['<Shift><Alt>r']"

gsettings set org.gnome.settings-daemon.plugins.media-keys terminal "['<Alt>a']"
gsettings set org.gnome.settings-daemon.plugins.media-keys www "['<Alt>s']"
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Alt>d']"
