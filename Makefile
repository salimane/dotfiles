DOTFILESDIR ?= $(shell pwd)

install:
	ln -fs $(DOTFILESDIR)/zsh/.zshrc $(HOME)/.zshrc
	mkdir -p $(HOME)/.gnupg && ln -fs $(DOTFILESDIR)/gnupg/gpg.conf $(HOME)/.gnupg/gpg.conf
	mkdir -p $(HOME)/.gnupg && ln -fs $(DOTFILESDIR)/gnupg/sks-keyservers.netCA.pem $(HOME)/.gnupg/sks-keyservers.netCA.pem
	if [[ -L $(HOME)/.zsh/etc ]]; then unlink $(HOME)/.zsh/etc; fi
	mkdir -p $(HOME)/.zsh && ln -fs $(DOTFILESDIR)/zsh/.zsh/etc $(HOME)/.zsh/etc
	ln -fs $(DOTFILESDIR)/wget/.wgetrc $(HOME)/.wgetrc
	ln -fs $(DOTFILESDIR)/nano/.nanorc $(HOME)/.nanorc
	ln -fs $(DOTFILESDIR)/postgresql/.psqlrc $(HOME)/.psqlrc
	mkdir -p $(HOME)/.gradle && ln -fs $(DOTFILESDIR)/gradle/gradle.properties $(HOME)/.gradle/gradle.properties
	ln -fs $(DOTFILESDIR)/valgrind/.valgrindrc $(HOME)/.valgrindrc
	ln -fs $(DOTFILESDIR)/git/.gitconfig $(HOME)/.gitconfig
	ln -fs $(DOTFILESDIR)/git/.gitignore $(HOME)/.gitignore
	ln -fs $(DOTFILESDIR)/git/.gitattributes $(HOME)/.gitattributes
	if [[ -L $(HOME)/bin ]]; then unlink $(HOME)/bin; fi
	ln -fs $(DOTFILESDIR)/bin $(HOME)/bin
	chmod +x $(HOME)/bin/*
	mkdir -p $(HOME)/.zsh/cache
	if test ! -f $(HOME)/.hub.zsh_completion; then cd $(HOME)/ && curl https://raw.github.com/defunkt/hub/master/etc/hub.zsh_completion -o .hub.zsh_completion; fi


clean:
	if test -d $(HOME)/.zsh; then rm -rf $(HOME)/.zsh; fi
	if test -d $(HOME)/.gradle; then rm -rf $(HOME)/.gradle; fi
	if test -f $(HOME)/bin/git-info.sh; then rm -rf $(HOME)/bin/git-info.sh; fi
