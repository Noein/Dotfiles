#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=$HOME/.cabal/bin:$PATH
export EDITOR="vim"
export LANG="en_US.utf8"
export WINEARCH="win32"
export SDL_JOYSTICK_DEVICE="/dev/input/event5"
export GIT_SEQUENCE_EDITOR="/usr/share/git-cola/bin/git-xbase"
export VDPAU_DRIVER="radeonsi"

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
alias cd='cd '
alias ..='cd ..'
alias .='pwd'
alias ruby='ruby -w'
alias grep='grep -i'

# new commands
alias da='date "+%A, %B %d, %Y [%T]"'
alias hist='history | grep $1'      # requires an argument
alias openports='netstat --all --numeric --programs --inet'
alias pg='ps -Af | grep $1'         # requires an argument
alias checkNameConflicts='find . -type d | tr A-Z a-z | sort | uniq -c | sort -nr | grep -v "^  *1 " && find . -type f | tr A-Z a-z | sort | uniq -c | sort -nr | grep -v "^  *1 "'
alias normalizeNames='find . -depth -mindepth 1 -exec mvcase -l {} \; | grep "Could not move"'
alias qmake5='/usr/lib64/qt5/bin/qmake'

# privileged access
if [ $UID -ne 0 ]; then
    alias sudo='sudo '
    alias scat='sudo cat'
    alias svim='sudo vim'
    alias skill='sudo pkill'
    alias smount='sudo mount'
    alias esync='sudo emerge --sync && sudo eix-update && eix-diff'
    alias eupdate='sudo emerge -av --update --newuse --deep --with-bdeps=y @world --verbose-conflicts'
    alias epostupdate='sudo emerge --depclean && sudo revdep-rebuild'
    alias qemustuff='sudo modprobe kvm-amd kvm vfio bridge tun && sudo /etc/init.d/apparmor stop && sudo /etc/init.d/samba start && sudo /etc/init.d/libvirtd start'
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

shopt -s histappend
[[ "${PROMPT_COMMAND}" ]] && PROMPT_COMMAND="$PROMPT_COMMAND;history -a" || PROMPT_COMMAND="history -a"

# Prevent wine from adding menu entries and desktop links
export WINEDLLOVERRIDES='winemenubuilder.exe=d'

source ~/.profile
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
