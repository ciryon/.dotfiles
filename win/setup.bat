:: Run with sh setup.sh
:: as administrator (needed for the links)
:: HOME environmental variable must be set


:: Vim stuff
mkdir %HOME%\vimfiles
mkdir %HOME%\vimfiles\autoload
curl -LSso %HOME%\vimfiles\autoload\pathogen.vim "https://tpo.pe/pathogen.vim"
mklink %HOME%\vimfiles\vimrc %HOME%\.dotfiles\vimrc
mklink %HOME%\vimfiles\gvimrc %HOME%\.dotfiles\gvimrc
mklink /d %HOME%\vimfiles\bundle %HOME%\.dotfiles\vim_plugins

:: Cmder stuff
del C:\tools\cmder\vendor\init.bat
mklink C:\tools\cmder\vendor\init.bat %HOME%\.dotfiles\win\cmder\init.bat
del C:\tools\cmder\config\prompt.lua
mklink C:\tools\cmder\config\prompt.lua %HOME%\.dotfiles\win\cmder\prompt.lua

:: Git stuff
mklink %HOME%\.gitconfig %HOME%\.dotfiles\gitconfig
