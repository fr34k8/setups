HISTCONTROL=ignoreboth:erasedups HISTSIZE=100000 HISTFILESIZE=200000
shopt -s histappend checkwinsize
PROMPT_COMMAND='history -a'
cdc() { for fn in "$@"; do source-highlight --out-format=esc -o STDOUT -i $fn 2>/dev/null || /bin/cat $fn; done; }; alias cat='cdc' # Keep here next to cdc definition
ls --color=al > /dev/null 2>&1 && alias ls='ls -F --color=al' || alias ls='ls -G'
md () { [ $# = 1 ] && mkdir -p "$@" && cd "$@" || echo "Error - no directory passed!"; }
bup () { [ $# = 1 ] && { cp -v ~/$1 ~/Dropnot/setups; cd ~/Dropnot/setups; git fetch; git merge origin/master; git add $1; git commit -m"$1 update"; git push origin master; cp -v $1 ~; cd -; } || echo "Error - no filename passed!";}
git_branch () { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'; }
HOST='\033[02;36m\]\h'; HOST=' '$HOST
TIME='\033[01;31m\]\t \033[01;32m\]'
LOCATION=' \033[01;34m\]`pwd | sed "s#\(/[^/]\{1,\}/[^/]\{1,\}/[^/]\{1,\}/\).*\(/[^/]\{1,\}/[^/]\{1,\}\)/\{0,1\}#\1_\2#g"`'
BRANCH=' \033[00;33m\]$(git_branch)\[\033[00m\]\n\$ '
PS1=$TIME$USER$HOST$LOCATION$BRANCH
PS2='\[\033[01;36m\]>'
set -o vi # vi at command line
export EDITOR=vim
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PYTHONPATH=/usr/local/lib/python2.7/site-packages/ # for meld mdd 4/19/2014
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)" # friendly for non-text files
newalias() { echo "alias ${1}" >> $HOME/.bash_aliases; source ~/.bash_aliases; }
test -f ~/.bash_aliases && . $_
test -f ~/.git-completion.bash && . $_
test -s ~/.autojump/etc/profile.d/autojump.sh && . $_
[ ${BASH_VERSINFO[0]} -ge 4 ] && shopt -s autocd
[ -f /etc/bash_completion ] && ! shopt -oq posix && . /etc/bash_completion
[ -z "$TMUX" ] && command -v tmux > /dev/null && TERM=xterm-256color && exec tmux
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# fhdjfhdjfhd
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
