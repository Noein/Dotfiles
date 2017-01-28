#
# ~/.bash_profile
#

#PATH="/usr/lib/ccache/bin:${PATH}" # ccache
export CCACHE_DISABLE=1

[[ -f ~/.bashrc ]] && . ~/.bashrc

source ~/.profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
