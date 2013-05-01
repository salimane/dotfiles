install:
	if test ! -f /bin/zsh; then sudo apt-get install --force-yes -y zsh; fi
	if test ! -f /usr/bin/curl; then sudo apt-get install curl; fi
	if test ! -f /usr/bin/valgrind; then sudo apt-get install valgrind; fi
	cp zsh/.zshrc ~/ && mkdir -p ~/.zsh && cp zsh/.zsh/etc ~/.zsh/
	cp wget/.wgetrc ~/
	cp nano/.nanorc ~/
	cp valgrind/.valgrindrc ~/
	cp git/.gitconfig git/.gitignore git/.gitattributes ~/
	mkdir -p ~/bin && cp bin/* ~/bin/
	chmod +x ~/bin/*
	if test ! -d ~/.rbenv ; then cd ~/ && git clone git://github.com/sstephenson/rbenv.git ~/.rbenv && git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build && git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash && git clone https://github.com/sstephenson/rbenv-vars.git ~/.rbenv/plugins/rbenv-vars && git clone https://github.com/sstephenson/rbenv-default-gems.git ~/.rbenv/plugins/rbenv-default-gems && git clone https://github.com/chriseppstein/rbenv-each.git ~/.rbenv/plugins/rbenv-each && git clone https://github.com/rkh/rbenv-update.git ~/.rbenv/plugins/rbenv-update && git clone https://github.com/rkh/rbenv-whatis.git ~/.rbenv/plugins/rbenv-whatis && git clone https://github.com/rkh/rbenv-use.git ~/.rbenv/plugins/rbenv-use; fi
	mkdir -p ~/.zsh/cache
	if test ! -f ~/.hub.zsh_completion; then cd ~/ && curl https://raw.github.com/defunkt/hub/master/etc/hub.zsh_completion -o .hub.zsh_completion; fi
	curl http://defunkt.io/hub/standalone -sLo ~/bin/hub && chmod +x ~/bin/hub
	sudo chsh -s /bin/zsh
	exec $SHELL -l


clean:
	if test -d ~/.zsh; then rm -rf ~/.zsh; fi
	if test -f ~/bin/git-info.sh; then rm -rf ~/bin/git-info.sh; fi


