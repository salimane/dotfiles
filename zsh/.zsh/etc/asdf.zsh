##############
# ASDF #
##############
if [[ -f "$HOME/.asdf/asdf.sh" ]]; then
  . $HOME/.asdf/asdf.sh
  . $HOME/.asdf/completions/asdf.bash
  export PATH="$HOME/.asdf/bin:$HOME/.asdf/shims:$PATH"
fi
