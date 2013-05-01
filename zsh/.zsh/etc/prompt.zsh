###################
# PROMPT SETTINGS #
###################

function prompt_char {
  command git branch >/dev/null 2>/dev/null && echo '±' && return
  hg root >/dev/null 2>/dev/null && echo '☿' && return
  svn info >/dev/null 2>/dev/null && echo '⚡' && return
  echo '⚛'
}

function virtualenv_info {
  [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function parse_git_dirty {
    [[ -n $(command git status -s 2> /dev/null) ]] && echo "✗";
}

function prompt_precmd {

  if [[ -n $RUN_VCS_INFO ]]; then
    vcs_info
  else
    vcs_info_msg_0_=
  fi

  ssh_msg=
  if [[ -n "$SSH_CONNECTION" ]]; then
     ssh_from=(${=SSH_CONNECTION})
     ssh_msg="(← $ssh_from[1])"
  fi

  PROMPT="
$blue%n%{$reset_color%} at $yellow%m%{$reset_color%} ${ssh_msg} in $cyan${PWD/#$HOME/~}%{$reset_color%}
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