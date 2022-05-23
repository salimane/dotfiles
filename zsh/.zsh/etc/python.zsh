##############
# PYTHON #
##############
# export PYENV_ROOT="$HOME/.pyenv"
# if [[ -d "$PYENV_ROOT/bin" ]]; then
#   export PATH="$PYENV_ROOT/bin:$PATH"
# fi
# if [[ -d "$PYENV_ROOT/shims" ]]; then
#   export PATH="$PYENV_ROOT/shims:$PATH"
# fi
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
export PYTHON_CONFIGURE_OPTS="--enable-shared"


# pyenv() {
#   eval "$(command pyenv init -)"
#   eval "$(command pyenv virtualenv-init -)"
#   pyenv "$@"
# }

export PATH="$(python -m site --user-base)/bin:${PATH}"
# eval "$(register-python-argcomplete pipx)"