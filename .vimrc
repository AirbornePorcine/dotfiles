set nocompatible	" No need for vi compatibility
filetype off		" Required for vundle

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
 
" Core Plugin
Plugin 'gmarik/vundle'

" Your Plugins Here
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'kien/ctrlp.vim'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'stephpy/vim-yaml'
Plugin 'godlygeek/tabular'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'fatih/vim-go'
Plugin 'moll/vim-bbye'
Plugin 'saltstack/salt-vim'
Plugin 'bling/vim-airline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'vim-scripts/argtextobj.vim'

call vundle#end()
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set modelines=0		" Stops some security exploits
set encoding=utf-8
set scrolloff=3		" Show 3 lines above/below line when scrolling
set autoindent		" Use same indent as last line
set hidden			" Hide unsaved buffers to make opening new files easy
set wildmenu		" Helpful completion of commands
set wildmode=longest:full,full
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set visualbell		" Flash screen instead of making noises
set cursorline		" Highlight the line that the cursor is on
set ttyfast			" Fast terminal
set backspace=indent,eol,start	" Backspace through everything
set tabstop=4
set shiftwidth=4
set noexpandtab

set ignorecase		" Case-insensitive if no uppercase, otherwise sensitive
set smartcase
set gdefault		" Applies substitutions globally on line
set incsearch		" Highlighting search results nicely
set showmatch
set hlsearch

" Wrap text and show a line at 80 characters
set textwidth=79
set formatoptions=qrn1
set colorcolumn=80

" Show tab characters
set list
set listchars=tab:▸\ 

" Save on losing focus
au FocusLost * :wa

set laststatus=2	" Always display the statusline in all windows
set showtabline=1	" Always display the tabline, even if there is only one tab
set noshowmode		" Hide the default mode text (e.g. -- INSERT -- below the statusline)

set relativenumber	" Show relative line numbers

" Set color scheme
syntax on
set background=dark
set t_Co=256
colorscheme solarized

" Syntax highlighting for YAML
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/bundle/vim-yaml/after/syntax/yaml.vim

" Store backups and swap files elsewhere
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

" Use OSX clipboard register by default
set clipboard=unnamed

" Extended history
set history=1000

" Lazy redraw
set lazyredraw

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Fix regex handling
nnoremap / /\v
vnoremap / /\v

" Disable arrows
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Map leader to ,
let mapleader = ","

" Clear search with <leader><space>
nnoremap <leader><space> :noh<cr>

" Match brackets with <tab> instead of %
nnoremap <tab> %
vnoremap <tab> %

" Remap F1 to escape because it's dumb
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Remap ; to : so we don't have to type shift
nnoremap ; :

" Remap jk to <ESC>
inoremap jk <ESC>

" Line break with brackets
imap <C-c> <CR><Esc>O

" Nerd tree toggle
nmap <leader>f :NERDTreeToggle<CR>

" Smooth half-page scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>

" Quick insertion of line breaks in normal mode
nmap <CR> o<Esc>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
set wmh=0

" Remap VIM 0 to first non-blank character
map 0 ^

" Fast saving
nmap <leader>w :w!<cr>

" Quick cycle through buffers
:nnoremap <leader>n :bnext<CR>
:nnoremap <leader>p :bprevious<CR>

" Map closing buffers
:nnoremap <Leader>q :Bdelete<CR>

" Golang mappings
"""""""""""""""""

" Rename
au FileType go nmap <Leader>e <Plug>(go-rename)

" Run, build, test, coverage
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" Implements
au FileType go nmap <Leader>s <Plug>(go-implements)

" Info
au FileType go nmap <Leader>ii <Plug>(go-info)

" Godoc / godoc vertical
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" Install
au FileType go nmap <Leader>i <Plug>(go-install)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Nerd tree options
let NERDTreeDirArrows=1
let NERDTreeHighlightCursorLine=1

" Syntastic options
let g:syntastic_check_on_open=1

" vim go options
let g:go_bin_path = expand("~/.gotools")
let g:go_fmt_command = "goimports"

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
