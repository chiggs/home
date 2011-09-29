###############################################################################
# .bashrc
###############################################################################


###############################################################################
# Custom key bindings

if [ -z "$SSH_CLIENT" ]; then
    # Reclaim the Caps Lock key for yakuake
    xmodmap -e "clear Lock"
    xmodmap -e "keycode 66 = notsign"

    # Pop the caps lock key on Alt_GR
    xmodmap -e 'keycode 108 = Caps_Lock'
    xmodmap -e 'add Lock = Caps_Lock'
fi


###############################################################################
# Set up the BASH history behaviour

# Prevent multiple shells from overwriting the history buffer
shopt -s histappend

# Disk space is cheap so let's have a large history buffer...
export HISTSIZE=100000

# ...but avoid storing duplicates
export HISTCONTROL=ignoreboth

export HISTTIMEFORMAT='%a %T '


###############################################################################
# Useful aliases

alias l='ls -lrt --color=tty'
alias ll='ls -l --color=tty'
alias c='clear'

function grepcx () {
    egrep --color=auto -nrs --include=\*.[ch] "$1" *
    egrep --color=auto -nrs --include=\*.cc --include=\*.cpp --include=\*.cxx "$1" *
    }

function greppy () {
    find . -name "*.py" | xargs egrep --color=auto -nrs "$1"
    }

function grepvhd () {
    egrep --color=auto -nrs --include=\*.vhd "$1" *
    }

#######################################
# X-app helpers
#######################################

# Wrapper to detach x gui apps from the launching terminal
function x {
    (nohup "$@" > /dev/null &) &
}

#######################################
# Project setup stuff
#######################################

alias @fware='cd $FWARE'

PS1="[\u@\h] \w: "

if [[ $SSH_CLIENT ]]; then
        temp=( $SSH_CLIENT )
        export DISPLAY=${temp[0]}:0.0
        unset temp
elif [[ $REMOTEHOST ]]; then
        export DISPLAY=$(dig +short ${REMOTEHOST}):0.0
else
        export DISPLAY=:0.0
fi

# How many characters of the $PWD should be kept
export pwd_length=30

function pwdl {
    export pwd_length=$1
}

function prompt_command {

if [ $(echo -n $PWD | wc -c | tr -d " ") -gt $pwd_length ]
then
   newPWD="...$(echo -n $PWD | sed -e "s/.*\(.\{$pwd_length\}\)/\1/")"
else
   newPWD="$(echo -n $PWD)"
fi

read one five fifteen rest < /proc/loadavg
}

export PROMPT_COMMAND=prompt_command

#######################################
# power prompt
# Date, load indication and path truncation
#######################################

function powerprompt {

local        BLUE="\[\033[0;34m\]"
local  LIGHT_GRAY="\[\033[0;37m\]"
local LIGHT_GREEN="\[\033[1;32m\]"
local  LIGHT_BLUE="\[\033[1;34m\]"
local  LIGHT_CYAN="\[\033[1;36m\]"
local      YELLOW="\[\033[1;33m\]"
local       WHITE="\[\033[1;37m\]"
local         RED="\[\033[0;31m\]"
local      BG_RED="\[\033[0;41m\]"
local    BG_GREEN="\[\033[0;42m\]"
local       NO_BG="\[\033[0;49m\]"
local   NO_COLOUR="\[\033[0m\]"

case $TERM in
    xterm*)
        TITLEBAR='\[\033]0;\u@\h:\w\007\]'
        ;;
    *)
        TITLEBAR=""
        ;;
esac

PS1="$TITLEBAR\
$BLUE\$(date +%H:%M) \
$LIGHT_CYAN\$one$NO_COLOUR$NO_BG\
$YELLOW[$LIGHT_GREEN\u$YELLOW@$NO_COLOUR\h$YELLOW]\
$NO_COLOUR\$newPWD\
$LIGHT_GREEN:\
$NO_COLOUR "
PS2='> '
PS4='+ '
}

powerprompt


