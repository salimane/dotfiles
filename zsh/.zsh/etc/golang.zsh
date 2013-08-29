##############
# GOLANG #
##############

#export GOROOT="/usr/lib/go"
#export GOARCH="amd64"
#export GOOS="linux"
#export GOPATH="$HOME/src/mygo"
#export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
if test -f /opt/boxen/goenv/bin/goenv
then
    export PATH="/opt/boxen/goenv/bin:$PATH"
	eval "$(goenv init -)"
fi

