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

" setting for the vim-airline
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_theme='wombat'
" Enable the list of buffers
"let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'



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

" make undescore a word separator
set iskeyword-=_

" configure github username for the vim-github-comment
let g:github_user = 'kowalcj0'
"Optionally, browser can be opened with your comment after you post it:
let g:github_comment_open_browser = 1


" Fix the issues with X11 clipboard
" http://vim.wikia.com/wiki/Accessing_the_system_clipboard
set clipboard=unnamedplus
set showmode

" always show tabline
set showtabline=2

" Pathogen load
" https://github.com/klen/python-mode#id6
filetype off

" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name folder
execute pathogen#infect()
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
let g:UltiSnipsListSnippets="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
"color wombat256mod
"color miko
color badwolf


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



" configure SignColumn used by vim-gitgutter
" https://github.com/airblade/vim-gitgutter#sign-column
hi SignColumn ctermbg=0 ctermfg=white
hi GitGutterAdd ctermbg=0 ctermfg=46
hi GitGutterChange ctermbg=0 ctermfg=172
hi GitGutterDelete ctermbg=0 ctermfg=160
hi GitGutterChangeDelete ctermbg=0 ctermfg=40


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


" Show absolute line numbers when the window isn't in focus.
au WinEnter * setl rnu | au WinLeave * setl nornu


" Remap CtrlP.vim keys config to open files aleays in a new tab
" https://github.com/kien/ctrlp.vim/issues/160
"let g:ctrlp_prompt_mappings = {
    "\ 'AcceptSelection("e")': ['<c-t>'],
    "\ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    "\ }
