
# Check for an interactive session
[ -z "$PS1" ] && return

# Terminal prompt
PS1='[\u@\h \W]\$ '

# Some handy aliases
alias ls='ls --color=auto'
alias ll='ls --color=auto -lh'
alias la='ls --color=auto -ah'
alias dir='ls --color=auto -lha'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'

alias rd="$HOME/code/rd/rd"

alias gterm='gnome-terminal'
alias Gterm='gnome-terminal --maximize'

alias vimes="$HOME/script/vimes"

# Go straight from console login to X11 environment
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
     xinit -- :0 2>/dev/null
     logout
fi

export PATH="$PATH:/usr/local/bin:$HOME/bin"

