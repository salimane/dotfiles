SSHPID=`ps ax|grep -c "[s]sh-agent"`
if (( $SSHPID == 0 ))
then
    rm -rf ~/.ssh-env
    ssh-agent > ~/.ssh-env
    source ~/.ssh-env
    ssh-add
else
    if [[ -f "$HOME/.ssh-env" ]]; then
        source ~/.ssh-env
    fi
fi
