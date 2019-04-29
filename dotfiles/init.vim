
" Set true colors
set termguicolors

" Plugins

call plug#begin('~/.local/share/nvim/plugged')

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'junegunn/fzf'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

" LanguageClient config
let g:LanguageClient_serverCommands = {
       \ 'go': ['gopls'],
       \ 'python': ['/usr/local/bin/pyls'],
       \ 'javascript.jsx': ['js-langserver', '--stdio'],
       \ }
" Run gofmt and goimports on save
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()
