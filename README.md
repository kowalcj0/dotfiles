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


## Shortcut tutorials

* F2 paste code and keep formatting - ![alt text](./docs/F2-paste_with_formatting.gif "Paste code and keep formatting")
* F5 remove all trailing whitespaces - ![alt text](./docs/F5-remove_all_trailing_whitespaces_-_and_F12_show_all_whitespaces.gif "Remove all trailing whitespaces")
* F6 toggle 80 chars vertical line - ![alt text](./docs/F6-toggle-80_chars_code_line_warning.gif "")
* F7 toggle line numbering - ![alt text](./docs/F7-toggle_line_numbering.gif "")
* F8 toggle tag lists (require cTags) - ![alt text](./docs/F8-toggle_tag_list.gif "")
* F10 toggle hex view - ![alt text](./docs/F10-toggle-hex-editor.gif "")
* F12 toggle visual whitespaces - ![alt text](./docs/F12-toggle-visual_whitespaces.gif "")
* press Asterisk to do a visual search - ![alt text](./docs/Asterisk-visual_search.gif "")
* ctrl+t+arrows move around tabs - ![alt text](./docs/Ctrl+T+arrows-move_around_tabs.gif "")
* :Dox generate doc template - ![alt text](./docs/Doxygen_plugin.gif "")
* R run python script from Vim - ![alt text](./docs/R-run-standalone_python-script.gif "")
* play with EN spellcheker - ![alt text](./docs/spell_checker.gif "")
* ,+c toggle line and column highlight - ![alt text](./docs/comma+s-toggle_line_and_column_highlight.gif "")
* iyw then S to replace word multiple time - ![alt text](./docs/iyw_then_S-to_replace_words_multiple_times.gif "")
* move visual block with angle brackets - ![alt text](./docs/moving_a_visual_block_indentation_with_angle_brackets.gif "")

## Other tips & tricks

### Sync Tomboy Notes using Dropbox
1. create new folder in the Dropbox folder ie.: tomboy-notes
2. go to Tomboy'd preferences: Edit -> Preferences -> Synchronisation
3. Choose "Local folder" from the "Service" dropdown menu
4. Then point at the folder you've created in the first step
5. Hit "Close" and continue working :)


### Sync Tasque's DB using Dropbox
1. close tasque
2.  create new folder in the Dropbox folder ie.: tasque-db
3.  move contents of ~/.config/tasque folder to the newly created tasque-db dir
4.  delete the empty ~/.config/tasque
5.  create a symlink:

        ln -s /home/your_user_name/Dropbox/tasque-db tasque

6.  open tasque
