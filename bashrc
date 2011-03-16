
# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias ll='ls --color=auto -l'
alias la='ls --color=auto -a'
alias lx='ls --color=auto -la'
alias ld='ls --color=auto -ld'

alias ncmpc='ncmpc -c'

# Go straight from console login to X11 environment
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
     xinit -- :0 2>/dev/null
     logout
fi

export PATH="$PATH:/usr/local/bin"

# Launch some programs in the background
if [[ -z $(pidof btpd) ]]; then btpd; fi
if [[ -z $(pidof mpd) ]]; then mpd; fi
