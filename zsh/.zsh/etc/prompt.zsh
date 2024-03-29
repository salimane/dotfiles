###################
# PROMPT SETTINGS #
###################

function prompt_char {
  command git branch >/dev/null 2>/dev/null && echo '±' && return
  hg root >/dev/null 2>/dev/null && echo '☿' && return
  svn info >/dev/null 2>/dev/null && echo '⚡' && return
  echo '★'
}

function virtualenv_info {
  [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function parse_git_dirty {
    [[ -n $(command git status -s 2> /dev/null) ]] && echo "✗";
}

function git_user_email {
  echo `command git config user.email` | awk -F\@ '{print " (git:"$2")"}';
}

# Must run vcs_info when changing directories.
function prompt_chpwd {
  FORCE_RUN_VCS_INFO=1
}

function prompt_precmd {

  if [[ -z $(command git ls-files --other --exclude-standard 2> /dev/null) ]] {
      zstyle ':vcs_info:*' formats "[$green%b$default%u%c$(parse_git_status):$yellow%.7i$default:$blue%s$default]"
  } else {
      zstyle ':vcs_info:*' formats "[$green%b$default%u%c$red✗$(parse_git_status):$yellow%.7i$default:$blue%s$default]"
  }

  if [[ -n $FORCE_RUN_VCS_INFO ]]; then
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
$blue%n%{$reset_color%} at $yellow%m%{$reset_color%}$(git_user_email) ${ssh_msg} in $cyan${PWD/#$HOME/~}%{$reset_color%}
$(virtualenv_info)%(?.$green.$red)$(prompt_char)%{$reset_color%} "
  PROMPT='$(kube_ps1)'$PROMPT

  #### right prompt
  RPROMPT="${vcs_info_msg_0_}"

  ### My prompt for loops
  PROMPT2="%_> "

  ### My prompt for selections
  PROMPT3='{ … } '

  # MySQL prompt
  export MYSQL_PS1="mysql \u@\h [\d]\n>"
}

add-zsh-hook chpwd prompt_chpwd
add-zsh-hook precmd prompt_precmd
