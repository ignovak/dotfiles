for file in ~/.{path,exports,aliases,extra}; do
    [ -r "$file" ] && source "$file"
done
unset file

alias ll='ls -laFo'
alias l='ls -l'
alias la='ls -la'
alias ltr='ls -ltr'

alias e=$EDITOR

_expand()
{
    return 0;
}
