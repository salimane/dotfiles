##############
#    GPG     #
##############

/usr/bin/env gpgconf gpg-agent > /dev/null

GPG_TTY=$(tty)
export GPG_TTY
