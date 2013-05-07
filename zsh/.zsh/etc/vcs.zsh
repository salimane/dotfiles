#######################
#  VCS (git, hg, svn)  #
#######################

function parse_git_status {
  local st="$(command git status 2>/dev/null)"
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

zstyle ':vcs_info:*' enable git hg svn bzr
zstyle ':vcs_info:(hg*|git*):*' get-revision true
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr "$yellow●$default" # %u
zstyle ':vcs_info:*' stagedstr "$green●$default" # %c
zstyle ':vcs_info:*' actionformats "[$green%b%c$default/$red%a$default:$blue%s$default]"
zstyle ':vcs_info:*' branchformat '%b'
zstyle ':vcs_info:(hg*|git*):*' actionformats "[$green%b%c$default/$red%a$(parse_git_status):$yellow%.7i$default:$blue%s$default]"
