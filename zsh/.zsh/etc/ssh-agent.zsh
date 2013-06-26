SSHPID=`ps ax|grep -c "[s]sh-agent"`
if (( $SSHPID == 0 ))
then
    ssh-agent > ~/.ssh-env
    source ~/.ssh-env
    ssh-add
else
    source ~/.ssh-env
fi
