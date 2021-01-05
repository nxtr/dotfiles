# ~/.bash_profile: executed by bash(1) for login shells.

# Load keys and re-use ssh-agent and/or gpg-agent between logins
eval $(keychain --eval --quiet)

# If stdin is a TTY
if [ -t 0 ]; then       # check for a terminal
    # Set GPG TTY
    export GPG_TTY=$(tty)
fi

# Refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent --quiet updatestartuptty /bye >/dev/null

if [ -f /usr/bin/javac ]; then
    export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")
fi

# Wrap xiwi so that aliases work
xiwi() {
    local xiwiargs=''
    while [ "${1#-}" != "$1" ]; do
        xiwiargs="$xiwiargs $1"
        shift
    done
    local cmd="`alias "$1" 2>/dev/null`"
    if [ -z "$cmd" ]; then
        cmd="$1"
    else
        eval "cmd=${cmd#*=}"
        cmd="env $cmd"
    fi
    shift
    eval "/usr/local/bin/xiwi $xiwiargs $cmd \"\$@\""
}

# At end, read ~/.profile
if [ -f $HOME/.profile ]; then
    . $HOME/.profile
fi
