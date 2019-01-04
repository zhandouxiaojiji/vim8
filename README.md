# vim8安装与配置
git clone https://github.com/vim/vim.git  
cd vim  
make distclean && ./configure --enable-multibyte --with-tlib=ncurses --enable-cscope --with-features=huge --enable-luainterp --with-lua-prefix=/usr/local/ --enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/ --enable-perlinterp && make && make install  
安装成功后，克隆本仓库，把vim.tar.gz解压到用户的home目录下，再把.vimrc复制到用户的home目录下  

## 一些自定快捷键
\空格 一键删除行末空格  
,, 取消查找高亮  
,t 打开标签  
ctrl+ghlk 窗口切换  
shift+ghlk 标签切换  
f4 打开关闭NERD_TREE  
f5 编译lua  
f12 构建ctag  
ctrl+p 查找文件  
f+f 查找文件  
f+e 查找单词  
ctrl+] 查找定义
ctrl+t 返回

## 安装lua5.3
wget http://www.lua.org/ftp/lua-5.3.5.tar.gz  
tar -xzvf lua-5.3.4.tar.gz  
cd ./lua-5.3.4/  
make linux  
make install  

## 安装ctag和cscope
sudo yum -y ctag cscope

## 如果编译不过尝试以下命令
sudo yum -y install ncurses-devel lua-devel python-devel perl-devel ruby-devel  
sudo yum -y install perl-ExtUtils-Embed  
