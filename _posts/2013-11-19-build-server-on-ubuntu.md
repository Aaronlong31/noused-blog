--- layout: post
title: "在ubuntu上搭建服务器"
description: ""
category: 
tags: []
---

    sudo apt-get install apache2 php5 php5-mysql php5-mcrypt libapache2-mod-php5 git git-core mysql-server
    sudo ln -s /etc/php5/conf.d/mcrypt.ini /etc/php5/mods-available
    sudo php5enmod mcrypt
    sudo service apache2 restart
