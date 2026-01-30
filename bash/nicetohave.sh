
parse_git_branch() {
    git branch 2> /dev/null | sed -n '/^\* /s/^\* //p'
}
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;33m\]$(parse_git_branch)\[\033[00m\]\$ '

alias v='nvim'
alias ll='ls -alFh'
