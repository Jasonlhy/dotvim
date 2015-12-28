The plugins are installed by pathogen, managed by git submodule

1. Download the whole directory and `mv` the whole directory to `~/.vim` because of pathogen
2. However, the default config file of vim is `~/.vimrc`, therefore create a symbolic link to it by `ln -s ~/.vim/vimrc .vimrc` 
3. `cd bundle`
4. `git submodule init` 
5. `git submodule update --recursive`
