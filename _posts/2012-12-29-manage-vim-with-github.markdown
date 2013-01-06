---
layout: default
title: manager vim and plugin with github
---
#使用github管理VIM
---
现在几乎所有的vim插件都能在github上找到，所以用github管理很方便。
安装vim后所有的额外配置文件都放在$HOME/.vim下，所以只同步这个目录即可。
##初始的vim 文件和目录结构

    ~/.vim/
    ~/.vim/vimrc
    ~/.vim/.gitignore
    ~/.vimrc
其中~/.vimrc是~/.vim/vimrc的链接。创建方式如下：
    
    ln -s ~/.vim/vimrc ~/.vimrc

##使用 github
在github上创建一个repository，名为dotvim，然后在本机执行以下命令:

    cd ~/.vim
    git init
    git remote add git@github.com:{youraccountname}/dotvim.git
    git push

##使用 Pathogen 管理插件

插件地址： https://github.com/tpope/vim-pathogen
安装方法： 

    mkdir -p ~/.vim/autoload/ ~/vim/bundle; \
    curl -Sso ~/.vim/autoload/pathogen.vim \
        https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

然后下载pathogen.vim到autoload下。
修改 ~/.vim/vimrc，添加以下内容：

    call pathogen#infect()
    syntax on
    filetype plugin indent on

##使用 vundle 安装插件
vundle可以自动帮你到github上下载plugin到bundle目录下。
插件地址： https://github.com/gmarik/vundle
安装方法： 

    cd ~/.vim
    git submodule add https://github.com/gmarik/vundle.git bundle/vundle

这里是将vundle作为git的submodule，这样你的github repository中就不会直接存放vundle的文件，只是有一个vundle的链接。
修改 ~/.vim/vimrc，添加以下内容：

    set nocompatible
    filetype off
    if has("unix")
        set rtp+=~/.vim/bundle/vundle/
        call vundle#rc()
    else 
        set rtp+=~/vimfiles/bundle/vundle/
        call vundle#rc('$HOME/vimfiles/bundle/')
    endif
    Bundle 'gmarik/vund'
    Bundle 'plasticbo/vim-markdown' "optional
    Bundle 'AutoComplPop' "optional
    filetype on

如果想安装插件，比如vim-markdown，插件地址：https://github.com/plasticboy/vim-markdown ，只需要在vimrc中添加以下一行：

    Bundle 'plasticboy/vim-markdown'
plasticboy是用户名，如果插件用户名是vim-scripts，则可以省略用户名。
然后执行

    vim +BundleInstall

当提示Done!时，插件就都安装到~/.vim/bundle中了。
这里有个问题，vundle从github上下载插件时也是通过git命令的，但它是直接clone repository，这样你push你的.vim目录时就会把插件也push上去了。所以要在.gitignore文件中禁止提交插件目录bundle，但作为submodule存在的bundle/vundle目录还是要push的，修改.gitignore如下：

    bundle/
    !bundle/vundle

## for windows
1. $HOME下的vim目录是vimfiles，所以以上的.vim都要换成vimfiles。
2. 安装vundle参考：https://github.com/gmarik/vundle/wiki/Vundle-for-Windows
3. vim读取用户自定义的vim配置文件是$HOME\.vimrc，但windows下不能创建链接，所以需要修改.vimrc加入以下内容：

        source $VIM\_vimrc
        source ~\vimfiles\vimrc

我的vim配置：https://github.com/Aaronlong31/dotvim
