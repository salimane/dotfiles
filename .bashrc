
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


if [ -x /usr/bin/dircolors ]; then
  eval "`dircolors -b`"
  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi


function ls { command ls -Fh --color=auto "$@"; }


# source the bash-completion file
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi


#some alias
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'
alias 'tf=tail -f'
alias 'grep=grep --colour'
alias "tree=tree -A -I 'CVS|*~'"
alias 'rm=rm -i'
alias 'mv=mv -i'
alias 'cp=cp -i'
alias 'mkdir=mkdir -p'
alias 'dus=du -ms * | sort -n'
alias 'cd..=cd ..'
alias acs="sudo apt-cache search"
alias acsh="sudo apt-cache show"
alias agd="sudo apt-get dist-upgrade"
alias agi="sudo apt-get install"
alias agu="sudo apt-get update"
alias addkey="sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys"


#keyboard input system
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
export MOZ_DISABLE_PANGO=1

#saves a timestamp for each command
export HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S - '

# erase duplicate lines from the history; ignore lines that begin with a space
HISTCONTROL=erasedups:ignorespace

#Write your commands to the history file as soon as you use them, not at the end of a session
PROMPT_COMMAND='history -a'

# extend the history (default 500)
HISTSIZE=10000
HISTFILESIZE=10000

# append to history rather than overwriting
shopt -s histappend

# don't try to complete on nothing
shopt -s no_empty_cmd_completion

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# fix backspace in vim and others
# stty erase

# don't print ^C, etc
stty -echoctl

function ll { ls -l "$@"; }

shorten (){
    googl shorten $1 | pbcopy
    echo "$1 shortened and copied to clipboard"
}


# set a fancy prompt
case "$TERM" in
  xterm-color) color_prompt=yes;;
esac
function prompt {
	local WHITE="\[\033[1;37m\]"
	local GREEN="\[\033[0;32m\]"
	local CYAN="\[\033[0;36m\]"
	local GRAY="\[\033[0;37m\]"
	local BLUE="\[\033[0;34m\]"
export PS1="
${GREEN}\u${CYAN}@${BLUE}\h ${CYAN}\w${GRAY}
$ "
}
prompt


# MySQL prompt
export MYSQL_PS1="mysql \u@\h [\d]\n>"

#android source compilation
export JAVA_HOME=/usr/lib/jvm/java-6-sun/
export ANDROID_JAVA_HOME=$JAVA_HOME
export PATH=$PATH:~/bin:$JAVA_HOME/bin:/home/salimane/android-sdk-linux_x86/tools/:/home/salimane/android-sdk-linux_x86/platform-tools/
alias makedroid='make -j$(grep -c processor /proc/cpuinfo) TARGET_PRODUCT=htc_bravo | tee build-$(date +%d%m%y%H%M).log'


#rvm stuff
export PATH=$PATH:/home/salimane/.rvm/bin
export PATH=$PATH:/home/salimane/.rvm/scripts/
clear
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Git tab completion
source ~/git-completion.bash
alias git-info='. /home/$USER/git-info.sh'

