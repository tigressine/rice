# Install dots located in this repository.

mkdir -p "$HOME/.config/gtk-3.0/"
mkdir -p "$HOME/.config/kitty/"
mkdir -p "$HOME/.config/nvim/"
mkdir -p "$HOME/.config/shell/"
mkdir -p "$HOME/.config/shell/aliases/"
mkdir -p "$HOME/.config/shell/configuration/"

cp dots/.vimrc "$HOME/"
cp dots/.bashrc "$HOME/"
cp dots/.goto.sh "$HOME/"
cp dots/.Xdefaults "$HOME/"
cp dots/.tmux.conf "$HOME/"
cp dots/.bash_profile "$HOME/"
cp dots/.config/nvim/init.vim "$HOME/.config/nvim/"
cp dots/.config/shell/shellrc "$HOME/.config/shell/"
cp dots/.config/shell/aliases/core_aliases "$HOME/.config/shell/aliases/"
cp dots/.config/shell/configuration/core_configuration \
  "$HOME/.config/shell/configuration/"

# Copy example local-override files onto the machine if no local overrides
# exist.
if [ ! -f "$HOME/.config/shell/configuration/local_configuration" ]; then
  cp dots/.config/shell/configuration/local_configuration \
    "$HOME/.config/shell/configuration/"
fi
if [ ! -f "$HOME/.config/shell/aliases/local_aliases" ]; then
  cp dots/.config/shell/aliases/local_aliases "$HOME/.config/shell/aliases/"
fi

# If a core installation is not requested, install extended configuration
# and alias files.
if [ "$1" != --core ]; then
  cp dots/.face "$HOME/"
  cp dots/.config/gtk-3.0/bookmarks "$HOME/.config/gtk-3.0/"
  cp dots/.config/kitty/kitty.conf "$HOME/.config/kitty/"

  cp dots/.config/shell/aliases/extended_aliases \
    "$HOME/.config/shell/aliases/"
  cp dots/.config/shell/configuration/extended_configuration \
    "$HOME/.config/shell/configuration/"

  cat dots/.dconf | dconf load /

  # Save Firefox CSS hacks and link them in each available Firefox profile.
  mkdir -p "$HOME/.mozilla/firefox/chrome/"
  cp dots/.mozilla/firefox/chrome/userChrome.css \
    "$HOME/.mozilla/firefox/chrome/"
  find "$HOME/.mozilla/firefox/" \
    -maxdepth 1 \
    -type d \
    -name '*.*' \
    -exec rm -f "{}/chrome/userChrome.css" \; \
    -exec mkdir -p "{}/chrome/" \; \
    -exec ln -s "$HOME/.mozilla/firefox/chrome/userChrome.css" "{}/chrome/" \;
fi
