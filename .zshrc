export SHELL=/bin/zsh

# export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/munki"
# export MANPATH="/usr/local/man:$MANPATH"

IS_OSX=`uname | grep -o Darwin`

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME=wezm

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    bower               # bower aliases & autocompletion
    common-aliases      #
    encode64            # encode64/decode64 commands
    extract             # 'x' alias - swiss knife for archive extracting
    git                 # git aliases & functions
    gitfast             # better git completion
    httpie              # httpie completion
    last-working-dir    # keeps track of the last used directory and automatically jumps to it for new shells
    node                # adds node-docs command (not in tmux)
    npm                 #
    rand-quote          #

    safe-paste          # No execute immidiately every line
                        # No compatible with zsh-autosuggestions :(

    # themes            # zsh theme switcher
    urltools            # urlencode/urldecode commands
)

# OS X Specific plugins
if [ $IS_OSX ]; then
    plugins=($plugins
        brew                #
        osx                 # https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#osx
        copyfile            # copies selected file content to clipboard
    )
fi

source $ZSH/oh-my-zsh.sh

# ###################################################
# User configuration
# ###################################################

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

setopt noclobber # >, >! — rewrite safety

# (http://stackoverflow.com/questions/11456403/stop-shell-wildcard-character-expansion/11456453#11456453)
# set noglob

# autoload -U +X compinit && compinit
# autoload -U +X bashcompinit && bashcompinit

source ~/.profile

# ^Z instead of `fg`
fancy-ctrl-z () {
    if [[ $#BUFFER -eq 0 ]]; then
        fg
        zle redisplay
    else
        zle push-input
    fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
