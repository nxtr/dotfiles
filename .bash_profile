# ~/.bash_profile: executed by bash(1) for login shells.

export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")

eval $(keychain --eval --quiet)

# Set GPG TTY
export GPG_TTY=$(tty)

# Refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent --quiet updatestartuptty /bye >/dev/null

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
