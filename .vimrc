"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""              EDITING SETTINGS
""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
" Automatic reloading of .vimrc on each save
autocmd! bufwritepost .vimrc source %
set nocompatible
" allow unsaved background buffers and remember marks/undo for them
set hidden
set mouse=a
" remember more commands and search history
set history=10000
set undolevels=700
set smartindent
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set ruler

" Make search case insensitive
set ignorecase
set incsearch
set hlsearch
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set shell=bash
" keep more context when scrolling off the end of a buffer
set scrolloff=3
" Store temporary files in a central spot
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" use ctags tags file to go to definition
" by typing Ctrl + ]
" ps. remember to run ctags -R
" in the project's parent directory
" http://stackoverflow.com/a/19926573
set autochdir
set tags+=./tags;

" define the Leader key
" handy with new shortcuts
let mapleader=","



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts
"

" enable built-in spell checker
" ;s to use regular dictionary
nmap ;s :set invspell spelllang=en<CR>


" Copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa


" Comments plugin - use non default shortcuts
let g:comments_map_keys = 0
" key-mappings for comment line in normal mode
noremap  <silent> <C-L> :call CommentLine()<CR>
" key-mappings for range comment lines in visual <Shift-V> mode
vnoremap <silent> <C-L> :call RangeCommentLine()<CR>
" key-mappings for un-comment line in normal mode
noremap  <silent> <C-K> :call UnCommentLine()<CR>
" key-mappings for range un-comment lines in visual <Shift-V> mode
vnoremap <silent> <C-K> :call RangeUnCommentLine()<CR>



" Open file explorer in a new Tab
nnoremap <leader>E :Texplore<CR>
" Open file explorer in the same window or split
nnoremap <leader>e :Explore<CR>

" hit Ctrl+s in any mode to save the file
" Note that remapping C-s requires flow control to be disabled
" " (e.g. in .bashrc or .zshrc)
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" Emacs-like beginning and end of line.
imap <c-e> <c-o>$
imap <c-a> <c-o>^

" folding using Space
" found http://vim.wikia.com/wiki/Folding#Mappings_to_toggle_folds
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" select lines with visual block and press 's' to sort them
" useful when sorting imports
vnoremap <Leader>s :sort<CR>

" Settings for vim-markdown
" ==========================
let g:vim_markdown_folding_disabled=1
" let g:vim_markdown_initial_foldlevel=1


" Python folding
" mkdir ~/.vim/foldingplugin
" wget -O ~/.vim/foldingplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable


" Fix the issues with X11 clipboard
" http://vim.wikia.com/wiki/Accessing_the_system_clipboard
set clipboard=unnamedplus
set showmode

" easier moving of code block
" select using visual block and then simply < or > to change indentation
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
" Show trailing whitespace
" =========================
" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
" au InsertLeave * match ExtraWhitespace /\s\+$/

" Pathogen load
" https://github.com/klen/python-mode#id6
filetype off

" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name folder
call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

" syntastic
" this will allow you to jump between error using [l and ]l
" https://github.com/scrooloose/syntastic/issues/341#issuecomment-22071333
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open=1 " run the syntax check on file open
let g:syntastic_enable_signs=1


" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
"color wombat256mod
color miko

" Settings for Vim-powerline
set laststatus=2
let g:Powerline_symbols = 'fancy'


"SCALA syntax highlight script
"http://stackoverflow.com/questions/3626203/text-editor-for-scala/3627461#3627461
"I already had most of the setting the same as in this post
"but needed to add few more
filetype indent on " needed by scala syntax highligtning script
set showmatch  "Show matching bracets when text indicator is over them


" Wildmenu completion
" make tab completion for files/buffers act like bash
set wildmenu
" use emacs-style tab completion when selecting files, etc
set wildmode=list:longest,full
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc,*.pyo,*pyd                 " Python byte code
set wildignore+=*.orig                           " Merge resolution files}

"change paste - will replace word with pasted word
map <silent> cp "_cw<C-R>"<Esc>

"line and column highlight
"press ,+c to toggle the highlight
:set cursorline cursorcolumn
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
hi CursorLine   cterm=NONE ctermbg=darkgray ctermfg=NONE "guibg=lightgrey guifg=white
hi CursorColumn cterm=NONE ctermbg=darkgray ctermfg=NONE "guibg=lightgrey guifg=white



