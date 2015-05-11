# Zsh configuration file

# Skip all this for non-interactive shells
[[ -z "$PS1" ]] && return

# setup own fpath
typeset -U fpath
fpath=(~/.zsh/completions ~/.zsh/functions  ~/.zsh/prompts $fpath)

# Load Modules {{{
autoload -Uz colors zmv compinit promptinit vcs_info zkbd history-search-end smart-insert-last-word modify-current-argument colors zed zcalc ignoreeof autopushd pushdignoredups pushdminus zsh-mime-setup tetris
colors
compinit -d ~/.zsh/cache/zcompdump
promptinit
zsh-mime-setup
# }}}


# load zsh configurations {{{
source ~/.zsh/etc/keybinding.zsh
source ~/.zsh/etc/colors.zsh
source ~/.zsh/etc/alias.zsh
source ~/.zsh/etc/options.zsh
source ~/.zsh/etc/history.zsh
source ~/.zsh/etc/golang.zsh
source ~/.zsh/etc/ruby.zsh
source ~/.zsh/etc/vcs.zsh
source ~/.zsh/etc/ssh-agent.zsh
source ~/.zsh/etc/less.zsh
source ~/.zsh/etc/locale.zsh
source ~/.zsh/etc/prompt.zsh
source ~/.zsh/etc/mail.zsh
source ~/.zsh/etc/terminal.zsh
source ~/.zsh/etc/completion.zsh
source ~/.zsh/etc/heroku.zsh
source ~/.zsh/etc/aws_zsh_completer.zsh
source ~/.zsh/etc/boxen.zsh
# }}}


# Load MOTD {{{
if [[ -d ~/.motd.d ]]; then
    for motd in ~/.motd.d/*; do
        cat $motd
    done
fi
# }}}


[[ -r ~/.zsh.local ]] && source ~/.zsh.local
