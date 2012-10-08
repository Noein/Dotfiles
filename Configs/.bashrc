#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=/home/natsuo/.gem/ruby/1.9.1/bin:$PATH
export GEM_HOME=/home/natsuo/.gem/ruby/1.9.1
export PATH=/home/natsuo/.cabal/bin:$PATH

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '

export EDITOR="vim"

# зеленый цвет для приглашения юзера
PS1='\[\e[0;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[0;29m\]'

# modified commands
alias diff='colordiff'              # requires colordiff package
alias grep='grep --color=auto'
alias less='more'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
#alias ping='ping -c 5'
alias ..='cd ..'
alias .='pwd'

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
    alias update='sudo pacman -Syu'
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
alias make-backup='tar czvf $(date +backup-%d-%m-%Y-%s.tar.gz)'

shopt -s histappend
[[ "${PROMPT_COMMAND}" ]] && PROMPT_COMMAND="$PROMPT_COMMAND;history -a" || PROMPT_COMMAND="history -a"

# modifity for unarhive files
# extract() {
#     local c e i
#
#     (($#)) || return
#
#     for i; do
#         c=''
#         e=1
#
#         if [[ ! -r $i ]]; then
#             echo "$0: file is unreadable: \`$i'" >&2
#             continue
#         fi
#
#         case $i in
#         *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz)))))
#                c='bsdtar xvf';;
#         *.7z)  c='7z x';;
#         *.Z)   c='uncompress';;
#         *.bz2) c='bunzip2';;
#         *.exe) c='cabextract';;
#         *.gz)  c='gunzip';;
#         *.rar) c='unrar x';;
#         *.xz)  c='unxz';;
#         *.zip) c='unzip';;
#         *)     echo "$0: unrecognized file extension: \`$i'" >&2
#                continue;;
#         esac
#
#         command $c "$i"
#         e=$?
#     done
#
#     return $e
# }
