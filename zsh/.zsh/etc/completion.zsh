################
#  COMPLETION  #
################

zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' verbose yes
zstyle ':completion:*' use-cache true
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' format '%BCompleting %d%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:processes' menu yes select=2
zstyle ':completion:*:default' menu select=0
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
bindkey '^I' complete-word
#setopt nolistambiguous completeinword
zstyle ':completion:::::' completer _expand _complete _prefix _ignored _approximate
zstyle ':completion:*:(^approximate):*' matcher-list 'm:{a-z}={A-Z}'
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX + $#SUFFIX) / 3 )) )'
zstyle ':completion:*:expand:*' tag-order all-expansions
zstyle ':completion:*:expand:*' keep-prefix yes
zstyle ':completion:*' list-suffixes yes
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:default' list-prompt '%p'
zstyle ':completion:*' format '    %B%d%b:'
#zstyle ':completion:*:corrections' format '    %B%d%b (errors: %e)'
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
zstyle ':completion:*' menu select=0
setopt list_ambiguous
