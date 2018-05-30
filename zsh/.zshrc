# Zsh configuration file

# Skip all this for non-interactive shells
[[ -z "$PS1" ]] && return

# setup own fpath
typeset -U fpath
fpath=(~/.zsh/completions ~/.zsh/functions  ~/.zsh/prompts $fpath)

# Load Modules {{{
autoload -Uz colors zmv compinit promptinit vcs_info zkbd history-search-end modify-current-argument colors zed zcalc ignoreeof autopushd pushdignoredups pushdminus zsh-mime-setup
colors
compinit -d ~/.zsh/cache/zcompdump
promptinit
zsh-mime-setup
# }}}


# load zsh configurations {{{
source ~/.zsh/etc/env.zsh
source ~/.zsh/etc/iex.zsh
source ~/.zsh/etc/keybinding.zsh
source ~/.zsh/etc/colors.zsh
source ~/.zsh/etc/alias.zsh
source ~/.zsh/etc/options.zsh
source ~/.zsh/etc/history.zsh
source ~/.zsh/etc/gpg.zsh
source ~/.zsh/etc/golang.zsh
source ~/.zsh/etc/python.zsh
source ~/.zsh/etc/ruby.zsh
source ~/.zsh/etc/asdf.zsh
source ~/.zsh/etc/node.zsh
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
source ~/.zsh/etc/java.zsh
source ~/.zsh/etc/docker.zsh
source ~/.zsh/etc/kube-ps1.zsh

[[ -r /usr/local/share/zsh/site-functions/_aws ]] && source /usr/local/share/zsh/site-functions/_aws
# }}}


# Load MOTD {{{
if [[ -d ~/.motd.d ]]; then
    for motd in ~/.motd.d/*; do
        cat $motd
    done
fi
# }}}


[[ -r ~/.zsh.local ]] && source ~/.zsh.local

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/salimane/.nodenv/versions/7.10.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/salimane/.nodenv/versions/7.10.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/salimane/.nodenv/versions/7.10.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/salimane/.nodenv/versions/7.10.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

# added by travis gem
[ -f /Users/salimane/.travis/travis.sh ] && source /Users/salimane/.travis/travis.sh
