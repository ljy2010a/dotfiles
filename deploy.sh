#!/usr/bin/env bash


install(){
	
	rm -rf ~/.vim/bundle/vundle
	rm ~/.vim/bundle/snipmate.vim/snippets/ -r

	git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	ln -s $(PWD)/vimrc ~/.vimrc	
	ln -s $(PWD)/zshrc ~/.zshrc
	ln -s $(PWD)/tmux.conf ~/.tmux.conf
	ln -s $(PWD)/bash_profile ~/.bashrc
	ln -s $(PWD)/gvimrc ~/.gvimrc

	cp snippets/ ~/.vim/bundle/snipmate.vim/ -r
	vim +BundleInstall +BundleClean! +qa
}

backup(){

}

clean(){

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








