" -----------------------------------------------------------------------------
" This config is targeted for Vim 8.1+ and expects you to have Plug installed
" -----------------------------------------------------------------------------

" -----------------------------------------------------------------------------
" Basic settings
" -----------------------------------------------------------------------------

let mapleader=" "
let maplocalleader=" "

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

" Use a line cursor within insert mode and a block cursur everywhere else
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

" Auto clost (X)HTML tags
Plug 'alvan/vim-closetag'

" Check syntax in Vim Asynchronously and fix files
Plug 'dense-analysis/ale'

" Insert or delete brackets, parens and quotes in pair
Plug 'jiangmiao/auto-pairs'

" Display results in a quickfix list
Plug 'jremmen/vim-ripgrep'

" A command-line fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/opt/fzf' }
Plug 'junegunn/fzf.vim'

" Fuzzy file, buffer, tag, etc
Plug 'kien/ctrlp.vim'

" Typescript syntax files
Plug 'leafgarland/typescript-vim'

" Highlight which text was yanked
Plug 'machakann/vim-highlightedyank'

" The undo history visualizer
Plug 'mbbill/undotree'

" Retro groove color scheme
Plug 'morhetz/gruvbox'

" Visually display indent levels in code
Plug 'nathanaelkane/vim-indent-guides'

" Syntax highlighting
Plug 'pearofducks/ansible-vim'

" A bunch of useful language related snippets (ultisnips is the engine)
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" An extensible & universal comment Vim plugin
Plug 'tomtom/tcomment_vim'

" A git wrapper
Plug 'tpope/vim-fugitive'

" Ease working with surroundings such as parentheses/quotes/etc
Plug 'tpope/vim-surround'

" A code-completion engine
Plug 'Valloric/YouCompleteMe'

" View and grep man pages
Plug 'vim-utils/vim-man'

" Languages and file types
Plug 'hashivim/vim-terraform'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" Nerd Tree plugins - a tree explorer plugins
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tsony-tsonev/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()

" -----------------------------------------------------------------------------
" Color settings
" -----------------------------------------------------------------------------

" Enable syntax highlighting
syntax on

highlight ColorColumn ctermbg=0 guibg=lightgrey

" Specific colorscheme settings (must come before setting your colorscheme)
if !exists('g:gruvbox_contrast_light')
  let g:gruvbox_contrast_light='hard'
endif

" Set the color scheme
colorscheme gruvbox
set background=dark

" -----------------------------------------------------------------------------
" Basic mappings
" -----------------------------------------------------------------------------

" Navigate around splits with a single key combo
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
nnoremap <leader>dt :put=strftime('@@%Y-%m-%d')<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Prevent x from overriding what's in the clipboard
noremap x "_x
noremap X "_X

" Open terminal
nnoremap <leader>t :term<CR>

" -----------------------------------------------------------------------------
" Basic autocommands
" -----------------------------------------------------------------------------

" Install vim-plug in case it doesn't exist
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

autocmd BufNewFile,BufRead Jenkinsfile setf groovy

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

" -----------------------------------------------------------------------------
" Plugin settings, mapping and autocommands
" -----------------------------------------------------------------------------

" .............................................................................
" alvan/vim-closetag
" .............................................................................

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files
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

" .............................................................................
" dense-analysis/ale
" .............................................................................

" Linting
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %code% %s [%severity%]'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" .............................................................................
" 'jremmen/vim-ripgrep'
" .............................................................................

if executable('rg')
    let g:rg_derive_root='true'
endif

" .............................................................................
" junegunn/fzf
" .............................................................................

" Enable Ag fuzzy finder
command! -bang -nargs=* Ag
  \ call fzf#vim#grep(
  \   'ag --column --numbers --noheading --color --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

map <C-g> :Ag

" .............................................................................
" kien/ctrlp.vim
" .............................................................................

let g:ctrlp_user_command = [
    \'.git/',
    \'git --git-dir=%s/.git ls-files -oc --exclude-standard'
    \]

" ag is fast enough that CtrlP doesn't need to cache "
let g:ctrlp_use_caching = 0

" .............................................................................
" Nerd Tree plugins
" .............................................................................

nmap <C-f> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" Open NERDTree automatically
autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | endif
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 25
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

" .............................................................................
" python-mode/python-mode
" .............................................................................

" If there is an error show it in the same buffer
let g:pymode_lint_cwindow = 0

" .............................................................................
" 'SirVer/ultisnips'
" .............................................................................

let g:UltiSnipsEditSplit="vertical"

" Better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"

" Jump to the next/prev position
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" .............................................................................
" Valloric/YouCompleteMe
" .............................................................................

nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

" Make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
