syntax on
:set autoindent
:set number relativenumber
:set colorcolumn=80
:set tabstop=4
:set shiftwidth=4
:set softtabstop=4
:set shiftwidth=4
:set textwidth=79
:set expandtab
:set fileformat=unix
set encoding=utf-8
:set shiftround

" for bundles
execute pathogen#infect()
"open nerd tree with ctrl+n
map <C-n> :NERDTreeToggle<CR>
"dont show files:
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*
let NERDTreeRespectWildIgnore=1

"set theme to dracula
color dracula

"seting for ale (error finder )
let g:ale_sign_column_always = 1
"will lint only on save (use NERDTree)
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_fixers = {'*':['remove_trailing_lines', 'trim_whitespace']}
let g:ale_fix_on_save = 1
nmap <F8> <Plug>(ale_fix)

"the split settings
set splitbelow
set splitright
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=syntax
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

"git config
:set updatetime=100


"light line
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ]],
			\   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }


let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="-"
