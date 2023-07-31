# Update the dots located in this repository.

DCONF_SETTINGS_PATHS="
  org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0
  org/gnome/settings-daemon/plugins/media-keys
  org/gnome/shell/keybindings
  org/gnome/desktop/wm/keybindings
  org/gnome/mutter/keybindings
"

# Save specific dconf settings into a file.
rm -f dots/.dconf
for path in $DCONF_SETTINGS_PATHS; do
  echo "[$path]" >> dots/.dconf
  dconf dump "/$path/" \
    | sed -n '1!p' \
    | awk '/^$/{exit} {print $0}' \
    | sort \
    >> dots/.dconf
  echo "" >> dots/.dconf
done

cp "$HOME/.face" dots/
cp "$HOME/.vimrc" dots/
cp "$HOME/.bashrc" dots/
cp "$HOME/.goto.sh" dots/
cp "$HOME/.Xdefaults" dots/
cp "$HOME/.tmux.conf" dots/
cp "$HOME/.bash_profile" dots/

mkdir -p dots/.config/kitty/
mkdir -p dots/.config/nvim/
mkdir -p dots/.config/shell/
mkdir -p dots/.config/shell/aliases/
mkdir -p dots/.config/shell/configuration/
mkdir -p dots/.mozilla/firefox/chrome/

cp "$HOME/.config/kitty/kitty.conf" dots/.config/kitty/
cp "$HOME/.config/nvim/init.vim" dots/.config/nvim/
cp "$HOME/.config/shell/shellrc" dots/.config/shell/
cp "$HOME/.config/shell/aliases/core_aliases" dots/.config/shell/aliases/
cp "$HOME/.config/shell/aliases/extended_aliases" dots/.config/shell/aliases/
cp "$HOME/.config/shell/configuration/core_configuration" \
  dots/.config/shell/configuration/
cp "$HOME/.config/shell/configuration/extended_configuration" \
  dots/.config/shell/configuration/
cp "$HOME/.mozilla/firefox/chrome/userChrome.css" dots/.mozilla/firefox/chrome/
