# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
export PATH=$PATH:/usr/local/cuda/bin:.
export LD_LIBRARY_PATH=/usr/local/cuda/lib64

