#!/usr/bin/env bash

install(){
	
	rm -rf ~/.vim/bundle/snipmate.vim/snippets/ 
	rm -rf ~/.oh-my-zsh
	rm -rf ~/.tmux

	mkdir -p ~/.tmux/plugins
	
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	echo " link dotfiles "
	
	ln -s $(pwd)/vimrc ~/.vimrc	
	ln -s $(pwd)/tmux.conf ~/.tmux.conf
	ln -s $(pwd)/gvimrc ~/.gvimrc

	cp -r snippets/ ~/.vim/bundle/snipmate.vim/
	vim +PlugInstall +PlugClean! +qa
}

backup(){
	echo "backup"
	mkdir backup
	mv ~/.vimrc backup/
	mv ~/.tmux.conf backup/
	mv ~/.gvimrc backup/
}

clean(){
	echo "clean"
	rm ~/.vimrc 
	rm ~/.tmux.conf
	rm ~/.gvimrc
}

case $1 in
    install)
		backup
        install
        ;;
	clean)
        clean
        ;;
	backup)
        backup
        ;;
    *)
    echo 'params error'
esac








