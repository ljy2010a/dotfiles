#!/usr/bin/env bash


install(){
	
	rm -rf ~/.vim/bundle/vundle
	rm -rf ~/.vim/bundle/snipmate.vim/snippets/ 

	git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

	ln -s $(pwd)/vimrc ~/.vimrc	
	ln -s $(pwd)/zshrc ~/.zshrc
	ln -s $(pwd)/tmux.conf ~/.tmux.conf
	ln -s $(pwd)/bash_profile ~/.bashrc
	ln -s $(pwd)/gvimrc ~/.gvimrc

	cp -r snippets/ ~/.vim/bundle/snipmate.vim/ 
	vim +BundleInstall +BundleClean! +qa
}

backup(){
	echo "backup"
	mkdir backup
	mv ~/.vimrc backup/
	mv ~/.zshrc backup/
	mv ~/.tmux.conf backup/
	mv ~/.bashrc backup/
	mv ~/.gvimrc backup/
}

clean(){
	echo "clean"
	rm ~/.vimrc 
	rm ~/.zshrc 
	rm ~/.tmux.conf
	rm ~/.bashrc 
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







