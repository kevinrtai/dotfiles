# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey '^a' vi-beginning-of-line
bindkey '^e' vi-end-of-line
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/kevinrtai/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

setopt autocd

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Aliases
if [ -f "/home/kevinrtai/.zsh_aliases" ]; then
    . "/home/kevinrtai/.zsh_aliases"
fi

# COLORS!
autoload -U colors && colors
export PROMPT="%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%}:%{$fg[yellow]%}%~%{$reset_color%}
$ "
export CLICOLOR=1
# export LSCOLORS=ExFxBxDxCxegedabagacad
# export LSCOLORS=GxFxCxDxBxegedabagaced
export LSCOLORS="gxfxcxdxbxegedabagacad"
# export LSCOLORS=exfxfeaeBxxehehbadacea
# export LS_COLORS='di=1:fi=96:*.m=31:*.py=32:*.txt=36:*.out=35'
# Old color settings 
# export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\n\$ "
# export CLICOLOR=1
# export LSCOLORS=exfxfeaeBxxehehbadacea

# # Zsh to use the same colors as ls
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
export PATH="/home/kevinrtai/lib/android_sdk/platform-tools:$PATH"
export PATH="/opt/MATLAB/2015b/bin:$PATH"
export PATH="/home/kevinrtai/bin:$PATH"
export PATH="/home/kevinrtai/.local/bin:$PATH"

# CUDA/CUDNN
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64/:${LD_LIBRARY_PATH}
export CUDA_HOME=/usr/local/cuda

# EDITOR
EDITOR=/usr/bin/vim

# added by Miniconda3 installer
# export PATH="/home/kevinrtai/miniconda3/bin:$PATH"  # commented out by conda initialize

# Android
export ANDROID_HOME=$HOME/lib/android_sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Custom env variables
LOCAL_IP=192.168.86.2 # reserved IP

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/kevinrtai/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/kevinrtai/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/kevinrtai/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/kevinrtai/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# opam configuration
test -r /home/kevinrtai/.opam/opam-init/init.zsh && . /home/kevinrtai/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
