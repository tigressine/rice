# My Bash-specific Shell configuration.
# Written by Tiger Sachse.

# Enable Vi keybindings.
set -o vi

# Don't exit when I hit Ctrl-d.
set -o ignoreeof

# Set the terminal prompt.
PS1="\[\e[1;93m\]>> \[\e[0m\]"

# Source global definitions if available.
if [ -f "/etc/bashrc" ]; then
    . "/etc/bashrc"
fi

# Load the generic Shell configuration file if it exists.
if [ -f "$HOME/.config/shell/shellrc" ]; then
    . "$HOME/.config/shell/shellrc"
fi

# Source ROS tooling if available.
if [ -f "/opt/ros/melodic/setup.bash" ]; then
  . "/opt/ros/melodic/setup.bash"
fi

# Initialize Shellcuts.
if [ -f "/etc/shellcuts/shells/shellcuts.sh" ]; then
  . "/etc/shellcuts/shells/shellcuts.sh"
fi

# Source the ROS setup file for the EZRASSOR, if it exists.
if [ -f "/home/ANT.AMAZON.COM/tiges/.ezrassor-workspace/devel/setup.bash" ]; then
  . "/home/ANT.AMAZON.COM/tiges/.ezrassor-workspace/devel/setup.bash"
fi
