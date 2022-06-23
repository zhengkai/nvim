lua require('plugins')

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

so hotkey.vim
so style.vim
so status.vim

set showtabline=2
