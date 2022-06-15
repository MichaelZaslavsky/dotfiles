# Run Vim commands on the command line
set -o vi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Env
export TERM=xterm-256color
export EDITOR=vim

# Add date and time formatting to bash history
HISTTIMEFORMAT="%F %T "

# Ignore duplicate commands in the history
HISTCONTROL=ignoredups

# Don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth

# Allows you to cd into directory merely by typing the directory name
shopt -s autocd

# Append to the history file, don't overwrite it
shopt -s histappend

blk='\[\033[01;30m\]'   # Black
red='\[\033[01;31m\]'   # Red
grn='\[\033[01;32m\]'   # Green
ylw='\[\033[01;33m\]'   # Yellow
blu='\[\033[01;34m\]'   # Blue
pur='\[\033[01;35m\]'   # Purple
cyn='\[\033[01;36m\]'   # Cyan
wht='\[\033[01;37m\]'   # White
clr='\[\033[00m\]'      # Reset

# Set history length and size
HISTSIZE=2000
HISTFILESIZE=2000

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Correct simple errors while using cd
shopt -s cdspell

# Add /home/$USER/bin to $PATH
case :$PATH: in
    *:/home/$USER/bin:*) ;;
    *) PATH=/home/$USER/bin:$PATH ;;
esac

# Make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# NNN settings
export NNN_PLUG='u:davecloud;o:fzopen;c:fcd;j:jump;p:preview-tui;i:imgview;v:vidthumb;d:dragdrop'
export NNN_FCOLORS='0000E6310000000000000000'
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_OPTS="H" # Show hidden files
alias nnn='nnn -e'

# Use bash aliases in a separate file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# There are some things one doesn't want in a public git repository
if [ -f ~/.bash_private ]; then
    . ~/.bash_private
fi

# -----------------------------------------------------------------------------
# Functions
# -----------------------------------------------------------------------------

# Find the largest files in a directory
function find_largest_files() {
    du -h -x -s -- * | sort -r -h | head -20;
}

# Display the current Git branch in the Bash prompt.
function git_branch() {
    if [ -d .git ] ; then
        printf "%s" "($(git branch 2> /dev/null | awk '/\*/{print $2}'))";
    fi
}

# Make a directory, then go there
function md() {
    test -n "$1" || return
    mkdir -p "$1" && cd "$1"
}

function extract() {
     if [ -f $1 ] ; then
          case $1 in
               *.tar.bz2)   tar xjvf $1     ;;
               *.tar.gz)    tar xzvf $1     ;;
               *.tar.xz)    tar xvf $1      ;;
               *.bz2)       bzip2 -d $1     ;;
               *.rar)       unrar2dir $1    ;;
               *.gz)        gunzip $1       ;;
               *.tar)       tar xf $1       ;;
               *.tbz2)      tar xjf $1      ;;
               *.tgz)       tar xzf $1      ;;
               *.zip)       unzup2dir $1    ;;
               *.Z)         uncompress $1   ;;
               *.7z)        7z x $1         ;;
               *.ace)       unace x $1      ;;
               *)           echo "'$1' cannot be extracted via extract()"   ;;
          esac
        else
            echo "'$1' is not a valid file"
        fi
}

clear

# -----------------------------------------------------------------------------
# BASH_IT Configurations
# https://github.com/Bash-it/bash-it
# -----------------------------------------------------------------------------

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# Path to the bash it configuration
export BASH_IT="/home/misha/.bash_it"

# Bash theme
# https://bash-it.readthedocs.io/en/latest/themes-list/
export BASH_IT_THEME='bobby'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set the command t for todo.txt-cli
export TODO="t"

# Set the location of the work/project folders
BASH_IT_PROJECT_PATHS="${HOME}/src/git"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Enable display of last command duration
export BASH_IT_COMMAND_DURATION=true

# Minimum time in seconds before command duration is displayed
export COMMAND_DURATION_MIN_SECONDS=1

# Let Bash-it reload itself automatically after enabling or disabling
# aliases, plugins and completions.
export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Load Bash It
source "$BASH_IT"/bash_it.sh
