############
#  COLORS  #
############

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

# Colorize stderr in red. Very useful when looking for errors.
exec 2>>(while read -r -k -u 0 line; do
    printf '\e[91m%s\e[0m' "$line";
    print -n $'\0';
done &)