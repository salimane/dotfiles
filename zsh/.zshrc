# Zsh configuration file for Salimane Adjao Moustapha

##############
# KEYBINDING #
##############
bindkey -e
autoload zkbd
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end
bindkey "^R" history-incremental-search-backward
bindkey "^i" menu-expand-or-complete
bindkey "^T" tetris
bindkey -s "^[l" "^E|less^M"
bindkey -s "^[c" "^E|"
bindkey -s "^[b" "^E\\"
autoload smart-insert-last-word
zle -N insert-last-word smart-insert-last-word
zstyle :insert-last-word match '*([^[:space:]][[:alpha:]/\\]|[[:alpha:]/\\][^[:space:]])*'
bindkey '^]' insert-last-word
autoload -U modify-current-argument
_quote-previous-word-in-single() {
  modify-current-argument '${(qq)${(Q)ARG}}'
  zle vi-forward-blank-word
}
zle -N _quote-previous-word-in-single
bindkey '^[S' _quote-previous-word-in-single
_quote-previous-word-in-double() {
  modify-current-argument '${(qqq)${(Q)ARG}}'
  zle vi-forward-blank-word
}
# make search up and down work, so partially type and hit up/down to find relevant stuff
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

bindkey "^[[H" beginning-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[OH" beginning-of-line
bindkey "^[[F"  end-of-line
bindkey "^[[4~" end-of-line
bindkey "^[OF" end-of-line
bindkey ' ' magic-space    # also do history expansion on space

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

bindkey '^[[Z' reverse-menu-complete

# Make the delete key (or Fn + Delete on the Mac) work instead of outputting a ~
bindkey '^?' backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char
bindkey "\e[3~" delete-char


############
#  COLORS  #
############
autoload -Uz colors && colors
zmodload -i zsh/complist # colorful listings
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
local red="%{${fg[red]}%}"
local blue="%{${fg[blue]}%}"
local green="%{${fg[green]}%}"
local cyan="%{${fg[cyan]}%}"
local magenta="%{${fg[magenta]}%}"
local yellow="%{${fg[yellow]}%}"
local gray="%{${fg[gray]}%}"
local default="%{${fg[default]}%}"


###########
# ALIASES #
###########
function ls { command ls -AFGh --color=auto "$@"; }
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
alias agd="sudo apt-get dist-upgrade"
alias agi="sudo apt-get install"
alias agu="sudo apt-get update"
alias agud="sudo apt-get update && sudo apt-get dist-upgrade"
alias addkey="sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys"
alias info='info --vi-keys'
alias less='less --tab=4 --no-init --LONG-PROMPT --ignore-case --squeeze-blank-line -R'
alias get="curl -O"
alias sed="sed -E"
alias noascii="sed 's/.\\[[0-9][0-9]?m//g'"
alias egrep='egrep --color=auto'
alias grep=egrep
alias fgrep='fgrep --color=auto'
alias grpe=grep
alias pgrep="\grep -P" # PCRE-compatible
alias nano="nano -c"
#alias make="CFLAGS='-Wall' make"
setopt complete_aliases
export GREP_OPTIONS="--color=auto" # removes color when piping
export GREP_COLOR='1;31' # highlight matches in red
[[ -x $(which colordiff) ]] && alias diff="colordiff -u" || alias diff="diff -u"
[[ -x $(which colormake) ]] && alias make=colormake
alias eject="drutil tray eject"
alias quote="sed -Ee $'s/([ \'\"])/\\\\\\\\\\\1/g'"
EDITOR=`which-command nano`
PAGER=`which-command less`
LESS=`which-command less`

TRAPINT() {
  # Store the current buffer in the history.
  zle && print -s -r -- $BUFFER

  # Return the default exit code so Zsh aborts the current command.
  return $1
}
if [[ -f ~/.shell_aliases ]]; then
  . ~/.shell_aliases
fi
# Make sure aliases are expanded when using sudo.
alias sudo='sudo '
gitk() {
  command gitk \
      --max-count=200 \
      $(git rev-parse --symbolic-full-name --remotes --branches) \
      $@ &
  disown %command
}
xpdf() {
    command xpdf "$@" &
    disown %command
}


###########################
#  Keyboard Input system  #
##########################
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
export MOZ_DISABLE_PANGO=1


#################
#  ZSH options  #
#################
export HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S - '
PROMPT_COMMAND='history -a'
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt appendhistory
setopt hist_ignore_all_dups hist_save_nodups share_history hist_ignore_space hist_reduce_blanks
function history-all { history -E 1 }
unsetopt correctall
setopt auto_menu   
unsetopt menu_complete
setopt prompt_subst auto_resume nobeep noclobber auto_cd auto_pushd pushd_ignore_dups correct list_packed noautoremoveslash nolistbeep extended_glob interactive_comments
autoload zed zcalc tetris ignoreeof autopushd pushdignoredups pushdminus
# Be paranoid, new files are readable/writable by me only.
#umask 077
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'



#####################
# FUNCTION SETTINGS #
#####################
typeset -U fpath
# ~/.zsh/functions/completion is a symbolic link to the Completion directory
# of a Zsh git checkout. Use it to get the newest completions if available.
if [[ -d ~/.zsh/functions/completion ]]; then
    fpath=(~/.zsh/functions/completion/*/*(/) $fpath)
fi
# Set correct fpath to allow loading my functions (including completion
# functions).
fpath=(~/.zsh/functions $fpath)
if [[ -d ~/.zsh/functions ]]; then
    autoload -Uz ${fpath[1]}/^_*(^/:t)
fi
autoload -Uz add-zsh-hook
# Load zmv (zsh move)
autoload -Uz zmv
if [[ -f ~/.git-flow-completion.zsh ]]; then
  . ~/.git-flow-completion.zsh
fi

source /etc/zsh_command_not_found

export PATH="~/android-sdk-linux/tools:~/android-sdk-linux/platform-tools:$PATH"
export PATH="~/bin:~/.cabal/bin:$PATH"

#######################
#  GIT (branch, vcs)  #
#######################
#load vcs_info if the necessary files are available in ~/.zsh/functions/vcs_info (often a
# symbolic link to current checkout of Zsh's sources).
if [[ -d ~/.zsh/functions/vcs_info ]]; then
 fpath=(~/.zsh/functions/vcs_info/
        ~/.zsh/functions/vcs_info/Backends
        $fpath)
fi
parse_git_status() {
  local st="$(git status 2>/dev/null)"
  if [[ -n "$st" ]]; then
    local -a arr
    arr=(${(f)st})
    if [[ $arr[2] =~ 'Your branch is' ]]; then
      if [[ $arr[2] =~ 'ahead' ]]; then
        echo "$green↑"
      elif [[ $arr[2] =~ 'diverged' ]]; then
        echo "$red↕"
      else
        echo "$yellow↓"
      fi
    fi
  fi
}

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git hg svn bzr
zstyle ':vcs_info:(hg*|git*):*' get-revision true
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr "$yellow●$default" # %u
zstyle ':vcs_info:*' stagedstr "$green●$default" # %c
zstyle ':vcs_info:*' actionformats "[$green%b%c$default/$red%a$default:$blue%s$default]"
zstyle ':vcs_info:*' branchformat '%b'
zstyle ':vcs_info:(hg*|git*):*' actionformats "[$green%b%c$default/$red%a$(parse_git_status):$yellow%.7i$default:$blue%s$default]"
FORCE_RUN_VCS_INFO=1
# Must run vcs_info when changing directories.
prompt_chpwd() {
  FORCE_RUN_VCS_INFO=1
}
add-zsh-hook chpwd prompt_chpwd
RUN_VCS_INFO=1
function prompt_char {
  git branch >/dev/null 2>/dev/null && echo '±' && return
  hg root >/dev/null 2>/dev/null && echo '☿' && return
  svn info >/dev/null 2>/dev/null && echo '⚡' && return
  echo '⚛'
}
function virtualenv_info {
  [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}
parse_git_dirty(){ [[ -n $(git status -s 2> /dev/null) ]] && echo "✗"; }

###################
# SSH-AGENT       #
###################

SSH_ENV="$HOME/.ssh/environment"

# start the ssh-agent
function start_agent {
  echo "Initializing new SSH agent..."
  # spawn ssh-agent
  ssh-agent | sed 's/^echo/#echo/' > "$SSH_ENV"
  echo succeeded
  chmod 600 "$SSH_ENV"
  . "$SSH_ENV" > /dev/null
  ssh-add
}

# test for identities
function test_identities {
  # test whether standard identities have been added to the agent already
  ssh-add -l | grep "The agent has no identities" > /dev/null
  if [[ $? -eq 0 ]]; then
    ssh-add
    # $SSH_AUTH_SOCK broken so we start a new proper agent
    if [[ $? -eq 2 ]];then
      start_agent
    fi
  fi
}

# check for running ssh-agent with proper $SSH_AGENT_PID
if [ -n "$SSH_AGENT_PID" ]; then
  ps -ef | grep "$SSH_AGENT_PID" | grep ssh-agent > /dev/null
  if [[ $? -eq 0 ]]; then
		test_identities
  fi
# if $SSH_AGENT_PID is not properly set, we might be able to load one from
# $SSH_ENV
else
	if [[ -f "$SSH_ENV" ]]; then
		. "$SSH_ENV" > /dev/null
  fi
  ps -ef | grep "$SSH_AGENT_PID" | grep -v grep | grep ssh-agent > /dev/null
  if [[ $? -eq 0 ]]; then
    test_identities
  else
    start_agent
  fi
fi

###################
# PROMPT SETTINGS #
###################
prompt_precmd() {
  if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
    zstyle ':vcs_info:*' formats "[$green%b$default%u%c$(parse_git_status):$yellow%.7i$default:$blue%s$default]"
  } else {
    zstyle ':vcs_info:*' formats "[$green%b$default%u%c$red✗$(parse_git_status):$yellow%.7i$default:$blue%s$default]"
  }
  if [[ -n $RUN_VCS_INFO ]]; then
    vcs_info
  else
    vcs_info_msg_0_=
  fi

  PROMPT="
$blue%n%{$reset_color%} at $yellow%m%{$reset_color%} in $cyan${PWD/#$HOME/~}%{$reset_color%}
$(virtualenv_info)$(prompt_char) $gray"

  #### right prompt
  RPROMPT="${vcs_info_msg_0_}"

  ### My prompt for loops
  PROMPT2="%_> "

  ### My prompt for selections
  PROMPT3='{ … } '

  # MySQL prompt
  export MYSQL_PS1="mysql \u@\h [\d]\n>"
}
add-zsh-hook precmd prompt_precmd


############
# Mail #
############
MAILCHECK=360
MAILPATH=$HOME/Mail


############
# Terminal #
############
stty stop undef
case "${TERM}" in
xterm)
  export TERM=xterm-color
  ;;
kterm)
  export TERM=kterm-color
  ;;
cons25)
  unset LANG
  export LSCOLORS=ExFxCxdxBxegedabagacad
  export LS_COLORS='di=02;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors \
    'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
  ;;
esac
case "${TERM}" in
screen*|kterm*|xterm*)
  precmd() {
    echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
  }
  export LSCOLORS=exfxcxdxbxegedabagacad
  export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
  ;;
esac


################
#  COMPLETION  #
################
autoload -Uz compinit && compinit -d ~/.zsh/cache/zcompdump
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' verbose yes
zstyle ':completion:*' use-cache true
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' format '%BCompleting %d%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:processes' menu yes select=2
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
bindkey '^I' complete-word
setopt nolistambiguous completeinword
zstyle ':completion:::::' completer _expand _complete _prefix _ignored _approximate
zstyle ':completion:*:(^approximate):*' matcher-list 'm:{a-z}={A-Z}'
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX + $#SUFFIX) / 3 )) )'
zstyle ':completion:*:expand:*' tag-order all-expansions
zstyle ':completion:*:expand:*' keep-prefix yes
zstyle ':completion:*' list-suffixes yes
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:default' list-prompt '%p'
zstyle ':completion:*' format '    %B%d%b:'
zstyle ':completion:*:corrections' format '    %B%d%b (errors: %e)'
zstyle ':completion:*:warnings' format '    %Bno matches for %d%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' separate-sections yes
zle_highlight=(suffix:none)
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:(cd|mv|cp):*' ignore-parents parent pwd
zstyle ':completion:*:all-files' ignore-line other
zstyle ':completion:*:(mv|cp):all-files' ignore-line no
zstyle ':completion:*:*:-command-:*' ignored-patterns './config.*'
zle -C complete-files complete-word _generic
zstyle ':completion:complete-files:*' completer _files
bindkey '^F' complete-files

# Colorize stderr in red. Very useful when looking for errors.
exec 2>>(while read -r -k -u 0 line; do
    printf '\e[91m%s\e[0m' "$line";
    print -n $'\0';
done &)
