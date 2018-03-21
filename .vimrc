"  Main settings
"---------------------------
filetype on
syntax on
colorscheme Tomorrow-Night
set guifont=Menlo\ Regular:h18
set number
set hidden
set history=100
filetype indent on
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set hlsearch
" Show trailing whitespace
set list
" Display tabs an invisible characters
set listchars=tab:▸\ ,trail:▫
" Save with utf8 encoding
set encoding=UTF-8
" Open bash
set shell=/bin/bash

"  Plugins.
"---------------------------
call plug#begin('~/.vim/bundle')

"  Base plugin
"Plug 'tpope/vim-sensible' " set defaults for most plugins

"> Syntax highlighting
Plug 'junegunn/seoul256.vim' " Color scheme

Plug 'sheerun/vim-polyglot' " language SYNTAX packs
Plug 'heavenshell/vim-jsdoc' " needed for JSDoc
Plug 'othree/javascript-libraries-syntax.vim' " libs syntax
" included in vim-polyglot:
"Plug 'elzr/vim-json' " included into vim-polyglot
"Plug 'mxw/vim-jsx' " included into vim-polyglot
"Plug 'pangloss/vim-javascript' " included into vim-polyglot

"> Coding
Plug 'Valloric/YouCompleteMe' " autocomplete
Plug 'ternjs/tern_for_vim' " needs for YouCompleteMe
Plug 'ervandew/supertab' " select on tabulation
Plug 'Chiel92/vim-autoformat' " spaces/braces etc. (ESlint/gofmt)
Plug 'ruanyl/vim-fixmyjs' " ESlint fix inside Vim
Plug 'moll/vim-node' " Fast navigation into required files
"Plugin 'flowtype/vim-flow' " if we need Facebook Flow (must be installed b4)

"  Plugin provides a start screen
Plug 'mhinz/vim-startify'

"  Use Gist
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'


"  Automatic closing of quotes, parenthesis, brackets, etc.
"Plug 'Raimondi/delimitMate'

"Plug 'mattn/emmet-vim'
"  Syntax linter
Plug 'w0rp/ale'
"  Lingtline on bottom and upgrade for it
Plug 'itchyny/lightline.vim'      " bottom line
Plug 'mgee/lightline-bufferline'  " top line
" ???
Plug 'maximbaz/lightline-ale'
"  Add icons to various things
Plug 'ryanoasis/vim-devicons'
"Plug 'ain/vim-npm'
"Plug 'janko-m/vim-test'
"Plug 'heavenshell/vim-jsdoc'
"Plug 'joshhartigan/vim-reddit'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Plugins settings
"---------------------------
">>> Polyglot disable:
let g:polyglot_disabled = ['swift, racket, r-lang, kotlin, handlebars, fish']

">>> vim-javascript
let g:javascript_plugin_jsdoc = 1
" Enables code folding for javascript based on our syntax file
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

">>> jsdoc on function declaration
nmap <silent> <C-l> ?function<cr>:noh<cr><Plug>(jsdoc)

">>> libs settings:
let g:used_javascript_libs = 'underscore,react,chai'

">>> fixmyjs
let g:fixmyjs_engine = 'eslint'
noremap <Leader><Leader>f :Fixmyjs<CR>

">>> fast navigation into required files (moll/vim-node)
autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif

" Open colors
if !has('gui_running')
  set t_Co=256
endif

" ALE
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title  

" Lightline
set laststatus=2
set noshowmode
let g:lightline = {
\ 'colorscheme': 'seoul256',
\ 'active': {
\   'left': [['mode', 'paste'], ['gitbranch', 'filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok']]
\ },
\ 'component_function': {
\   'gitbranch': 'gitbranch#name'
\ },
\ 'component_expand': {
\  'linter_checking': 'lightline#ale#checking',
\  'linter_warnings': 'lightline#ale#warnings',
\  'linter_errors': 'lightline#ale#errors',
\  'linter_ok': 'lightline#ale#ok',
\  'buffers': 'lightline#bufferline#buffers'
\ },
\ 'component_type': {
\     'linter_checking': 'left',
\     'linter_warnings': 'warning',
\     'linter_errors': 'error',
\     'linter_ok': 'left',
\     'buffers': 'tabsel'
\ },
\ 'tabline': {'left': [['mode', 'paste'], ['buffers']], 'right': [['readonly']]}
\ }
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"
" Lightline top
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#show_number = 0 
let g:lightline#bufferline#modified = ' +'
let g:lightline#bufferline#unnamed = '[No Name]'

set noshowmode
set showtabline=2  " Always show tabline
if has('gui_running')
  set guioptions-=e  " Don't use GUI tabline
endif

function! ComputeLinterCounts() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return {'counts': l:counts, 'all_errors': l:all_errors, 'all_non_errors': l:all_non_errors}
endfunction

function! LightlineLinterWarnings() abort
  let l:counts = ComputeLinterCounts()
  return l:counts.counts.total == 0 ? '' : printf('%d ◆', l:counts.all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ComputeLinterCounts()
  return l:counts.counts.total == 0 ? '' : printf('%d ✗', l:counts.all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

" Update and show lightline but only if it's visible
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

">>> YouCompleteMe
"set completeopt-=preview " Don't show YCM's preview window [ I find it really annoying ]
"let g:ycm_add_preview_to_completeopt = 0
let g:ycm_min_num_of_chars_for_completion = 2 " Start autocompletion after 2 chars
let g:ycm_min_num_identifier_candidate_chars = 2
"let g:ycm_confirm_extra_conf=0
"let g:ycm_enable_diagnostic_highlighting = 0
"
">>> Supertab bindings
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
"let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

" Use CtrlP to search tags. (p)
nmap <silent> <leader>p :CtrlPTag<CR>

" Make CtrlP replace the Startify buffer.
let g:ctrlp_reuse_window = 'startify'

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" Enable indent guides on boot and allow colorschemes to style them.
nmap <silent> <leader>i :IndentGuidesToggle<CR>
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=0

">>> Gists
let g:gist_post_private = 0
let g:gist_post_anonymous = 0
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
