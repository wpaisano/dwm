# .bash_profile

# Get the aliases and functions
[ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

# Start X if it's not already running
[ -z "$(pgrep -x startx)" ] && startx