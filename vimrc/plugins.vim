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

" Change the default mapping and the default command to invoke CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" When invoked, unless a starting directory is specified,
" CtrlP will set its local working directory according to this variable
let g:ctrlp_working_path_mode = 'ra'

" Exclude files or directories using Vim's wildignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn)$',
	\ 'file': '\v\.(exe|so|dll)$',
	\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
	\ }

" Use a custom file listing command
let g:ctrlp_user_command = {
	\ 'types': {
		\ 1: ['.git', 'cd %s && git ls-files'],
		\ 2: ['.hg', 'hg --cwd %s locate -I .'],
		\ },
	\ 'fallback': 'find %s -type f'
	\ }

" ag is fast enough that CtrlP doesn't need to cache "
let g:ctrlp_use_caching = 0

" Search by file name and not by directory name
let g:ctrlp_by_filename = 1

" Show hidden directories
let g:ctrlp_show_hidden = 1

" .............................................................................
" Nerd Tree plugins
" .............................................................................

nmap <C-f> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" Open NERDTree automatically
autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | endif
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let g:netrw_browse_split = 2
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

let g:NERDTreeIgnore = ['^node_modules$', '\.*.swp$']
let g:NERDTreeShowHidden = 1

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
