" -----------------------------------------------------------------------------
" This config is targeted for Vim 8.1+ and expects you to have Plug installed
"
" The .vimrc configurations are split between several files
" * .vimrc - Includes plugins, color settings, mappings
" * sets.vim - Includes basic settings
" * plugins.vim - Includes plugin configurations
" * aucommands.vim - Includes install of vim-plug and functions
" -----------------------------------------------------------------------------

let mapleader=" "
let maplocalleader=" "

" Use a line cursor within insert mode and a block cursur everywhere else
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

filetype plugin indent on

" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

" Auto close (X)HTML tags
Plug 'alvan/vim-closetag'

" Provides IDE like abilities for Angular
Plug 'burnettk/vim-angular'

" Check syntax in Vim Asynchronously and fix files
Plug 'dense-analysis/ale'

" Support EditorConfig file in VIM
Plug 'editorconfig/editorconfig-vim'

" Intelligently reopen files at the last edit position
Plug 'farmergreg/vim-lastplace'

" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

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

" Provides IDE like abilities for C#
Plug 'OmniSharp/omnisharp-vim'

" Syntax highlighting
Plug 'pearofducks/ansible-vim'

" Intensely nerdy commenting powers
Plug 'preservim/nerdcommenter'

" Browse the tags of the current file and get an overview of its structure
Plug 'preservim/tagbar'

" A multi-language debugging system
Plug 'puremourning/vimspector'

" A bunch of useful language related snippets (ultisnips is the engine)
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

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
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()

" -----------------------------------------------------------------------------
" Color settings
" -----------------------------------------------------------------------------

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
