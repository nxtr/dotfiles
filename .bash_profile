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

# At end, read ~/.profile
if [ -f $HOME/.profile ]; then
    . $HOME/.profile
fi

# If running from tty1 start sway
[ "$(tty)" = "/dev/tty1" ] && WLR_NO_HARDWARE_CURSORS=1 exec sway
