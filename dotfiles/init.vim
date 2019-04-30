
" Set true colors
set termguicolors

" Set line numbers
set number relativenumber
set nu rnu

" Set cursorline
set cursorline

" Plugins

call plug#begin('~/.local/share/nvim/plugged')

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'junegunn/fzf'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jelera/vim-javascript-syntax'
Plug 'hdima/python-syntax'
Plug 'editorconfig/editorconfig-vim'
Plug 'ternjs/tern_for_vim'
Plug 'mxw/vim-jsx'

call plug#end()

" LanguageClient config
let g:LanguageClient_serverCommands = {
       \ 'go': ['gopls'],
       \ 'python': ['/usr/local/bin/pyls'],
       \ 'javascript.jsx': ['js-langserver', '--stdio'],
       \ }
" Run gofmt and goimports on save
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

" Python highlight
let python_highlight_all = 1
