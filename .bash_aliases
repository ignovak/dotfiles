alias ll='ls -laFoh'
alias l='ls -lh'
alias la='ls -a'

alias g='git'
alias ga='git add'
alias gb='git branch -a'
unalias gc 2>/dev/null
function gc() {
    msg="$@"; git commit -am "$msg"
}
alias gca='git commit --amend -am'
# Prepare fixup-commit for git rb -i --autosquash
alias gcf='git commit -a --fixup=@'
GIT_DIFF_OPTS='--color-words --find-renames=40% --diff-algorithm=patience --ignore-space-change'
alias gd="git diff $GIT_DIFF_OPTS"
alias gdc="git di --cached $GIT_DIFF_OPTS"
alias gds="git di --staged $GIT_DIFF_OPTS"
alias gsh="git show $GIT_DIFF_OPTS"
alias gf='git fetch --prune'
alias gh='git hist'
alias gl='git lol'
alias gla='git lola'
alias gm='git merge --no-ff'
alias gp='git pull --rebase'
alias gr='git remote -v'
alias gt='git tag'
alias gs='git st'
alias gst='git status -sb'
alias gse='vim $(git status --porcelain | sed -ne "s/^ M //p")' # git status: edit all changed files
alias grb='git rb -s patience rename-threshold=40%'
