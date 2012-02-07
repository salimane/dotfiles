install:
	if test ! -f /bin/zsh; then sudo apt-get install --force-yes -y zsh zsh-dev zshdb zsh-doc zsh-lovers; fi
	if test ! -f /usr/bin/curl; then sudo apt-get install curl; fi
	cp zsh/.zshrc ~/
	cp git/.gitconfig git/.gitignore ~/
	mkdir -p ~/bin && cp bin/* ~/bin/
	chmod +x ~/bin/* 
	mkdir -p ~/.zsh/cache && mkdir -p ~/.zsh/functions
	if test ! -d ~/htdocs/zsh/Completion ; then mkdir -p ~/htdocs && cd ~/htdocs && git clone git://zsh.git.sourceforge.net/gitroot/zsh/zsh; fi
	if test ! -L ~/.zsh/functions/completion; then ln -s ~/htdocs/zsh/Completion ~/.zsh/functions/completion; fi
	if test ! -L ~/.zsh/functions/vcs_info; then ln -s ~/htdocs/zsh/Functions/VCS_Info ~/.zsh/functions/vcs_info; fi
	if test ! -f ~/.git-flow-completion.zsh; then cd ~/ && curl https://raw.github.com/bobthecow/git-flow-completion/master/git-flow-completion.zsh -o .git-flow-completion.zsh; fi
	sudo chsh -s /bin/zsh


clean:
	if test -L ~/.zsh/functions/completion; then unlink ~/.zsh/functions/completion; fi
	if test -L ~/.zsh/functions/vcs_info; then unlink ~/.zsh/functions/vcs_info; fi
	if test -d ~/.zsh; then rm -rf ~/.zsh; fi
	if test -f ~/bin/git-info.sh; then rm -rf ~/bin/git-info.sh; fi
	if test -f ~/.git-flow-completion.zsh; then rm -rf ~/.git-flow-completion.zsh; fi
	

