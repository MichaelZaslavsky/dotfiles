" -----------------------------------------------------------------------------
" Plugin settings
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
" morhetz/gruvbox
" .............................................................................

" Specific colorscheme settings (must come before setting your colorscheme)
if !exists('g:gruvbox_contrast_light')
  let g:gruvbox_contrast_light='hard'
endif

" Set the color scheme
colorscheme gruvbox
set background=dark

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
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"

" .............................................................................
" Valloric/YouCompleteMe
" .............................................................................

nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

" Make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
