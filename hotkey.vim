" nnoremap <C-T> "=strftime("%F %T")<CR>P
" inoremap <C-T> <C-R>=strftime("%F %T")<CR>
"
nnoremap <C-T> :tabp<CR>

map <S-R> :browse oldfiles<cr>

" easymotion
map ;; <Plug>(easymotion-s)

" tComment
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

" nnoremap <C-X> iZheng Kai <zhengkai@gmail.com><Esc>l
" inoremap <C-X> Zheng Kai <zhengkai@gmail.com>

" https://stackoverflow.com/a/27206531/966103
" alt + left
map <Esc>[1;3D :echo yes

nmap <Esc>e oif err != nil {<CR><Tab>return<CR>}<CR><Esc>

nnoremap <silent> <F3> :Vista coc<CR>
nnoremap <silent> <Esc>3 :Vista coc<CR>

" 防止误操作
command W w
command WQ wq
command Q q
nmap <F1> <nop>

nmap <F4> <ESC>:%s/<C-v><C-m>//g<Enter>

" 通过文件传 yank
" Alt+y Alt+i
nmap <Esc>y :call writefile(split(@@, "\n", 1), $HOME . '/.tmp/vimclip')<CR>
nmap <Esc>i :r $HOME/.tmp/vimclip<CR>

" 执行当前文件
nmap <S-U> :!clear && %:p<CR>

" 切换窗口
nmap q :wincmd w<CR>
" alt + q，反序切窗口
map <Esc>q :wincmd W<CR>

" 退出所有窗口
nn Q :qa<CR>

" 关闭缺省 man
" nmap <S-K> <Nop>

" 找括号
nmap { ?{<CR>
nmap } /{<CR>

" 帮助 ( Ctrl + 2 )
nn <C-E> <ESC>:vert bo help<Space>

" Github Copilot
imap <silent><script><expr> <Esc>c copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

map <C-U> :GoDocBrowser<CR>

" 使之前的单词字母大写
map <C-W> <Esc>gUiw`]a
imap <C-W> <Esc>bgUiw`]a

" git blame
nn <S-B> :Git blame<CR>

" emmet 自动完成
nnoremap , :call emmet#expandAbbr(3,"")<cr>
"inoremap , <c-r>=emmet#util#closePopup()<cr><c-r>=emmet#expandAbbr(0,"")<cr>
"vnoremap , :call emmet#expandAbbr(3,"")<cr>
