shopt -s expand_aliases
alias gg='git --no-pager grep --heading --line-number --break --ignore-case --fixed-strings --full-name'
alias makeb='STS_TEST=`git name-rev HEAD --name-only` make'
