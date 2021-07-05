set encoding=UTF-8

" Plugin setup
call plug#begin('~/.vim/plugged')
" Plugin for PowerShell support
Plug 'pprovost/vim-ps1', { 'on': 'pwsh' }

Plug 'ctrlpvim/ctrlp.vim'
Plug 'kamykn/spelunker.vim'
Plug 'kamykn/popup-menu.nvim'
Plug 'luochen1990/rainbow'
Plug 'raimondi/delimitmate'
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/syntastic'
Plug 'speshak/vim-cfn'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'valloric/youcompleteme'
Plug 'vim-airline/vim-airline'
call plug#end()

" CtrlP
"let g:ctrlp_show_hidden = 0

" Spelunker
"let g:spelunker_highlight_type = 2
let g:spelunker_disable_acronym_checking = 1
let g:spelunker_disable_email_checking = 1

" Rainbow config
let g:rainbow_active = 1

" NERDTree config
autocmd StdinReadPre * let s:std_in=1
" open tree without specifying a file
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" open tree when specifying a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" close tree when only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" tree toggle (Ctrl+n)
map <C-n> :NERDTreeToggle<CR>

" Airline config
let g:airline_theme='material_pale'

" Airline symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
"let g:airline_left_sep = '▌'
let g:airline_left_sep = ''
"let g:airline_right_sep = '▐'
let g:airline_right_sep = ''
let g:airline_symbols.crypt = ''
"let g:airline_symbols.linenr = 'Ξ '
let g:airline_symbols.linenr = ' '
let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.branch = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = ''
let g:airline_symbols.spell = '✔'
"let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.notexists = ''
"let g:airline_symbols.whitespace = '�'
let g:airline_symbols.whitespace = ''

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cloudformation_checkers = ['cfn_lint']
let g:syntastic_json_checkers = ['jsonlint']
" set .parameters file as json file types
augroup filetype
    au BufRead,BufNewFile *.parameters set filetype=json
augroup END
let g:syntastic_filetype_map = { "parameters": "json" }

" Indents
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab

" Ctrl + Backspace
nmap <C-h> <C-w>
cmap <C-h> <C-w>
imap <C-h> <C-w>

" Set paste
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" Set line numbers
nnoremap <F3> :set invnumber number?<CR>
imap <F3> <C-O>:set invnumber number?<CR>

" Scrolling
set scrolloff=5
set mouse=r

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch
nnoremap <F4> :noh<CR>

" Misc
set showmatch
set cursorline
highlight LineNr ctermfg=DarkGrey
