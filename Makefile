install:
	cp zsh/.zshrc ~/
	cp git/.gitconfig git/.gitignore ~/
	mkdir -p ~/bin && cp bin/* ~/bin/
	mkdir -p ~/.zsh/cache && mkdir -p ~/.zsh/functions
	if test ! -d ~/htdocs/zsh/Completion ; then mkdir -p ~/htdocs && cd ~/htdocs && git clone git://zsh.git.sourceforge.net/gitroot/zsh/zsh; fi
	if test ! -L ~/.zsh/functions/completion; then ln -s ~/htdocs/zsh/Completion ~/.zsh/functions/completion; fi
	if test ! -L ~/.zsh/functions/vcs_info; then ln -s ~/htdocs/zsh/Functions/VCS_Info ~/.zsh/functions/vcs_info; fi

clean:
	if test -L ~/.zsh/functions/completion; then unlink ~/.zsh/functions/completion; fi
	if test -L ~/.zsh/functions/vcs_info; then unlink ~/.zsh/functions/vcs_info; fi
	if test -d ~/.zsh; then rm -rf ~/.zsh; fi
	if test -f ~/bin/git-info.sh; then rm -rf ~/bin/git-info.sh; fi
