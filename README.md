# Bash that Vim

My Bash and Vim config files. Maybe someone will find'em handy :)


## Installation notes

Create a backup copy of your current cfg files:
```bash
    cp ~/.bashrc ~/.bashrc.bak
    cp ~/.vimrc ~/.vimrc.bak
```

Delete your old cfg files:
```bash
    rm ~/.bashrc 
    rm ~/.vimrc
```

Create new absolute symlinks for the new files:
```bash
    ln -sf ~/git/bash-that-vim/.bashrc ~/.bashrc
    ln -sf ~/git/bash-that-vim/.vimrc ~/.vimrc
```
This [answer](http://superuser.com/a/422477) on superuser.com to explains why 
you need to create those absolute symlinks :)


Load new Bash settings:
```bash
    source ~/.bashrc
```

Once that done you can edit your cfg files as usual:
```bash
    vim ~/.bashrc 
    vim ~/.vimrc
```

or use handy aliases:
* ba for vim ~/.bashrc
* vv for vim ~/.vimrc

