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

get-instanceids() {
  # Use this alias like `get-instanceids <profile> <environment>`.
  # This alias uses defaults of "test" and "*" for each of those arguments.
  profile="${1:-test}"
  env="${2:-*}"
	aws --output table --profile "$profile" ec2 describe-instances \
  --query 'Reservations[*].Instances[*].{Name:Tags[?Key==`Name`]|[0].Value,InstanceId:InstanceId,LaunchTime:LaunchTime}' \
  --filters "Name=tag:Environment,Values=$env"
}
export -f get-instanceids

# Run suite server locally
alias runapp='timeout 15m ~/suite/utils/run_app.sh'
