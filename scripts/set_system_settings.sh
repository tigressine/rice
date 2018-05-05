# A collection of gsettings that I like.
gsettings set org.gnome.desktop.background show-desktop-icons false
gsettings set org.gnome.desktop.wm.preferences focus-mode 'sloppy'
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.desktop.peripherals.touchpad click-method 'areas'
gsettings set org.gnome.shell enable-hot-corners false
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.mutter workspaces-only-on-primary false
gsettings set org.gnome.desktop.interface clock-format 12h

echo "HandleLidSwitch=lock" | sudo tee -a /etc/systemd/logind.conf
echo "HandleLidSwitchDocked=lock" | sudo tee -a /etc/systemd/logind.conf

# Shell extensions
gnome-shell-extension-tool -e launch-new-instance@gnome-shell-extensions.gcampax.github.com

function set_wm_keybinding {
    gsettings set org.gnome.desktop.wm.keybindings $1 "['$2']"
}

# Workspace keybindings
set_wm_keybinding move-to-workspace-1 '<Shift><Alt>exclam'
set_wm_keybinding move-to-workspace-2 '<Shift><Alt>at'
set_wm_keybinding move-to-workspace-3 '<Shift><Alt>numbersign'
set_wm_keybinding move-to-workspace-4 '<Shift><Alt>dollar'
set_wm_keybinding switch-to-workspace-1 '<Alt>1'
set_wm_keybinding switch-to-workspace-2 '<Alt>2'
set_wm_keybinding switch-to-workspace-3 '<Alt>3'
set_wm_keybinding switch-to-workspace-4 '<Alt>4'

# Window management keybindings
set_wm_keybinding close '<Shift><Alt>q'
set_wm_keybinding minimize '<Shift><Alt>w'
set_wm_keybinding move-to-monitor-left '<Shift><Alt>e'
set_wm_keybinding move-to-monitor-right '<Shift><Alt>r'


gsettings set org.gnome.settings-daemon.plugins.media-keys terminal "['<Alt>a']"
gsettings set org.gnome.settings-daemon.plugins.media-keys www "['<Alt>s']"
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Alt>d']"
