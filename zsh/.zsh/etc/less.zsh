###################
# LESS        #
###################

if [[ -x $(which less) ]]
then
    export PAGER="less"
    export LESS="--ignore-case --LONG-PROMPT --QUIET --chop-long-lines -Sm --RAW-CONTROL-CHARS --quit-if-one-screen --no-init"
    export LESSHISTFILE='-'
    if [[ -x $(which lesspipe.sh) ]]
    then
        LESSOPEN="| lesspipe.sh %s"
        export LESSOPEN
    fi
fi