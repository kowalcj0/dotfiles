"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""              EDITING SETTINGS
""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
" allow unsaved background buffers and remember marks/undo for them
set hidden
set mouse=r
" remember more commands and search history
set history=10000
set smartindent
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
"set cinkeys=0{,0},:,0#,!,!^F
set ruler
set ignorecase
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set hlsearch
set shell=bash
syntax on
filetype on
filetype plugin on
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

"line numbering format
set number
set numberwidth=4
highlight LineNr term=bold cterm=NONE ctermfg=White ctermbg=DarkBlue gui=NONE guifg=DarkGrey guibg=NONE
nnoremap <silent> <F7> :set invnumber<CR> " Press F7 to toggle line numbers


"SCALA syntax highlight script
"http://stackoverflow.com/questions/3626203/text-editor-for-scala/3627461#3627461
"I already had most of the setting the same as in this post
"but needed to add few more
filetype indent on " needed by scala syntax highligtning script
set showmatch  "Show matching bracets when text indicator is over them


"eclim settings
"use default Taglist instead of Eclim, avoid problem
let g:EclimTaglistEnabled=0
"let g:taglisttoo_disabled = 1 ”maybe of the same use of the above command 
"if the current file is in a Eclipse project, open project tree automatically
let g:EclimProjectTreeAutoOpen=1 
let g:EclimProjectTreeExpandPathOnOpen=1
let g:EclimProjectTreeSharedInstance=1  "share tree instance through all tabs
" use tabnew instead of split for new action
let g:EclimProjectTreeActions = [ {'pattern': '.*', 'name': 'Tab', 'action': 'tabnew'} ]

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


" toggle colored right border after 80 chars
set colorcolumn=81
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

nnoremap <silent><F6> :call <SID>ToggleColorColumn()<cr>


" toggle hex-editor
noremap <F10> :call HexMe()<CR>
let $in_hex=0
function HexMe()
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

" Press F3 to launch file fuzzy search
nmap <F3> :FufCoverageFile<CR> 


" Press F12 to toggle tab characters. Visual whitespace
nmap <F12> :set list! list?<CR> 


" start matrix screen-saver
nnoremap <silent> <F9> :call Matrix()<CR>

" A quick fix to problems with pasting code from different editor or website etc.
" 1) Start insert mode. 2) Press F2 (toggles the 'paste' option on).
" 3) Use your terminal to paste text from the clipboard. 4) Press F2 (toggles the 'paste' option off).
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode


" Tag list settings
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_WinWidth = 40
let Tlist_Inc_Winwidth = 0
let Tlist_Use_Right_Window = 1
let Tlist_Auto_Open = 0
let Tlist_Exit_OnlyWindow = 1


" yank a text, then use S to replace word and paste many times
nnoremap S diw"0P


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


