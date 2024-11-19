" nginx
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif
au BufRead,BufNewFile nginx.conf,nginx.tpl,vhost.conf setfiletype nginx
au BufRead,BufNewFile */nginx/*.conf setfiletype nginx

au FileType scss setl iskeyword+=@-@

" .zhengkai 文件高亮
au BufRead,BufNewFile .zhengkai,.bash_alias setfiletype sh

" .sql 文件默认为 MySQL 而不是 sql
au BufRead,BufNewFile *.sql setfiletype mysql

" CSS in SuperTab
"au FileType css,less let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

au BufRead,BufNewFile env setfiletype sh

" csv
au BufRead,BufNewFile *.csv setfiletype csv

" csv
au BufRead,BufNewFile *.less setfiletype less

" hosts
au BufRead,BufNewFile hosts setfiletype hosts

au BufRead,BufNewFile *.cue setfiletype cue

au BufRead,BufNewFile .babelrc,.eslintrc setfiletype javascript

" skeleton
au BufNewFile *.sh     0r ~/.config/nvim/skeleton/bash | call cursor(3, 0)
au BufNewFile *.php    0r ~/.config/nvim/skeleton/php  | call cursor(3, 0)
au BufNewFile *.html   0r ~/.config/nvim/skeleton/html | call cursor(8, 0)
au BufNewFile Makefile 0r ~/.config/nvim/skeleton/makefile | call cursor(4, 1)
au BufNewFile *.proto  0r ~/.config/nvim/skeleton/proto | call cursor(5, 9)
