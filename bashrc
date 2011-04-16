
# Check for an interactive session
[ -z "$PS1" ] && return

# Go straight from console login to X11 environment
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
     xinit -- :0 2>/dev/null
     logout
fi

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

# Aesthetic terminal
alias gterm='gnome-terminal'
alias Gterm='gnome-terminal --maximize'

# Path
export PATH="$PATH:/usr/local/bin:$HOME/bin"

# XRandR and compositing {{{1
xaddvga() {
    if test -z "$1" ; then
        mode=1920x1080
    else 
        mode="$1" ; fi
    cmd="xrandr --output VGA-0 --mode $mode --right-of LVDS"
    ccmgr=$(pidof cairo-compmgr)
    if test -n "$ccmgr"; then
        kill $ccmgr 
        $cmd 
        cairo-compmgr &> /dev/null &
    else
        $cmd ; fi ; }

xclonevga() {
    if test -z "$1" ; then
        mode=1280x800
    else 
        mode="$1" ; fi
    cmd1="xrandr --output LVDS --mode $mode"
    cmd2="xrandr --output VGA-0 --mode $mode --pos 0x0"
    ccmgr=$(pidof cairo-compmgr)
    if test -n "$ccmgr"; then
        kill $ccmgr 
        $cmd1 && $cmd2
        cairo-compmgr &> /dev/null &
    else
        $cmd && $cmd2 ; fi ; }

xdelvga() { 
    cmd='xrandr --output VGA-0 --off --output LVDS --mode 1400x1050' 
    ccmgr=$(pidof cairo-compmgr)
    if test -n "$ccmgr"; then
        kill $ccmgr 
        $cmd 
        cairo-compmgr &> /dev/null &
    else
        $cmd ; fi ; } #1}}}



