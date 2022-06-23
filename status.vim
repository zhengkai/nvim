hi StatusLine   ctermfg=16 cterm=none
hi StatusLineNC ctermfg=16 ctermbg=24 cterm=none

au InsertEnter * call status#insert()
au InsertLeave * call status#normal()

"vnoremap <silent> <expr> <SID>status#visual status#visual()
"nnoremap <silent> <script> v v<SID>status#visual
"nnoremap <silent> <script> V V<SID>status#visual
"nnoremap <silent> <script> <C-v> <C-v><SID>status#visual
"
"function! status#visual()
"	hi StatusLine ctermbg=129
"endfunction

function! status#normal()
	hi StatusLine ctermbg=39
endfunction
call status#normal()

function! status#insert()
	hi StatusLine ctermbg=214
endfunction

let g:lightline = {}
let g:lightline.colorscheme = 'zhengkai'

let g:lightline.component_function = {
\   'filesize': 'FileSize',
\   'gitbranch': 'FugitiveHead',
\ }

let g:lightline.inactive = {
\   'left': [ [ 'readonly' ], [ 'modified' ], [ 'filename' ], [ 'gitbranch' ] ],
\   'right': [],
\ }

let g:jellybeans_overrides = {
\   'Comment': { 'guifg': '999999' },
\   'background': { 'guibg': '000000' },
\ }

let g:lightline.tabline = {
\   'left': [['absolutepath']],
\   'right': [],
\ }

" let g:lightline.separator    = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '│', 'right': '│' }

let g:lightline.component = {
\   'fileformat': ' %{&ff}',
\   'fileencoding': '%{&fenc!=#""?&fenc:&enc} ',
\ }

let g:lightline.active = {
\ 'left': [
\   [ 'mode', 'paste' ],
\   [ 'readonly' ],
\   [ 'modified' ],
\   [ 'filetype' ],
\   [ 'filesize' ],
\   [ 'gitbranch' ],
\ ],
\ 'right': [
\   [ 'lineinfo' ],
\   [ 'percent' ],
\   [ 'fileformat', 'fileencoding' ],
\ ],
\ }

function! FileSize()
	let bytes = getfsize(expand("%:p"))
	let bytes = substitute(bytes, '\d\zs\ze\%(\d\d\d\)\+$', ',', 'g')
	return bytes
endfunction
