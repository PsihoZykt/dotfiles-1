# Assuming user is running `make` from the dotfiles directory.
DOTFILES_DIR=$(shell pwd)

install-dotfiles:
	echo 'nop'

mac-neovim-install:
	brew update
	brew install neovim/neovim/neovim
	which pip3 2>&1 > /dev/null || brew install python3
	pip3 install neovim

vim-install: dein-install
	echo 'nop'

dein-install:
	$(eval VIM_DIR=$(DOTFILES_DIR)/home/vim)
	$(eval VIM_DEIN_REPOS_DIR=$(VIM_DIR)/bundle/repos)
	mkdir -p $(VIM_DEIN_REPOS_DIR)/github.com/Shougo/dein.vim
	git clone https://github.com/Shougo/dein.vim $(VIM_DEIN_REPOS_DIR)/github.com/Shougo/dein.vim
	$(eval VIM=$(shell which nvim 2>&1 > /dev/null && echo 'nvim' || echo 'vim'))
	$(VIM) -c ":call dein#install()"


