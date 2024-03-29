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
alias sg='cd ~/src/git/'

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

# Docker aliases
alias db='docker build .'
alias di='docker images'
alias dl='docker logs'
alias dps='docker ps -a'
alias dpu='docker push'
alias dr='docker run'
alias dstart='docker start'
alias dstats='docker stats'
alias dstop='docker stop'
alias dv='docker version'

# Git aliases
alias g='git'
alias ga='git add .'
alias gb='git branch'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gcl='git clone'
alias gclm='git clone --mirror'
alias gd='git diff'
alias gds='git diff --staged'
alias gf='git fetch'
alias gl='git log --oneline'
alias gpu='git pull'
alias grhm='git reset --hard origin/master'
alias grl='git reflog'
alias grmc='git rm -r --cached' # Untrack files without deleting them
alias gs='git status'
alias gst='git stash'
alias gstd='git stash drop'
alias gstp='git stash pop'
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
alias gcane='git commit --am --no-edit'
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
alias gaca='git add .; git commit --am'
alias gacap='git add .; git commit --am --no-edit; git push --force-with-lease'
alias gacapfwl='git add .; git commit --am --no-edit; git push --force-with-lease'
alias gacaps='git add .; git commit --am --no-edit; git push --force-with-lease'
alias gacapsfwl='git add .; git commit --am --no-edit; git push --force-with-lease'
alias gacanep='git add .; git commit --am --no-edit; git push --force-with-lease'
alias gacanepfwl='git add .; git commit --am --no-edit; git push --force-with-lease'
alias gacaneps='git add .; git commit --am --no-edit; git push --force-with-lease'
alias gacanepsfwl='git add .; git commit --am --no-edit; git push --force-with-lease'
alias gacanep='git add .; git commit --am --no-edit; git push --force-with-lease'
alias gacpc='git add .; git cherry-pick --continue'
alias gacps='git add .; git cherry-pick --skip'
alias garc='git add .; git rebase --continue'
alias gars='git add .; git rebase --skip'
alias gfrhm='git fetch; git rebase --hard origin/master'
alias gfrm='git fetch; git rebase origin/master'
alias gp!='git status; git diff; git add .; git commit --am --no-edit; git push --force-with-lease'
alias gsd='git status; git diff'
alias gsda='git status; git diff; git add .'
alias gsdac='git status; git diff; git add .; git commit -m'
alias gsdaca='git status; git diff; git add .; git commit -am'
alias gsdacane='git status; git diff; git add .; git commit --am --no-edit'
alias gsdacanep='git status; git diff; git add .; git commit --am --no-edit; git push --force-with-lease'
alias gsdacanepfwl='git status; git diff; git add .; git commit --am --no-edit; git push --force-with-lease'
alias gsdacaneps='git status; git diff; git add .; git commit --am --no-edit; git push --force-with-lease'
alias gsdacanepsfwl='git status; git diff; git add .; git commit --am --no-edit; git push --force-with-lease'
alias gsdacap='git status; git diff; git add .; git commit --am --no-edit; git push --force-with-lease'
alias gsdacapfwl='git status; git diff; git add .; git commit --am --no-edit; git push --force-with-lease'
alias gsdacaps='git status; git diff; git add .; git commit --am --no-edit; git push --force-with-lease'
alias gsdacapsfwl='git status; git diff; git add .; git commit --am --no-edit; git push --force-with-lease'

# Get top process eating CPU
alias cpu5='ps auxf | sort -nr -k 3 | head -5'
alias cpu10='ps auxf | sort -nr -k 3 | head -10'

# Get top process eating memory
alias mem5='ps auxf | sort -nr -k 4 | head -5'
alias mem10='ps auxf | sort -nr -k 4 | head -10'

# Files aliases
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'

# List largest directories
alias dir5='du -cksh * | sort -hr | head -n 5'
alias dir10='du -cksh * | sort -hr | head -n 10'

# Kubernetes aliases
alias ka='kubectl apply -f'
alias kco='kubectl config'
alias kcf='kubectl create -f'
alias kci='kubectl cluster-info'
alias kdd='kubectl describe deploy'
alias kdelp='kubectl delete pod'
alias kdn='kubectl describe node'
alias kdp='kubectl describe pod'
alias kds='kubectl describe svc'
alias kgd='kubectl get deploy'
alias kgn='kubectl get nodes -w'
alias kgp='kubectl get pods'
alias kgr='kubectl get rc'
alias kgs='kubectl get svc'
alias kl='kubectl logs -f'
alias kr='kubectl run'
alias ktn='kubectl top node'
alias ktp='kubectl top pod'
alias kv='kubectl version'

# Safetynets
alias rm='rm -I --preserve-root' # do not delete / or prompt if deleting more than 3 files at a time

# Manage packages easier
if [ -f /usr/bin/apt ]; then
    alias install='sudo apt install'
    alias update='sudo apt update'
    alias upgrade='sudo apt update && sudo apt dist-upgrade'
fi

# Other aliases
alias c='clear'
alias chmod='chmod -c'
alias cp='cp -iv'
alias df='df -h --exclude=squashfs'
alias diff='colordiff'
alias e='exit'
alias gprmz='curl -s "https://api.github.com/search/issues?q=+type:pr+user:michaelzaslavsky&sort=created&order=asc" | jq '.total_count''
alias h='history'
alias home='autorandr docked-home'
alias ht='htop'
alias igt='sudo intel_gpu_top'
alias mkdir='mkdir -pv' # Make a directory and all parent directories with verbosity.
alias mv='mv -iv'
alias python='python3'
alias redirect='curl vsSo/dev/null'
alias reload='source ~/.bashrc'
alias s2='saml2aws login'
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'
alias tf='terraform fmt'
alias tmux='tmux -u'
alias tmuxr='tmux source-file ~/.tmux.conf'
alias tree='tree --dirsfirst -F' # Display the directory structure better
alias vai='vainfo'
alias weather='curl wttr.in'
alias wget='wget -c'
alias work='autorandr docked-work'
eval $(thefuck --alias)
