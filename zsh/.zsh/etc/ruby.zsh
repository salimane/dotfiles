##############
# RUBY #
##############
if [[ -d "$HOME/.rbenv/bin" ]]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
fi
if [[ -d "$HOME/.rbenv/shims" ]]; then
  export PATH="$HOME/.rbenv/shims:$PATH"
fi
# eval "$(rbenv init -)"

rbenv() {
  eval "$(command rbenv init -)"
  rbenv "$@"
}
