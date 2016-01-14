# Installation
The plugins are installed by pathogen, managed by git submodule

1. Download the whole directory and `mv` the whole directory to `~/.vim` because of pathogen
2. However, the default config file of vim is `~/.vimrc`, therefore create a symbolic link to it by `ln -s ~/.vim/vimrc .vimrc` 
3. `cd bundle`
4. `git submodule init` 
5. `git submodule update --recursive`

# Troubleshooting
If you face any problems with the submodules, such as `no mapping xxxxx` , this can casuse thegit submodule init to stop initialize remaining submoduless.

This is due to two reasons:

1. the submodule folder exsit, but there is no record of it inside `.gitmodules`
2. the submodule folder doesn't exist, but there is a record inside `.gitmodules file`

Solution is to compare them by hand to keep both records consistent, then run the submoudle commands again.
