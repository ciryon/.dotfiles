*Notes to self*


## Mac OS X
* Install XCode
* Install XCode command line tools, xcode-select --install
* Install HomeBrew
* Install git and git-flow
* Install MacVim
* git clone ssh://github.com/ciryon/.dotfiles ~/.dotfiles
* cd ~/.dotfiles; rake install


## Windows 8/10
* Install Chocolately
* Install Cmder
* Install Visual Studio
* Install Vim from https://bitbucket.org/Haroogan/vim-for-windows
* git clone ssh://github.com/ciryon/.dotfiles ~/.dotfiles
* Run setup.bat in .dotfiles\win\



## NeoVim

First:

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Then: 

```
nvim +PluginInstall
```
