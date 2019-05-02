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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'davidhalter/jedi-vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'rking/ag.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'joshdick/onedark.vim'
Plug 'scrooloose/nerdcommenter'

call plug#end()

" Use true colors
set termguicolors

" Syntax highlighting
syntax on

" Use colorscheme onedark
colorscheme onedark

" Use hybrid line numbers
set number relativenumber
set nu rnu

" Display cursor line
set cursorline

" Automatically indent
set autoindent

" Highlight matching bracket
set showmatch

" Highlight all search results
set hlsearch

" Highlight when typing search
set incsearch

" Expands TABs into whitespaces
set expandtab
set shiftwidth=4

" Be able to undo a lot
set undolevels=1000

" Backspace behavior
set backspace=indent,eol,start

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

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme = "onedark"

" jedi-vim
let g:jedi#show_call_signatures = 1 
let g:jedi#popup_select_first = 0
let g:jedi#completions_enabled = 0
autocmd FileType python setlocal completeopt-=preview

" ag
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --ignore .git --ignore build-out --ignore build-opt --ignore build-dbg -g ""'
endif

" Ctrl+P opens a fuzzy filesearch window (powered by Fzf)
nnoremap <C-p> :Files<CR>

" Switch to last active tab
let g:lasttab = 1

" tt to switch between tabs
nmap tt :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" cc to hide search highlights
nnoremap cc :let @/ = ""<cr>

" \e to open a NerdTree at in the directory of the currently viewed file
nnoremap <Leader>e :Ex<CR>

" sudo write
cmap w!! w !sudo tee % >/dev/null

" remap navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" remap move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Don't expland tabs for Go
autocmd BufRead,BufNewFile *.go setlocal noexpandtab

" Go syntax highlighting
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