" CtrlP - Exclude files or directories using Vim's wildignore:
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*/.git/*,*~,*.db,.DS_Store,*.jar
let g:ctrlp_show_hidden = 1


"jedi - > copied from cliffxuan
let g:jedi#use_tabs_not_buffers = 1
" no docstring window popup during completion
autocmd FileType python setlocal completeopt-=preview


" Settings for vim-markdown
" ==========================
let g:vim_markdown_folding_disabled=1
" let g:vim_markdown_initial_foldlevel=1


""""""""""""" LEARNING VIM THE HARD WAY
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Shortcuts provided by vim-expand-region
" https://github.com/terryma/vim-expand-region
" visually select anything and then press + to expand the visual selection
" and _ to shrink it.

" define the Leader key
" handy with new shortcuts
let mapleader="\<Space>"


" emacs like jumping to the begging and end of line using Ctrl+a and Ctrl+e
imap <C-q> <C-o>^
imap <C-e> <C-o>$
map <C-e> $
map <C-q> ^


" Navigate wrapped lines naturally
nnoremap j gj
nnoremap k gk


" center the window automatically around the cursor after jumping to a location
nnoremap n nzz
nnoremap N Nzz
nnoremap } }zz
nnoremap { {zz


" Y will yank from the cursor to the end of the line
nnoremap Y y$


" move to last change
nnoremap <Leader>l `.


" Visual line repeat by Drew Neil
" https://github.com/nelstrom/dotfiles/
xnoremap . :normal .<CR>
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction


" http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
" Open CtrlP Buffer Explorer using leader + m
nnoremap <leader>b :CtrlPBuffer<CR>
" Type <Leader>o to open a new file:
nnoremap <Leader>o :CtrlP<CR>
" Type <Leader>w to save file (a lot faster than :w<Enter>):
nnoremap <Leader>w :w<CR>
" " Copy & paste to system clipboard with <Leader>p and <Leader>y:
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P


" enable built-in spell checker
nmap <Leader>s :set invspell spelllang=en<CR>


" VIM Pytest
" https://github.com/alfredodeza/pytest.vim
nmap <silent><Leader>f <Esc>:Pytest function<CR>


" Reformat whole file
nnoremap <Leader>r mzgg=G`z


" Copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa


" Comments plugin - use non default shortcuts
let g:comments_map_keys = 0
" key-mappings for comment line in normal mode
noremap  <silent> <Leader>m :call CommentLine()<CR>
" key-mappings for range comment lines in visual <Shift-V> mode
vnoremap <silent> <Leader>m :call RangeCommentLine()<CR>
" key-mappings for un-comment line in normal mode
noremap  <silent> <Leader>u :call UnCommentLine()<CR>
" key-mappings for range un-comment lines in visual <Shift-V> mode
vnoremap <silent> <Leader>u :call RangeUnCommentLine()<CR>


" Open file explorer in a new Tab
nnoremap <leader>E :Texplore<CR>
" Open file explorer in the same window or split
nnoremap <leader>e :Explore<CR>


" Move to the previous buffer
nnoremap H :bprevious<CR>
" Move to the next buffer
nnoremap L :bnext<CR>
" Replace H and L: H jump screen top, L screen down
nnoremap zh H
nnoremap zl L


" Move visual block up and down using J and K
" http://vimrcfu.com/snippet/77
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


" hit Ctrl+s in any mode to save the file
" Note that remapping C-s requires flow control to be disabled
" " (e.g. in .bashrc or .zshrc)
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>


" folding using Space
set foldenable
" found http://vim.wikia.com/wiki/Folding#Mappings_to_toggle_folds
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf


" select lines with visual block and press 's' to sort them
" useful when sorting imports
vnoremap <Leader>s :sort<CR>


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
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>


" resize current buffer by +/- 5 - using Ctrl+w+hjkl
nnoremap <C-w>h :vertical resize -5<cr>
nnoremap <C-w>j :resize +5<cr>
nnoremap <C-w>k :resize -5<cr>
nnoremap <C-w>l :vertical resize +5<cr>


" Open splits in various ways
set splitright  " open splits to the right
noremap <leader>h :Sex<CR>
noremap <leader>v :Vex!<CR>
noremap <leader>n :vnew<CR>
noremap <leader>t :Tex<CR>


" yank a text, then use S to replace word and paste many times
nnoremap S diw"0P
"change paste - will replace word with pasted word
map <silent> cp "_cw<C-R>"<Esc>


"line and column highlight
"press ,+c to toggle the highlight
:set cursorline cursorcolumn
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
hi CursorLine   cterm=NONE ctermbg=darkgray ctermfg=NONE "guibg=lightgrey guifg=white
hi CursorColumn cterm=NONE ctermbg=darkgray ctermfg=NONE "guibg=lightgrey guifg=white


" leader + space to clear the search results highlighting
map <Leader><Space> :noh<CR>;


" open the current buffer in a new tab
nmap tt :tabedit %<CR>
" will open the current buffer in a new tab
nmap tc :tabclose<CR>

"""""""""""""""""""""""" Search for word under cursor using * and # """""""""""
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
"""""""""""""""""""""""" Search for word under cursor using * and # """""""""""


nnoremap <C-W>O :call MaximizeToggle()<CR>
nnoremap <C-W>o :call MaximizeToggle()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle()<CR>

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" END OF Shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => F-keys mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A quick fix to problems with pasting code from different editor or website etc.
" 1) Start insert mode. 2) Press F2 (toggles the 'paste' option on).
" 3) Use your terminal to paste text from the clipboard. 4) Press F2 (toggles the 'paste' option off).
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>


" Pres F3 to toggle number mode
set relativenumber
set number
set numberwidth=4
highlight LineNr term=bold cterm=NONE ctermfg=White ctermbg=DarkBlue gui=NONE guifg=DarkGrey guibg=NONE
function! ToggleNumberMode()
    if &relativenumber == 1
	    set norelativenumber
        set number
	    echo "normal numbering"
    elseif &number == 1
	    set nonumber
	    echo "numbering off"
    else
	    set relativenumber
        set invnumber
	    echo "relative numbering"
    endif
    return
endfunc
nnoremap <F3> :call ToggleNumberMode()<cr>
vnoremap <F3> :call ToggleNumberMode()<cr>
inoremap <F3> <c-o>:call ToggleNumberMode()<cr>


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
"set nowrap      " don't automatically wrap on load
"set fo-=t       " don't automatically wrap text when typing
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


" Press F8 to toggle tag list
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_WinWidth = 40
let Tlist_Inc_Winwidth = 0
let Tlist_Use_Right_Window = 1
let Tlist_Auto_Open = 0
let Tlist_Exit_OnlyWindow = 1


" Press F10 to toggle hex-editor
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
" ◉ - for non breaking space (U+00A0)
" »» - for tab
" ¶ - for trailing spaces
exec "set listchars=tab:\uBB\uBB,trail:\uB6,nbsp:\u25c9"
" Press F12 to toggle tab characters. Visual whitespace
nmap <F12> :set list! list?<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => END OF F-keys mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

