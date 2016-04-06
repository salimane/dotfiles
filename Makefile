install:
	ln -fs `pwd`/zsh/.zshrc ~/.zshrc
	mkdir -p ~/.gnupg && ln -fs `pwd`/gnupg/gpg.conf ~/.gnupg/gpg.conf
	mkdir -p ~/.gnupg && ln -fs `pwd`/gnupg/sks-keyservers.netCA.pem ~/.gnupg/sks-keyservers.netCA.pem
	if [[ -L ~/.zsh/etc ]]; then unlink ~/.zsh/etc; fi
	mkdir -p ~/.zsh && ln -fs `pwd`/zsh/.zsh/etc ~/.zsh/etc
	ln -fs `pwd`/wget/.wgetrc ~/.wgetrc
	ln -fs `pwd`/nano/.nanorc ~/.nanorc
	ln -fs `pwd`/postgresql/.psqlrc ~/.psqlrc
	mkdir -p ~/.gradle && ln -fs `pwd`/gradle/gradle.properties ~/.gradle/gradle.properties
	ln -fs `pwd`/valgrind/.valgrindrc ~/.valgrindrc
	ln -fs `pwd`/git/.gitconfig ~/.gitconfig
	ln -fs `pwd`/git/.gitignore ~/.gitignore
	ln -fs `pwd`/git/.gitattributes ~/.gitattributes
	mkdir -p ~/bin && ln -fs `pwd`/bin ~/bin
	chmod +x ~/bin/*
	mkdir -p ~/.zsh/cache
	if test ! -f ~/.hub.zsh_completion; then cd ~/ && curl https://raw.github.com/defunkt/hub/master/etc/hub.zsh_completion -o .hub.zsh_completion; fi


clean:
	if test -d ~/.zsh; then rm -rf ~/.zsh; fi
	if test -d ~/.gradle; then rm -rf ~/.gradle; fi
	if test -f ~/bin/git-info.sh; then rm -rf ~/bin/git-info.sh; fi
