# ~/.bash_logout: executed by bash(1) when login shell exits.

# when leaving the console clear the screen to increase privacy

if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi

# nvim keeps xsel running after exiting, which will block the logout.
# Force-kill it here so logout can proceed.
pkill xsel
