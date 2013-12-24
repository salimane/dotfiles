SSHPID=`ps ax|grep -c "[s]sh-agent"`
if test ! -f ~/.ssh-env && (( $SSHPID == 0 ))
then
    ssh-agent > ~/.ssh-env
    source ~/.ssh-env
    ssh-add
else
    if [[ -f "$HOME/.ssh-env" ]]; then
        source ~/.ssh-env
    fi
fi
