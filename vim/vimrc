
" Redundant
set nocompatible

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" Relative line numbers are useful for quickly jumping to a specific line.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" This configuration makes backspace behave more reasonably.
set backspace=indent,eol,start

" Allow hidden buffers with unsaved changes.
set hidden

" Case-insensitive search when all lowercase, else case-sensitive.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support.
set mouse+=a

" Highlight search results.
set hlsearch


" Spaces & Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " Insert 4 spaces on a tab
set expandtab       " tabs are spaces, mainly because of python
set autoindent
set smartindent

" More Esc keybindings
imap jj <Esc>
imap oeu <Esc>

" Colors
if !has('gui_running')
    set t_Co=256
endif

" Status line off
set noshowmode

" =============================================================================
"   PLUGINS
" =============================================================================

" Using native Vim 8+ package manager. Other options to consider:
" minpac, vim-packager,pack,infect,vim-pck,vim8-pack,volt,autopac,plugpac.vim,minPlug

" " Load all plugins now.
" " Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
" silent!
helptags ALL
"
packadd! sonokai



" I don't remember what this was for
" let g:ctrlp_prompt_mappings = {'PrtClear()': ['<c-ð>'],}
" Change the default mapping and the default command to invoke CtrlP (works?)
" let g:ctrlp_map = '<c-p>'

" Keymappings dependent on plugins
nnoremap <C-t> :NERDTree<CR>
nmap <C-p> :Files<CR>
nmap <C-i> :Buffers<CR>
nmap <C-c> :Commands<CR>
nmap <C-n> :set nonu! nornu!<CR>

 let g:lightline = {}

" TODO: move to local macos
" let g:lightline = {
"       \ 'colorscheme': 'monokai_pro',
"       \ }


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


let g:lightline.active = {
            \ 'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
            \            [ 'lineinfo' ],
	    \            [ 'percent' ],
	    \            [ 'fileformat', 'fileencoding', 'filetype'] ] }


let g:ale_linters = {'python': ['flake8', 'mypy']} " bandit, mypy, pylint, pyright
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'python': ['black', 'isort'], 'cpp': ['clang-format'], 'c': ['clang-format']} "isort (imports) remove_trailing_lines, trim_whitespace
let g:ale_fix_on_save = 0
let g:ale_completion_enabled = 1

au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead *.snake set syntax=snakemake

" set termguicolors
" colorscheme monokai_pro
" colorscheme solarized
" colorscheme sonokai
" colorscheme nord

" Activate autoupdate on exit
" let g:tmux_navigator_save_on_switch = 1

" Disable vim->tmux navigation when the Vim pane is zoomed in tmux
" let g:tmux_navigator_disable_when_zoomed = 1

" If the Vim pane is zoomed, stay zoomed when moving to another tmux pane
" let g:tmux_navigator_preserve_zoom = 1

" Custom Key Bindings
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <M-l> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-h> :TmuxNavigateRight<cr>
" nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
" nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
" nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

"---------------------
" Local customizations
"---------------------

" local customizations in ~/.vimrc_local
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
