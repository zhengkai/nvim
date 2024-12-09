set showtabline=2

set mouse=

let g:go_tmp_path = '/tmp/zhengkai'

set clipboard=unnamedplus

autocmd TermOpen * startinsert

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

let g:go_gopls_options = ['-remote=auto']
let g:ale_go_gopls_options = '-remote=auto'

" ale
" let g:ale_disable_lsp = 1
let g:ale_completion_enabled = 0
let g:ale_fix_on_save = 1
"let g:ale_set_highlights = 0
let g:ale_sign_column_always = 0
let g:ale_hover_cursor = 0
let g:ale_virtualtext_cursor = 0
let g:ale_virtualtext = 0
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '!'
let g:ale_sign_column_always = 1

let g:ale_fixers = {
			\   'javascript': ['eslint'],
			\   'typescript': ['eslint'],
			\   'css': ['prettier'],
			\ }

" liuchengxu/vista.vim
"function! NearestMethodOrFunction() abort
"  return get(b:, 'vista_nearest_method_or_function', '')
"endfunction
"
"set statusline+=%{NearestMethodOrFunction()}
"autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

" help 默认竖屏打开
augroup vertical_help
  autocmd!
  autocmd FileType help
        \ setlocal bufhidden=unload |
        \ wincmd L |
        \ vertical resize 79
augroup END
