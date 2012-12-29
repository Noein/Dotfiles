#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=/home/natsuo/.cabal/bin:$PATH
export EDITOR="vim"
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Green color for user prompt
PS1='\[\e[0;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[0;29m\]'

# modified commands
alias ls='ls --color=auto'
alias diff='colordiff'              # requires colordiff package
alias grep='grep --color=auto'
alias less='more'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
#alias ping='ping -c 5'
alias ..='cd ..'
alias .='pwd'
alias ruby='ruby -w'

# new commands
alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='du --max-depth=1'
alias hist='history | grep $1'      # requires an argument
alias openports='netstat --all --numeric --programs --inet'
alias pg='ps -Af | grep $1'         # requires an argument

# privileged access
if [ $UID -ne 0 ]; then
    alias sudo='sudo '
    alias scat='sudo cat'
    alias svim='sudo vim'
    alias skill='sudo pkill'
    alias smount='sudo mount'
    alias update='layman -S && eix-sync && emerge -uDNnav --with-bdeps=y world'
fi

# ls
alias ls='ls -hF --color=always'
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'

# safety features
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'                    # 'rm -i' prompts for every file
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Archiving
alias tar.pack='tar czvf'
alias tar.unpack='tar -zxvf'
alias backup='tar czvf $(date +backup-%d-%m-%Y-%s.tar.gz)'

unset RUBYOPT

shopt -s histappend
[[ "${PROMPT_COMMAND}" ]] && PROMPT_COMMAND="$PROMPT_COMMAND;history -a" || PROMPT_COMMAND="history -a"

if test -f ~/.rvm/scripts/rvm; then
  [ "$(type -t rvm)" = "function" ] || source ~/.rvm/scripts/rvm
fi
