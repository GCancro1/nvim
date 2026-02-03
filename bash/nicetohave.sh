

# Colors
GREEN='\[\033[01;32m\]'
BLUE='\[\033[01;34m\]'
YELLOW='\[\033[01;33m\]'
RESET='\[\033[00m\]'

# Prompt
parse_git_branch() {
    local branch
    branch=$(git branch 2>/dev/null | sed -n '/^\* /s/^\* //p')
    [ -n "$branch" ] && printf "(%s)" "$branch"
}
export PS1="${BLUE}\w${YELLOW} \$(parse_git_branch)${RESET}\$ "

alias v='nvim'
alias ll='ls -alFh'


function nvconf {
    nvim -S "$HOME/conf_ses.vim"
}
