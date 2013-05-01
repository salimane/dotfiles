#################
#  ZSH options  #
#################

#unsetopt correctall
setopt auto_menu
unsetopt menu_complete
setopt prompt_subst auto_resume nobeep noclobber auto_cd auto_pushd pushd_ignore_dups list_packed noautoremoveslash nolistbeep extended_glob interactive_comments
# Be paranoid, new files are readable/writable by me only.
#umask 077
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

# Now we can pipe to multiple outputs!
setopt MULTIOS

# Prompts for confirmation after 'rm *' etc
# Helps avoid mistakes like 'rm * o' when 'rm *.o' was intended
setopt RM_STAR_WAIT