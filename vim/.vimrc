source $HOME/.vim/vim-plug/plugins.vim

syntax on

set t_Co=256

let g:airline_powerline_fonts = 1

let mapleader = ","

" configure fzf
if (executable('ag'))
    let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
endif
nnoremap <C-P> :Files<CR>

" NERDTree
map <F2> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen=1

" vim-go
let g:go_fmt_autosave=1
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
" autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" make lispy things pretty
let g:rainbow_active = 1
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']

" Pythonic gudniss
" autocmd BufWritePost *.py call Flake8()
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
let python_highlight_all=1
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" JavaScript - The Cash Maker
let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required = 0

" teach emmet the ways of jsx
let g:user_emmet_settings = {
\  'javascript': {
\    'extends': 'jsx',
\  },
\  'typescript': {
\    'extends': 'tsx',
\  },
\}

" ale linter
" let g:ale_fix_on_save = 1
" let g:ale_lint_on_text_changed = 'always'
" let g:ale_lint_delay = 1000
" " let g:ale_sign_error = '✗\ '
" " let g:ale_sign_warning = '⚠\ '
" let g:ale_fixers = {
" \  '*': ['remove_trailing_lines', 'trim_whitespace'],
" \}

" YCM Customization
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_min_num_of_chars_for_completion = 2
" let g:ycm_max_num_candidates = 20
" let g:ycm_max_num_identifier_candidates = 10
" let g:ycm_auto_trigger = 0
" nnoremap <leader>g   :YcmCompleter GoToDefinitionElseDeclaration<CR>
" nnoremap <leader>dl  :YcmCompleter GoToDeclaration<CR>
" nnoremap <leader>df  :YcmCompleter GoToDefinition<CR>
" nnoremap <leader>#   :YcmCompleter GoToReferences<CR>
" let g:ycm_key_list_select_completion = ['\<C-TAB>', '\<DOWN>']
" let g:ycm_key_list_previous_completion = ['\<C-S-TAB>', '\<UP>']
" let g:ycm_filetype_blacklist = {
"       \ 'tagbar': 1,
"       \ 'qf': 1,
"       \ 'notes': 1,
"       \ 'markdown': 1,
"       \ 'unite': 1,
"       \ 'text': 1,
"       \ 'vimwiki': 1,
"       \ 'pandoc': 1,
"       \ 'infolog': 1,
"       \ 'mail': 1
"       \}
" let g:ycm_filepath_blacklist = {
"       \ 'html': 1,
"       \ 'jsx': 1,
"       \ 'xml': 1,
"       \}
" let g:SuperTabDefaultCompletionType='\<C-TAB>'

" on with the show
set autochdir
set modelines=0
set nobackup
set clipboard+=unnamed
set hidden
set mouse=a
set noerrorbells " don't speak
set novisualbell " don't blink
set vb t_vb=     " not even for a second
set autowriteall
set whichwrap=b,s,<,>,~
 "            | | | | |
 "            | | | | |
 "            | | | | |
 "            | | | | +-- "~" Normal
 "            | | | +-- <Right> Normal and Visual
 "            | | +-- <Left> Normal and Visual
 "            | +-- <Space> Normal and Visual
 "            +-- <BS> Normal and Visual
set cpoptions=aABceFsmq
 "            |||||||||
 "            ||||||||+-- When joining lines, leave the cursor
 "            |||||||      between joined lines
 "            |||||||+-- When a new match is created (showmatch)
 "            ||||||      pause for .5
 "            ||||||+-- Set buffer options when entering the
 "            |||||      buffer
 "            |||||+-- :write command updates current file name
 "            ||||+-- Automatically add <CR> to the last line
 "            |||      when using :@r
 "            |||+-- Searching continues at the end of the match
 "            ||      at the cursor position
 "            ||+-- A backslash has no special meaning in mappings
 "            |+-- :write updates alternative file name

" formatting
set encoding=utf-8
set fileencoding=utf-8
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set shiftround
set nowrap
set autoindent
set smartindent

set scrolloff=3
set showmode
set showcmd
set backspace=indent,eol,start
set wildmenu
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png
set wildmode=list:longest

" ui settings
set guifont=Ubuntu\ Mono\ 12
colorscheme catppuccin_mocha
set laststatus=2     " always show the status line
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
 "             | | | | |  |   |      |  |     |    |
 "             | | | | |  |   |      |  |     |    + current column
 "             | | | | |  |   |      |  |     +-- current line
 "             | | | | |  |   |      |  +-- current % into file
 "             | | | | |  |   |      +-- current syntax in square brackets
 "             | | | | |  |   +-- current fileformat
 "             | | | | |  +-- number of lines
 "             | | | | +-- preview flag in square brackets
 "             | | | +-- help flag in square brackets
 "             | | +-- readonly flag in square brackets
 "             | +-- rodified flag in square brackets
 "             +-- full path to file in the buffer
set ttyfast          " faster redrawing
set lazyredraw       " do not redraw while running macros
set cursorline       " find the current line quickly
set linespace=0
set list
set listchars=tab:>-,trail:-
set nostartofline    " leave my cursor where it was
set number           " turn on line numbers
set numberwidth=4    " We are good up to 9999 lines
set report=0         " tell us when anything is changed via :...
set ruler            " Always show current positions along the bottom
set shortmess=aOstT
set sidescrolloff=10 " Keep 5 lines at the size
syntax on

" searching/moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault    " always use global replace
set showmatch   " show matching brackets
set matchtime=5 " tenths of a second to blink
set hlsearch    " highlighted search
set incsearch   " BUT do highlight as you type searchterm
nnoremap <leader><space> :noh<CR> " '\ ' turns off highlighting

" Folding
set foldenable        " Turn on folding
set foldmarker={,}    " Fold C style code (only use this as default if you use a high foldlevel)
set foldmethod=marker " Fold on the marker
set foldlevel=100     " Don't autofold anything (but I can still fold manually)
"set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds

" convenience
inoremap <F1> <ESC> " mitigate missing mode key
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
inoremap jj <ESC>
" disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
"trim all trailing whitespace
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>
"css sort
nnoremap <leader>S ?{<CR>jV/^\s*\}$<CR>k:sort<CR>:noh<CR>
"fold tag
nnoremap <leader>ft Vatzf
"make split windows saner
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"gui defaults and display control
" menu, toolbar, and right-scroll off by default
set guioptions-=m
set guioptions-=T
set guioptions-=r
nnoremap <C-m> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <C-t> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
nnoremap <C-r> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>

" 7.3
set relativenumber
set undofile
set undodir=/tmp

" Custom
 " Enable a nice big viminfo file
set viminfo='500,f1,:500,/500
set history=200
