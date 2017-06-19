##############
# NODE #
##############
export NODENV_ROOT="$HOME/.nodenv"
if [[ -d "$NODENV_ROOT/bin" ]]; then
  export PATH="$NODENV_ROOT/bin:$PATH"
fi
if [[ -d "$NODENV_ROOT/shims" ]]; then
  export PATH="$NODENV_ROOT/shims:$PATH"
fi

eval "$(nodenv init -)"
