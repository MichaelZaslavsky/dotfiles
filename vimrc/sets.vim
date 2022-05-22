" -----------------------------------------------------------------------------
" Basic settings
" -----------------------------------------------------------------------------

set colorcolumn=80
set encoding=utf-8
set exrc
set ignorecase
set incsearch
set noerrorbells
set nohlsearch
set nomodeline
set number relativenumber
set mouse=a
set scrolloff=8
set signcolumn=yes
set smartcase
set smartindent
set undodir=~/.vim/undodir
set undofile

" Backup settings
set backup
set backupdir=/tmp
set directory=~/.vim/tmp,.

" Enable vim clipboard by apt install vim-gtk3 and then
" this line will enable smooth copy-pasting
set clipboard=unnamedplus

" Give more space for displaying messages
set cmdheight=2

" Tab settings
set expandtab
set shiftwidth=5
set softtabstop=4
set tabstop=4

" Stop auto commenting when in comment mode and pressing enter
set formatoptions-=cro

" Open new split panes to right and bottom, which feels more natural
set splitbelow splitright

" Highlight only the cursor line number (without the cursor line)
hi CursorLineNr guifg=#af00af
set cursorline
set cursorlineopt=number
