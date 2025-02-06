" vim-plug Plug Manager
call plug#begin('~/.vim/plugged')

" theme(s)
Plug 'dracula/vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

" general
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'justinmk/vim-sneak'
Plug 'kien/ctrlp.vim'

" Fuzzy find
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'

" autocomplete
Plug 'ervandew/supertab'
" Plug 'Valloric/YouCompleteMe', {'do': './install.py --go-completer --ts-completer'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/syntastic'

" Linting engine
" Plug 'w0rp/ale'
Plug 'prettier/vim-prettier', {'for': [
            \ 'css',
            \ 'graphql',
            \ 'html',
            \ 'javascript',
            \ 'javascript.jsx',
            \ 'json',
            \ 'less',
            \ 'markdown',
            \ 'scss',
            \ 'typescript',
            \ 'typescriptreact',
            \ 'vue',
            \ 'yaml'
            \ ]}

" JavaScript
Plug 'gavocanov/vim-js-indent', {'for': ['javascript', 'javascript.jsx']}
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'javascript.jsx']}
Plug 'mxw/vim-jsx', {'for': ['javascript', 'javascript.jsx']}
Plug 'isRuslan/vim-es6', {'for': ['javascript', 'javascript.jsx']}
Plug 'othree/javascript-libraries-syntax.vim', {'for': ['javascript', 'javascript.jsx']}
Plug 'leafgarland/typescript-vim', {'for': ['typescript']}
Plug 'peitalin/vim-jsx-typescript', {'for': ['typescriptreact']}

" parens in the hizouse
Plug 'frazrepo/vim-rainbow'

" the odd language
" Plug 'fsharp/vim-fsharp', {'for': ['fsharp']}
" on a fresh install run :GoInstallBinaries
Plug 'fatih/vim-go', {'for': ['go']}
Plug 'AndrewRadev/splitjoin.vim'
Plug 'groenewege/vim-less', {'for': ['less']}
Plug 'cakebaker/scss-syntax.vim', {'for': ['scss']}
Plug 'PProvost/vim-ps1', {'for': ['powershell', 'ps1']}
" Plug 'derekwyatt/vim-scala', {'for': ['scala']}
" Plug 'wlangstroth/vim-racket', {'for': ['racket']}
" Plug 'rust-lang/rust.vim', {'for': ['rust']}
" Plug 'cespare/vim-toml', {'for': ['toml']}
" Plug 'puppetlabs/puppet-syntax-vim', {'for': ['puppet']}
Plug 'rgrinberg/vim-ocaml', {'for': ['ocaml']}
" Ember
Plug 'mustache/vim-mustache-handlebars', {'for': ['html.handlebars']}
" Plug 'tomlion/vim-solidity', {'for': ['solidity']}

" just plain handy to have around
Plug 'bling/vim-airline'
Plug 'mattn/emmet-vim'
Plug 'tmux-plugins/vim-tmux'

" load last to take precedence
Plug 'editorconfig/editorconfig-vim'

call plug#end()
