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
set shiftwidth=5
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
Plug 'junegunn/fzf', { 'dir': '~/opt/fzf' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'

" Nerd Tree plugins
Plug 'scrooloose/nerdtree'
Plug 'tsony-tsonev/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'

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

" NERDTree Settings
nmap <C-f> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" Open NERDTree automatically
autocmd VimEnter * NERDTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let g:NERDTreeGitStatusWithFlags = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeColorMapCustom = {
    \ "Staged"      : "#0ee375",
    \ "Modified"    : "#d9bf91",
    \ "Renamed"     : "#51C9FC",
    \ "Untracked"   : "#FCE77C",
    \ "Unmerged"    : "#FC51E6",
    \ "Dirty"       : "#FFBD61",
    \ "Clean"       : "#87939A",
    \ "Ignored"     : "#808080"
    \ }

let g:NERDTreeIgnore = ['^node_modules$']

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

" Enable Ag fuzzy finder
command! -bang -nargs=* Ag
  \ call fzf#vim#grep(
  \   'ag --column --numbers --noheading --color --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

map <C-g> :Ag

" vim-close tag settings:

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

