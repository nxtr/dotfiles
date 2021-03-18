# /etc/skel/.bash_profile

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

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi
