###########
# ALIASES #
###########

alias cp="cp -i"
alias rm="rm -i"
alias mv="mv -i"
alias ll='ls -l'
alias la='ls -a'
alias du="du -cksh"
alias df="df -h"
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias mkdir='mkdir -p'
alias dus='du -ms * | sort -n'
alias 'cd..=cd ..'
alias tree="tree -A -I 'CVS|*~'"
alias acs="sudo apt-cache search"
alias acsh="sudo apt-cache show"
alias agd="sudo apt-get dist-upgrade -m -y --force-yes "
alias agi="sudo apt-get install -m -y --force-yes "
alias agu="sudo apt-get update"
alias agud="sudo apt-get update && sudo apt-get dist-upgrade -m -y --force-yes "
alias addkey="sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys"
alias info='info --vi-keys'
alias less='less --tab=4 --no-init --LONG-PROMPT --ignore-case --squeeze-blank-line -R'
alias get="curl -O"
alias wgethtml='wget -E -H -k -K -p -nd -o logwget.txt'
alias sed="sed -E"
alias noascii="sed 's/.\\[[0-9][0-9]?m//g'"
alias egrep='egrep --color=auto'
alias grep=egrep
alias fgrep='fgrep --color=auto'
alias grpe=grep
alias pgrep="\grep -P" # PCRE-compatible
alias nano="nano -c"
alias eject="drutil tray eject"
alias quote="sed -Ee $'s/([ \'\"])/\\\\\\\\\\\1/g'"
alias phpcs-fixer="phpcs-fixer --level=all --fixers=indentation,linefeed,trailing_spaces,php_closing_tag,short_tag,return,visibility,braces,phpdoc_params,eof_ending,extra_empty_lines,include,controls_spaces,elseif"
alias phpunit="phpunit --coverage-text"
# Make sure aliases are expanded when using sudo.
alias sudo='sudo '
#alias make="CFLAGS='-Wall' make"
setopt complete_aliases
export GREP_OPTIONS="--color=auto" # removes color when piping
export GREP_COLOR='1;31' # highlight matches in red
type colordiff >/dev/null 2>&1 && alias diff="colordiff -u" || alias diff="diff -u"
type colormake >/dev/null 2>&1 && alias make=colormake


PAGER=`which-command less`
LESS=`which-command less`
EDITOR=`which-command nano`
# alias git to hub
if [[ -f ~/bin/hub ]]; then
  eval "$(hub alias -s)"
fi

function TRAPINT {
  # Store the current buffer in the history.
  zle && print -s -r -- $BUFFER

  # Return the default exit code so Zsh aborts the current command.
  return $1
}

if [[ -f ~/.shell_aliases ]]; then
  . ~/.shell_aliases
fi

# Enable color support of ls
if [[ "$TERM" != "dumb" ]]; then
    if [[ -x `which dircolors` ]]; then
        eval `dircolors -b`
        alias 'ls=ls --color=auto'
    fi
fi

function ls {
    command ls -AFGh "$@";
}

function gitk {
    command gitk \
        --max-count=200 \
        $(command git rev-parse --symbolic-full-name --remotes --branches) \
        $@ &
    disown %command
}

function xpdf {
    command xpdf "$@" &
    disown %command
}
