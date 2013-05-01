# Zsh configuration file for Salimane Adjao Moustapha

# Skip all this for non-interactive shells
[[ -z "$PS1" ]] && return

# setup own fpath
typeset -U fpath
fpath=(~/.zsh/functions ~/.zsh/completions ~/.zsh/prompts $fpath)

# Load Modules {{{
autoload -Uz colors zmv compinit promptinit vcs_info zkbd history-search-end smart-insert-last-word modify-current-argument colors zed zcalc ignoreeof autopushd pushdignoredups pushdminus zsh-mime-setup tetris
colors
compinit -d ~/.zsh/cache/zcompdump
promptinit
zsh-mime-setup
# }}}


# load zsh configurations {{{
for src in ~/.zsh/etc/*.zsh
do
    [[ -r $src ]] && source $src
done
# }}}


# Load MOTD {{{
if [[ -d ~/.motd.d ]]; then
    for motd in ~/.motd.d/*; do
        cat $motd
    done
fi
# }}}


[[ -r ~/.zsh.local ]] && source ~/.zsh.local