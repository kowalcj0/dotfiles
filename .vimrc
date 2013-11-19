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
filetype off
filetype plugin indent on
syntax on
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



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts
"

" select lines with visual block and press 's' to sort them
" usefull when sorting imports
vnoremap <Leader>s :sort<CR>


" Settings for vim-markdown
" ==========================
let g:vim_markdown_folding_disabled=1
" let g:vim_markdown_initial_foldlevel=1


" Python folding
" mkdir ~/.vim/foldingplugin
" wget -O ~/.vim/foldingplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable


" list of handy plugins
" https://github.com/plasticboy/vim-markdown


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


" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name folder
call pathogen#infect()


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
:set cursorline cursorcolumn
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR> "press / c to toggle the highlight
hi CursorLine   cterm=NONE ctermbg=darkgray ctermfg=NONE "guibg=lightgrey guifg=white
hi CursorColumn cterm=NONE ctermbg=darkgray ctermfg=NONE "guibg=lightgrey guifg=white

" navigating between tabs
map <C-t><up> :tabr<cr> " jump to first tab - press ctrl+t then up arrow
map <C-t><down> :tabl<cr> " jump to last tab - press ctrl+t then down arrow
map <C-t><left> :tabp<cr> " tabprevious - press ctrl+t then left arrow
map <C-t><right> :tabn<cr> " tabnext - press ctrl+t then right arrow


" yank a text, then use S to replace word and paste many times
nnoremap S diw"0P


""""""""""""""""""""""""""""""
" => F-keys mappings
""""""""""""""""""""""""""""""
" A quick fix to problems with pasting code from different editor or website etc.
" 1) Start insert mode. 2) Press F2 (toggles the 'paste' option on).
" 3) Use your terminal to paste text from the clipboard. 4) Press F2 (toggles the 'paste' option off).
nnoremap <F2> :set invpaste paste?<CR>
set clipboard=unnamedplus
set pastetoggle=<F2>
set showmode


" Press F3 to launch file fuzzy search
nmap <F3> :FufCoverageFile<CR> 


" Press F5 to remove unwanted trailing whitespaces in the whole file
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>


" Press F6 to toggle color column
nnoremap <silent><F6> :call <SID>ToggleColorColumn()<cr>
" toggle colored right border after 80 chars
set colorcolumn=80
set tw=79       " width of document (used by gd)
set nowrap      " don't automaticall wrap on load
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


