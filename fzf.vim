let g:fzf_action = {
	\ 'enter': 'vsplit',
	\ 'ctrl-t': 'tabedit',
	\ }

function! s:find_git_root()
    return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectGFiles execute 'GFiles' s:find_git_root()
command! ProjectFiles  execute 'Files'  s:find_git_root()

nnoremap <C-p>  :ProjectGFiles<CR>
nnoremap <Esc>p :ProjectFiles<CR>
