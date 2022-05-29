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

# -----------------------------------------------------------------------------
# Aliases
# -----------------------------------------------------------------------------

# Calendar aliases
alias jan='cal -m 01'
alias feb='cal -m 02'
alias mar='cal -m 03'
alias apr='cal -m 04'
alias may='cal -m 05'
alias jun='cal -m 06'
alias jul='cal -m 07'
alias aug='cal -m 08'
alias sep='cal -m 09'
alias oct='cal -m 10'
alias nov='cal -m 11'
alias dec='cal -m 12'

# Directory navigation aliases
alias ..='cd ..;pwd'            # Move to the parent directory
alias ...='cd ../..;pwd'        # Move up two parent directories
alias ....='cd ../../..;pwd'    # Move up three parent directories
alias back='cd $OLDPWD'
alias cd..='cd ..'

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias dir='dir --color=auto'
    alias egrep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias grep='grep --color=auto'
    alias ls='ls --color=auto'
    alias vdir='vdir --color=auto'
fi

# Git aliases
alias g='git'
alias ga='git add .'
alias gb='git branch'
alias gbd='git branch -d'
alias gd='git diff'
alias gf='git fetch'
alias gl='git log --oneline'
alias gpu='git pull'
alias grhm='git reset --hard origin/master'
alias grmc='git rm -r --cached' # Untrack files without deleting them
alias gs='git status'
alias fwl='--force-with-lease'

# Git checkout aliases
alias gco='git checkout'
alias gcoa='git checkout .'
alias gcob='git checkout -b'
alias gcom='git checkout master'

# Git cherry-pick aliases
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gcps='git cherry-pick --skip'

# Git commit aliases
alias gc='git commit -m'
alias gca='git commit --am'
alias gcpatch='git commit -p'

# Git push aliases
alias gp='git push -u origin HEAD'
alias gfwl='git push --force-with-lease'
alias gpfwl='git push --force-with-lease'
alias gps='git push'
alias gpsfwl='git push --force-with-lease'
alias gpsu='git push --set-upstream origin'

# Git rebase aliases
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias gri='git rebase -i'
alias grm='git rebase origin/master'
alias grs='git rebase --skip'

# Git multiple commands aliases
alias gac='git add .; git commit -m'
alias gfrm='git fetch; git rebase origin/master'
alias gsd='git status; git diff'
alias gsda='git status; git diff; git add .'
alias gsdac='git status; git diff; git add .; git commit -m'

# Get top process eating CPU
alias cpu5='ps auxf | sort -nr -k 3 | head -5'
alias cpu10='ps auxf | sort -nr -k 3 | head -10'

# Get top process eating memory
alias mem5='ps auxf | sort -nr -k 4 | head -5'
alias mem10='ps auxf | sort -nr -k 4 | head -10'

# Files aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# List largest directories
alias dir5='du -cksh * | sort -hr | head -n 5'
alias dir10='du -cksh * | sort -hr | head -n 10'

# Safetynets
alias rm ='rm -I --preserve-root' # do not delete / or prompt if deleting more than 3 files at a time

# Manage packages easier
if [ -f /usr/bin/apt ]; then
    alias update='sudo apt update'
    alias upgrade='sudo apt update && sudo apt dist-upgrade'
    alias install='sudo apt install'
fi

# Other aliases
alias c='clear'
alias cp='cp -iv'
alias chmod="chmod -c"
alias df="df -h --exclude=squashfs"
alias diff='colordiff'
alias h='history'
alias tree='tree --dirsfirst -F' # Display the directory structure better
alias mkdir='mkdir -pv' # Make a directory and all parent directories with verbosity.
alias mv='mv -iv'
alias python='python3'
alias reload="source ~/.bashrc"
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'
alias weather='curl wttr.in'
alias wget='wget -c'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
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
