export PATH=$PATH:$HOME/bin:.
export EDITOR=emacs
export PYTHONSTARTUP=$HOME/.pythonrc
export FFTW_INC=$TACC_FFTW3_INC
export MKL_INC=$TACC_MKL_INC
export MKL_LINK=$TACC_MKL_LIB
export FFTW_LINK=$TACC_FFTW3_LIB
export LD_LIBRARY_PATH=$HOME/openmpi-1.6.3/lib:$LD_LIBRARY_PATH



# http://henrik.nyh.se/2008/12/git-dirty-prompt
# http://www.simplisticcomplexity.com/2008/03/13/...
# ...show-your-git-branch-name-in-your-prompt/
#   username@Machine ~/dev/dir[master]$   # clean working directory
#   username@Machine ~/dev/dir[master*]$  # dirty working directory
 
#function parse_git_dirty {
#  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
#}
#function parse_git_branch {
#  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
#}
#export PS1='\u@\h \[\033[1;33m\]\w\[\033[0m\]$(parse_git_branch)$ '
 

