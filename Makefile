install:
	if test ! -f /bin/zsh; then sudo apt-get install --force-yes -y zsh zsh-dev zshdb zsh-doc zsh-lovers; fi
	if test ! -f /usr/bin/curl; then sudo apt-get install curl; fi
	if test ! -f /usr/bin/valgrind; then sudo apt-get install valgrind; fi
	cp zsh/.zshrc ~/
	cp wget/.wgetrc ~/
	cp nano/.nanorc ~/
	cp valgrind/.valgrindrc ~/
	cp git/.gitconfig git/.gitignore git/.gitattributes ~/
	mkdir -p ~/bin && cp bin/* ~/bin/
	chmod +x ~/bin/* 
	if test ! -d ~/.rbenv ; then cd ~/ && git clone git://github.com/sstephenson/rbenv.git && git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build && git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash && git clone https://github.com/sstephenson/rbenv-vars.git ~/.rbenv/plugins/rbenv-vars && git clone https://github.com/sstephenson/rbenv-default-gems.git ~/.rbenv/plugins/rbenv-default-gems && git clone https://github.com/chriseppstein/rbenv-each.git ~/.rbenv/plugins/rbenv-each && git clone https://github.com/rkh/rbenv-update.git ~/.rbenv/plugins/rbenv-update && git clone https://github.com/rkh/rbenv-whatis.git ~/.rbenv/plugins/rbenv-whatis && git clone https://github.com/rkh/rbenv-use.git ~/.rbenv/plugins/rbenv-use; fi
	mkdir -p ~/.zsh/cache && mkdir -p ~/.zsh/functions
	if test ! -d ~/htdocs/zsh/Completion ; then mkdir -p ~/htdocs && cd ~/htdocs && git clone git://zsh.git.sourceforge.net/gitroot/zsh/zsh; fi
	if test ! -L ~/.zsh/functions/completion; then ln -s ~/htdocs/zsh/Completion ~/.zsh/functions/completion; fi
	if test ! -L ~/.zsh/functions/vcs_info; then ln -s ~/htdocs/zsh/Functions/VCS_Info ~/.zsh/functions/vcs_info; fi
	if test ! -f ~/.git-flow-completion.zsh; then cd ~/ && curl https://raw.github.com/bobthecow/git-flow-completion/master/git-flow-completion.zsh -o .git-flow-completion.zsh; fi
	if test ! -f ~/.hub.zsh_completion; then cd ~/ && curl https://raw.github.com/defunkt/hub/master/etc/hub.zsh_completion -o .hub.zsh_completion; fi
	curl http://defunkt.io/hub/standalone -sLo ~/bin/hub && chmod +x ~/bin/hub
	sudo chsh -s /bin/zsh
	exec $SHELL -l


clean:
	if test -L ~/.zsh/functions/completion; then unlink ~/.zsh/functions/completion; fi
	if test -L ~/.zsh/functions/vcs_info; then unlink ~/.zsh/functions/vcs_info; fi
	if test -d ~/.zsh; then rm -rf ~/.zsh; fi
	if test -f ~/bin/git-info.sh; then rm -rf ~/bin/git-info.sh; fi
	if test -f ~/.git-flow-completion.zsh; then rm -rf ~/.git-flow-completion.zsh; fi
	

