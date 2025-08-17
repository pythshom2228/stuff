set number
set cursorline
set nohlsearch
set tabstop=4
set shiftwidth=4
set expandtab
set path+=**
set mouse+=a
set mat=2
set nocompatible            " disable compatibility to old-time vi
set ignorecase
set showmatch               " show matching 
set mouse=v 
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   "allow auto-indenting depending on file type
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set ttyfast    
set autoindent              " indent a new line the same amount as the line just typed
set showcmd

set belloff=all
set novisualbell
"set t_vb=
set tm=500
set ruler
let mapleader = ","  

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
 Plug 'morhetz/gruvbox' 
" Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
" Plug 'sheerun/vim-polyglot'
 Plug 'mhinz/vim-startify'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'vim-airline/vim-airline'
 Plug 'prabirshrestha/vim-lsp'
 Plug 'mattn/vim-lsp-settings'
 Plug 'prabirshrestha/asyncomplete.vim'
 Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()
let g:gruvbox_contrast_dark = 'hard'
let g:airline_theme='dark'
colorscheme gruvbox
set background=dark


 "#Включение vim-lsp
if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'clangd',
            \ 'cmd': {server_info->['clangd']},
            \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
            \ })
    augroup END
endif

" Включение автоматического завершения (опционально)
let g:asyncomplete_auto_completeopt = 1
set completeopt=menuone,noinsert,noselect
let g:lsp_completion_documentation_enabled = 1

" Включение диагностики (ошибок)
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_float_delay = 500
let g:lsp_diagnostics_signs_enabled = 0
let g:lsp_diagnostics_virtual_text_enabled = 0
"let g:lsp_diagnostics_virtual_text_delay = 2000

" Горячие клавиши
nnoremap <silent> gd :LspDefinition<CR>
nnoremap <silent> gr :LspReferences<CR>
nnoremap <silent> K :LspHover<CR>
nnoremap <silent> <F2> :LspRename<CR>
nnoremap <silent> <leader>f :LspDocumentFormat<CR>
nnoremap <leader>dn :LspNextDiagnostic<CR>
nnoremap <leader>dp :LspPreviousDiagnostic<CR>
" Включение asyncomplete
set completeopt=menuone,noinsert,noselect,preview
let g:asyncomplete_auto_popup = 1  " Автовызов меню
let g:asyncomplete_popup_delay = 500  " Задержка перед показом (мс)

" Разукраска синтаксиса
let g:lsp_semantic_enabled=1

set pumheight=10
set pumwidth=50

highlight Pmenu ctermfg=Black ctermbg=Magenta
highlight PmenuSel ctermfg=Black ctermbg=Cyan

set guifont=12
