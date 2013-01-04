#初始的vim 文件和目录结构
    ~/.vim/
    ~/.vim/vimrc
    ~/.vim/.gitignore

#使用 github
在github上创建一个repository，名为dotvim，然后在本机执行以下命令:

    git init
    git remote add git@github.com:{youraccountname}/dotvim.git
    git push

#使用 Pathogen 管理插件
插件地址： https://github.com/tpope/vim-pathogen
安装方法： 

    mkdir -p ~/.vim/autoload/ ~/vim/bundle; \
    curl -Sso ~/.vim/autoload/pathogen.vim \
        https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

修改 ~/vim/vimrc，添加以下内容：

    call pathogen#infect()
    syntax on
    filetype plugin indent on

#使用 vundle 安装插件
插件地址： https://github.com/gmarik/vundle
安装方法： 

    cd ~/.vim
    git submodule add https://github.com/gmarik/vundle.git bundle/vundle

修改 ~/.vim/vimrc，添加以下内容：

    set nocompatible
    filetype off
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    " let Vundle manage Vundle
    " required! 
    Bundle 'gmarik/vundle'
    filetype on

如果想安装插件，比如vim-markdown，插件地址：https://github.com/plasticboy/vim-markdown ，只需要在vimrc中添加以下一行：

    Bundle 'plasticboy/vim-markdown'

然后执行

    vim +BundleInstall

这样vim-markdown插件就安装到~/.vim/bundle中了。
