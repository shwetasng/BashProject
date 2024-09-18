# Greet the user
echo "Hello $(whoami)"
# comment
# Define an environment variable
export COURSE_ID=__REPO_NAME__

# Check .token file permissions
if [ -f ~/.token ]; then
  if [ $(stat -c %a ~/.token) -ne 600 ]; then
    echo "Warning: .token file has too open permissions"
  fi
fi

# Change umask
umask 002

# Update PATH
export PATH="$PATH:/home/$(whoami)/usercommands"

# Print current date in ISO 8601 format
echo "The current date is: $(date -u +"%Y-%m-%dT%H:%M:%S+00:00")"

# Define command alias
alias ltxt='ls *.txt'

# Handle ~/tmp directory
if [ -d ~/tmp ]; then
  rm -rf ~/tmp/*
else
  mkdir ~/tmp
fi

# Kill process on port 8080
if lsof -i :8080 >/dev/null; then
  kill $(lsof -t -i :8080)
fi
