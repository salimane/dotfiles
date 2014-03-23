install:
	if test ! -f /bin/zsh; then sudo apt-get install --force-yes -y zsh; fi
	if test ! -f /usr/bin/curl; then sudo apt-get install curl; fi
	if test ! -f /usr/bin/valgrind; then sudo apt-get install valgrind; fi
	ln -fPs `pwd`/zsh/.zshrc $HOME/.zshrc
	mkdir -p ~/.zsh && ln -fPs `pwd`/zsh/.zsh/etc ~/.zsh/etc
	ln -fPs `pwd`/wget/.wgetrc ~/.wgetrc
	ln -fPs `pwd`/nano/.nanorc ~/.nanorc
	ln -fPs `pwd`/valgrind/.valgrindrc ~/.valgrindrc
	ln -fPs `pwd`/git/.gitconfig ~/.gitconfig
	ln -fPs `pwd`/git/.gitignore ~/.gitignore
	ln -fPs `pwd`/git/.gitattributes ~/.gitattributes
	mkdir -p ~/bin && ln -fPs `pwd`/bin ~/bin
	chmod +x ~/bin/*
	if test ! -d ~/.rbenv ; then cd ~/ && git clone git://github.com/sstephenson/rbenv.git ~/.rbenv && git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build && git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash && git clone https://github.com/sstephenson/rbenv-vars.git ~/.rbenv/plugins/rbenv-vars && git clone https://github.com/sstephenson/rbenv-default-gems.git ~/.rbenv/plugins/rbenv-default-gems && git clone https://github.com/chriseppstein/rbenv-each.git ~/.rbenv/plugins/rbenv-each && git clone https://github.com/rkh/rbenv-update.git ~/.rbenv/plugins/rbenv-update && git clone https://github.com/rkh/rbenv-whatis.git ~/.rbenv/plugins/rbenv-whatis && git clone https://github.com/rkh/rbenv-use.git ~/.rbenv/plugins/rbenv-use; fi
	mkdir -p ~/.zsh/cache
	if test ! -f ~/.hub.zsh_completion; then cd ~/ && curl https://raw.github.com/defunkt/hub/master/etc/hub.zsh_completion -o .hub.zsh_completion; fi
	gem install hub && hub hub standalone > ~/bin/hub && chmod +x ~/bin/hub	
	sudo chsh -s /bin/zsh
	exec $SHELL -l


clean:
	if test -d ~/.zsh; then rm -rf ~/.zsh; fi
	if test -f ~/bin/git-info.sh; then rm -rf ~/bin/git-info.sh; fi