" navigating between tabs
map <C-t><up> :tabr<cr>     " jump to first tab - press ctrl+t+up arrow
map <C-t><down> :tabl<cr>   " jump to last tab - press ctrl+t+down arrow
map <C-t><left> :tabp<cr>   " tabprevious - press ctrl+t+left arrow
map <C-t><right> :tabn<cr>  " tabnext - press ctrl+t+right arrow
map <C-t>h :tabp<cr>        " tabprevious - press ctrl+t+h
map <C-t>l :tabn<cr>        " tabnext - press ctrl+t+l
map <C-t>k :tabr<cr>        " jump to first tab - press ctrl+t+k
map <C-t>j :tabl<cr>        " jump to last tab - press ctrl+t+j

" navigating between splits using Ctrl+hjkl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open splits in various ways
noremap <leader>v :vsp<CR>
noremap <leader>ev :Vexplore<CR>
noremap <leader>en :vnew<CR>

" yank a text, then use S to replace word and paste many times
nnoremap S diw"0P

" leader + space to clear the search results highlighting
map <Leader><Space> :noh<CR>; 

" Typos
command! -bang E e<bang>
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Wq wq<bang>
command! -bang WQ wq<bang>


" Remap CtrlP.vim keys config to open files aleays in a new tab
" https://github.com/kien/ctrlp.vim/issues/160
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
" CtrlP - Exclude files or directories using Vim's wildignore:
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*/.git/*,*~,*.db,.DS_Store,*.jar
let g:ctrlp_show_hidden = 1


""""""""""""""""""""""""""""""
" => F-keys mappings
""""""""""""""""""""""""""""""
" A quick fix to problems with pasting code from different editor or website etc.
" 1) Start insert mode. 2) Press F2 (toggles the 'paste' option on).
" 3) Use your terminal to paste text from the clipboard. 4) Press F2 (toggles the 'paste' option off).
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Press F4 to toggle the diff of currently open buffers/splits.
noremap <F4> :call DiffMe()<CR>
let $diff_me=0
function! DiffMe()
    windo diffthis
    if $diff_me>0
        let $diff_me=0
    else
        windo diffoff
    let $diff_me=1
    endif
endfunction


" Press F5 to remove unwanted trailing whitespaces in the whole file
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>


" Press F6 to toggle color column
nnoremap <silent><F6> :call <SID>ToggleColorColumn()<cr>
" toggle colored right border after 80 chars
set colorcolumn=80
set tw=79       " width of document (used by gd)
set nowrap      " don't automatically wrap on load
set fo-=t       " don't automatically wrap text when typing
let s:color_column_old = 0
function! s:ToggleColorColumn()
    if s:color_column_old == 0
        let s:color_column_old = &colorcolumn
        windo let &colorcolumn = 0
    else
        windo let &colorcolumn=s:color_column_old
        let s:color_column_old = 0
    endif
endfunction


" Press F7 to toggle line numbering
set relativenumber
set number
set numberwidth=4
highlight LineNr term=bold cterm=NONE ctermfg=White ctermbg=DarkBlue gui=NONE guifg=DarkGrey guibg=NONE
nnoremap <silent> <F7> :set invnumber<CR> " Press F7 to toggle line numbers

" Tag list settings
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_WinWidth = 40
let Tlist_Inc_Winwidth = 0
let Tlist_Use_Right_Window = 1
let Tlist_Auto_Open = 0
let Tlist_Exit_OnlyWindow = 1


" toggle hex-editor
noremap <F10> :call HexMe()<CR>
let $in_hex=0
function! HexMe()
    set binary
    set noeol
    if $in_hex>0
        :%!xxd -r
        let $in_hex=0
    else
        :%!xxd
    let $in_hex=1
    endif
endfunction

" define custom whitespace characters
" ~ - for non breaking space (U+00A0)
" »» - for tab
" ¶ - for trailing spaces
exec "set listchars=tab:\uBB\uBB,trail:\uB6,nbsp:~"
" Press F12 to toggle tab characters. Visual whitespace
nmap <F12> :set list! list?<CR>


"jedi - > copied from cliffxuan
let g:jedi#use_tabs_not_buffers = 1
" no docstring window popup during completion
autocmd FileType python setlocal completeopt-=preview

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""{{{
" Search for the selection under the cursor using * or # 
" idea by Michael Naumann
" http://amix.dk/blog/post/19334
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" In visual mode when you press * or # to search for the current selection
" How to use these maps:
" While in visual mode:
" press '*' to search (forwards) for the current selection
" press '#' to search (backwards) for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
