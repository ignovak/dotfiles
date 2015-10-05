IS_BASHRC_LOADED=True

for file in `find /usr/local/etc/bash_completion.d/*`; do
    source "$file"
done

for file in ~/dotfiles/.{bash_aliases}; do
    [ -r "$file" ] && source "$file"
done

unset file

export PS1="`hostname | sed 's/\([a-z0-9]*\).*/\1/'`:\w $ "

# Create a new directory and enter it
function d() {
    mkdir -p "$@" && cd "$@"
}
