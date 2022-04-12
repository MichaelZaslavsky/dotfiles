set exrc
set number relativenumber
set nohlsearch
set noerrorbells
set smartindent
set encoding=utf-8
set mouse=a
set incsearch
set ignorecase
set smartcase
set scrolloff=8
set signcolumn=yes
set undodir=~/.vim/undodir
set undofile

" Enable vim clipboard by apt install vim-gtk3 and then
" this line will enable smooth copy-pasting
set clipboard=unnamedplus

" Tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Backup settings
set backupdir=/tmp
set directory=~/.vim/tmp,.
set backup

" Stop auto commenting when in comment mode and pressing enter
set formatoptions-=cro

" Open new split panes to right and bottom, which feels more natural
set splitbelow splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Give more space for displaying messages
set cmdheight=2

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Install vim-plug in case it doesn't exist
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'git@github.com:kien/ctrlp.vim.git'
Plug 'git@github.com:Valloric/YouCompleteMe.git'
Plug 'git@github.com:machakann/vim-highlightedyank'
Plug 'git@github.com:hashivim/vim-terraform.git'
Plug 'mbbill/undotree'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'pearofducks/ansible-vim'
Plug 'tomtom/tcomment_vim'

" shows tab spaces
Plug 'git@github.com:nathanaelkane/vim-indent-guides'

call plug#end()

colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = [
    \'.git/',
    \'git --git-dir=%s/.git ls-files -oc --exclude-standard'
    \]

let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 25

" Use a line cursor within insert mode and a block cursur everywhere else
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" ag is fast enough that CtrlP doesn't need to cache "
let g:ctrlp_use_caching = 0

" If there is an error show it in the same buffer
let g:pymode_lint_cwindow = 0

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

" Open terminal
nnoremap <leader>t :term<CR>

nnoremap <leader>dt :put=strftime('@@%Y-%m-%d')<CR>

" YCM
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Prevent x from overriding what's in the clipboard
noremap x "_x
noremap X "_X

" Security options
set nomodeline

" Trim white spaces in the file
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

