shopt -s expand_aliases
alias gg='git --no-pager grep --heading --line-number --break --ignore-case --fixed-strings --full-name'
# Safety mechanisms
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Case-insensitive less
alias less='less -i'

# Side-by-side diff
alias diff='diff -y'

# Testenv utility
alias testenv='~/shared-services/utils/testenv.py'

# Use human-readable free by default
alias free='free -hw'

# Include a newline after curl responses by default
alias curl='curl -w "\n"'
