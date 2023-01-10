" Comments in Vimscript start with a `"`.


" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is" `vim -u foo`).
set nocompatible

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a



" Spaces & Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " Insert 4 spaces on a tab
set expandtab       " tabs are spaces, mainly because of python
set autoindent
set smartindent

imap jj <Esc>
imap oeu <Esc>

" Scroll [ctrlp og fzf skemma <C-u>, skil ekki ástæðuna. Workaround. Stopult]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nmap <C-h> <C-u>
nmap <C-h> <ScrollWheelUp><ScrollWheelUp><ScrollWheelUp><ScrollWheelUp>

" =============================================================================
"   PLUGINS
" =============================================================================

" Hættur með Vim-plug, spurning um að íhuga minpac eða sambærilegt,
"  aðalega til að uppfæra pakkana á kerfisbundin hátt
" https://github.com/k-takata/minpac
" vim-packager,pack,infect,vim-pck,vim8-pack,volt,autopac,plugpac.vim,minPlug


" Fyrir litabirtingu
if !has('gui_running')
    set t_Co=256
endif

set noshowmode
" Vim mode birtir óþarfi

filetype plugin on
set omnifunc=syntaxcomplete#Complete

let g:ale_completion_enabled = 1

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
"silent!
helptags ALL

packadd! sonokai
packadd! AutoComplPop

set complete+=kspell
set completeopt=menuone,noinsert
" set shortmess+=c

let g:pydiction_location = '~/.dotfiles/vim/after/ftplugin/pydiction/complete-dict'
let g:pydiction_menu_height = 3
" let g:ctrlp_prompt_mappings = {'PrtClear()': ['<c-ð>'],}
nnoremap <C-t> :NERDTree<CR>

nmap <C-p> :Files<CR>
nmap <C-i> :Buffers<CR>

"Change the default mapping and the defailt command to invoke CtrlP (works?)
" let g:ctrlp_map = '<c-p>'


let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

" let g:lightline = {}

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }


" let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]] }

let g:lightline.active = {
            \ 'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
            \            [ 'lineinfo' ],
	    \            [ 'percent' ],
	    \            [ 'fileformat', 'fileencoding', 'filetype'] ] }


let g:ale_linters = {'python': ['flake8']} " bandit, mypy, pylint, pyright
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'python': ['black', 'isort'], 'cpp': ['clang-format'], 'c': ['clang-format']} "isort (imports) remove_trailing_lines, trim_whitespace
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1

au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead *.snake set syntax=snakemake

set termguicolors
" syntax enable
" colorscheme monokai_pro
" colorscheme solarized
" colorscheme sonokai
colorscheme nord


"---------------------
" Local customizations
"---------------------

" local customizations in ~/.vimrc_local
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
