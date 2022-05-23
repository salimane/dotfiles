##############
# GOLANG #
##############

# export GOROOT="/usr/lib/go"
export GOPATH="$HOME/src/go"
export PATH=$PATH:$GOPATH/bin
export GOSUMDB=off
# curl -sLk https://git.io/gobrew | sh -
if [[ -d $HOME/.gobrew ]]; then
  export PATH="$HOME/.gobrew/current/bin:$HOME/.gobrew/bin:$PATH"
fi
