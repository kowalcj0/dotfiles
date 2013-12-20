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
" use emacs-style tab completion when selecting files, etc
set wildmode=longest,list
" make tab completion for files/buffers act like bash
set wildmenu
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python-mode settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable pylint checking every save
let g:pymode_lint_write = 0
"
" Set key 'R' for run python code
let g:pymode_run_key = 'R'
"
" Open definition in a new window
" ps. definition can be opened with <C-C>g
" which means press and realese: Ctrl+Shift+c
" then press g
" https://github.com/klen/python-mode/issues/150
let g:pymode_rope_goto_def_newwin = "new"

" useful shortcut to go to python definition
" more on repo shortcuts https://github.com/peplin/ropevim
map <C-c>g :call RopeGotoDefinition()
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" end of python-mode settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts
"

" enable built-in spell checker
" ;s to use regular dictionary
nmap ;s :set invspell spelllang=en<CR>


" draging visual block using arrows
" http://www.youtube.com/watch?v=aHm36-na4-4
vmap <expr> h DVB_Drag('left')
vmap <expr> l DVB_Drag('right')
vmap <expr> j DVB_Drag('down')
vmap <expr> j DVB_Drag('up')
vmap <expr> D DVB_Duplicate()


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

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
"color wombat256mod
color miko

" Settings for Vim-powerline
" cd ~/.vim/bundle
" git clone https://github.com/Lokaltog/vim-powerline.git
set laststatus=2

"SCALA syntax highlight script
"http://stackoverflow.com/questions/3626203/text-editor-for-scala/3627461#3627461
"I already had most of the setting the same as in this post
"but needed to add few more
filetype indent on " needed by scala syntax highligtning script
set showmatch  "Show matching bracets when text indicator is over them


"change paste - will replace word with pasted word
map <silent> cp "_cw<C-R>"<Esc>

"line and column highlight
"press / c to toggle the highlight
:set cursorline cursorcolumn
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
hi CursorLine   cterm=NONE ctermbg=darkgray ctermfg=NONE "guibg=lightgrey guifg=white
hi CursorColumn cterm=NONE ctermbg=darkgray ctermfg=NONE "guibg=lightgrey guifg=white

" navigating between tabs
map <C-t><up> :tabr<cr>     " jump to first tab - press ctrl+t then up arrow
map <C-t><down> :tabl<cr>   " jump to last tab - press ctrl+t then down arrow
map <C-t><left> :tabp<cr>   " tabprevious - press ctrl+t then left arrow
map <C-t><right> :tabn<cr>  " tabnext - press ctrl+t then right arrow


" yank a text, then use S to replace word and paste many times
nnoremap S diw"0P


" Remap CtrlP.vim keys config to open files aleays in a new tab
" https://github.com/kien/ctrlp.vim/issues/160
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
" CtrlP - Exclude files or directories using Vim's wildignore:
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*/.git/*,*~,*.db,.DS_Store,*.jar


""""""""""""""""""""""""""""""
" => F-keys mappings
""""""""""""""""""""""""""""""
" A quick fix to problems with pasting code from different editor or website etc.
" 1) Start insert mode. 2) Press F2 (toggles the 'paste' option on).
" 3) Use your terminal to paste text from the clipboard. 4) Press F2 (toggles the 'paste' option off).
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>


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


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Really useful!
"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" From an idea by Michael Naumann
function! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'b'
  execute "normal ?" . l:pattern . "^M"
  elseif a:direction == 'gv'
  call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
  elseif a:direction == 'f'
  execute "normal /" . l:pattern . "^M"
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction
