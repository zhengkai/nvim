set showtabline=2

set clipboard=unnamedplus

set nobomb
set nowrap

set autowrite
set nofoldenable

let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0

let g:copilot_filetypes = {
\ '*': v:true,
\ }

" 记住上一次的位置
au BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\ exe "normal g`\"" |
	\ endif

" YankRing
let g:yankring_replace_n_pkey = '<C-j>'
let g:yankring_replace_n_nkey = '<C-k>'
let g:yankring_history_dir = '~/.tmp'

" ag.vim
let g:ag_prg="/usr/bin/ag --vimgrep"
let g:ag_working_path_mode="r"
nmap <C-G> <ESC>:Ag<Space>

" 缩进
set si
set sw=4
set noet

" 无限恢复
set undofile
set undodir=~/.tmp/vim-undo
set undolevels=1000
set undoreload=10000
