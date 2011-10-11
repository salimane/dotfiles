install:
	cp zsh/.zshrc ~/
	cp git/.gitconfig git/.gitignore ~/
	mkdir -p ~/bin && cp bin/* ~/bin/
	mkdir -p ~/.zsh/cache && mkdir -p ~/.zsh/functions

clean:
	rm -f bin/git-info.sh

