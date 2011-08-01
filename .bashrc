
# some more ls aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

#keyboard input system
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
export MOZ_DISABLE_PANGO=1

#command prompt stuff
[ -z "$PS1" ] && return
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
case "$TERM" in
  xterm-color) color_prompt=yes;;
esac
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac
if [ -x /usr/bin/dircolors ]; then
  eval "`dircolors -b`"
  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi
shopt -s histappend
shopt -s checkwinsize
export HISTCONTROL=ignoreboth
export HISTSIZE=1000000 HISTFILESIZE=1000000
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi
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
