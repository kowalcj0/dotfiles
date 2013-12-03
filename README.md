# Bash that Vim

My Bash and Vim config files. Maybe someone will find'em handy :)


##.bashrc
open the file and just a have a look at all the aliases

##.vimrc
F2 - enables a paste mode that will keep the indendation intact  
F3 - launch file fuzzy search  
F6 - toggle color-column after 80chars  
F7 - toggle line numbers  
F8 - toggle tag list  
F9 - toggle Matrix screen-saver  
F10 - toggle hex-editor  
F12 - Press F12 to toggle tab characters. Visual whitespace  
C-t up/down/left/right - navigate between tabs  
S - yank a text then use S to replace a word and paster many times  


##.inputrc 
contains a nice bash setting that allows you to search through your 
history using the up and down arrows.
i.e. type "cd /" and press the up arrow and you'll search through everything
in your history that starts with "cd /".
Thaks to Jude Robinson @ https://coderwall.com/p/oqtj8w


## Installation notes

Clone repo:
```bash
    git clone https://github.com/kowalcj0/bash-that-vim.git
```

Initialize all the submodules:
```bash
    git submodule init
    git submodule update
```

Create a backup copy of your current cfg files:
```bash
    cp ~/.bashrc ~/.bashrc.bak
    cp ~/.vimrc ~/.vimrc.bak
    cp ~/.inputrc ~/.inputrc.bak
```

Delete your old cfg files:
```bash
    rm ~/.bashrc 
    rm ~/.vimrc
    rm ~/.inputrc
```

Create new absolute symlinks for all dot files and .vim folder:
```bash
    ln -sf ~/git/bash-that-vim/.bashrc ~/.bashrc
    ln -sf ~/git/bash-that-vim/.vimrc ~/.vimrc
    ln -sf ~/git/bash-that-vim/.inputrc ~/.inputrc
    ln -sf ~/git/bash-that-vim/.vim ~/.vim
```
This [answer](http://superuser.com/a/422477) on superuser.com to explains why 
you need to create those absolute symlinks :)


Load new Bash settings:
```bash
    source ~/.bashrc
```
or simply open new bash session to enable .inputrc

Once that done you can edit your cfg files as usual:
```bash
    vim ~/.bashrc 
    vim ~/.vimrc
```

or use handy aliases:
* ba for vim ~/.bashrc
* vv for vim ~/.vimrc

