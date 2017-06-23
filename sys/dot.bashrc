# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#################### prompt with git branch ####################
# http://henrik.nyh.se/2008/12/git-dirty-prompt
# http://www.simplisticcomplexity.com/2008/03/13/...
# ...show-your-git-branch-name-in-your-prompt/
#   username@Machine ~/dev/dir[master]$   # clean working directory
#   username@Machine ~/dev/dir[master*]$  # dirty working directory
 
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
export PS1='\u@\h \[\033[1;33m\]\w\[\033[0m\]$(parse_git_branch)$ '

#################### aliases ####################
alias lp='lp -o sides=two-sided-long-edge'
alias gl='git log --decorate'
alias gll='git log --all --decorate --graph'
alias gs='git status'
alias h='history'

#################### variables ####################
export PATH=.:./bin:$HOME/bin:$PATH
export EDITOR=emacs 
export PYTHONSTARTUP=$HOME/.pythonrc
export PATH="/usr/local/anaconda3/bin:$PATH"
export FFTW_INC="-I /usr/local/include"
export FFTW_LINK="/usr/local/lib/libfftw3.a"
export OMP_NUM_THREADS=4
export KMP_AFFINITY=compact

#################### functions ####################
prompt(){
    export PS1='\u@\h \[\033[1;33m\]\w\[\033[0m\]$ '
}

intel(){
    source $HOME/.bashrc.d/psxevars.sh
}

py2(){
    export PATH=${PATH//"/usr/local/anaconda3/bin"/"/usr/local/anaconda/bin"}
}

py3(){
    export PATH=${PATH//"/usr/local/anaconda/bin"/"/usr/local/anaconda3/bin"}
}
