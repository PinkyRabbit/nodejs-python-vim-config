" turns on detection, plugin and indent all 3 at once
filetype plugin indent on

"  Plugins
"---------------------------
call plug#begin("~/.vim/bundle")

"> Syntax highlighting
Plug 'sheerun/vim-polyglot' "  language SYNTAX packs
Plug 'heavenshell/vim-jsdoc' "  needed for JSDoc
Plug 'othree/javascript-libraries-syntax.vim' "  libs syntax
" included in vim-polyglot:
" Plug 'elzr/vim-json ' " included into vim-polyglot
" Plug 'mxw/vim-jsx ' " included into vim-polyglot
" Plug 'pangloss/vim-javascript ' " included into vim-polyglot

"> Snippets
Plug 'SirVer/ultisnips' " base
" Plug 'honza/vim-snippets' " html C etc... 
Plug 'epilande/vim-es2015-snippets' " es6
Plug 'epilande/vim-react-snippets' " react
Plug 'alexbyk/vim-ultisnips-js-testing' " mocha/jasmine

"> Coding
Plug 'w0rp/ale' " Syntax linter
Plug 'Chiel92/vim-autoformat' " spaces/braces etc. (ESlint/gofmt)
Plug 'ruanyl/vim-fixmyjs' "  ESlint fix inside Vim
Plug 'Valloric/MatchTagAlways' " highlight enclosing tags

"> Navigation
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'moll/vim-node'

"> GitHub
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
:" Plug 'mhinz/vim-signify' "show difference with last version

"> Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"> Misc
Plug 'vim-scripts/npm.vim' " run NPM commands in Vim
Plug 'tpope/vim-surround' "  parentheses, brackets etc.

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Settings
"---------------------------

"> syntax
let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required = 0
let g:used_javascript_libs = 'underscore,react,chai'

"> MatchTagAlways
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'art' : 1,
    \ 'javascript.jsx' : 1,
    \} " art for art-template

"> snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

"> fzf
let g:fzf_layout = { 'down': '~30%' }
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

"> moll/vim-node
autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif

"> fixmyjs
let g:fixmyjs_engine = "eslint"
noremap <Leader><Leader>f :Fixmyjs<CR>

"> Linting
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'javascript.jsx': ['eslint'],
\}
let g:ale_fix_on_save = 1
let g:ale_sign_error = '►'
let g:ale_sign_warning = '±'
let g:ale_lint_on_text_changed = 'never'
let g:airline#extensions#ale#enabled = 1 " Enable ale airline integration

"> Airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
  let g:airline_symbols.space = "\ua0"
  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:ale_sign_column_always = 0 " Always show ale column

"> Git Gist
let g:gist_post_private = 0
let g:gist_post_anonymous = 0
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 0 " recommended :)

" Set colors
"---------------------------
syntax on
if !exists('g:syntax_on')
    syntax enable
endif
set t_Co=256
set cursorline
set background=dark
set termguicolors
colorscheme material-monokai
let g:materialmonokai_italic=1
let g:materialmonokai_subtle_spell=1
let g:airline_theme='materialmonokai'
let g:materialmonokai_subtle_airline=1
" let g:materialmonokai_custom_lint_indicators=0

"  Main settings
"---------------------------
set guifont=Menlo\ Regular:h14 " font
set number " line numbers
set hidden " shows files that starts from . 
set history=100 " history of commands
set wrap " enables visual wrapping + NEXT line
set textwidth=0 wrapmargin=0 " remove automatic insertion of newlines
set tabstop=2 " show existing tab with 2 spaces width
set shiftwidth=2 " when indenting with '>', use 2 spaces width
set expandtab " On pressing tab, insert 2 spaces
set hlsearch " highlighting search matches
set list " Show trailing whitespace
set listchars=tab:▸\ ,trail:▫ " Display tabs an invisible characters
set encoding=UTF-8 " Save with utf8 encoding
set shell=/bin/bash " Open bash
