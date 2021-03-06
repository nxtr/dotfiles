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

export GDK_SCALE=1
export GDK_SCALE_DPI=192
export SCALE=1
export SOMMELIER_ACCELERATORS="Super_L,<Alt>bracketleft,<Alt>bracketright,<Alt>minus,<Alt>equal"

# At end, read ~/.profile
if [ -f $HOME/.profile ]; then
    . $HOME/.profile
fi
