##############
# HISTORY #
##############

export HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S - '
PROMPT_COMMAND='history -a'
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd.."
setopt hist_ignore_all_dups hist_save_nodups share_history hist_ignore_space hist_reduce_blanks hist_verify inc_append_history

function history-all {
    history -E 1
}