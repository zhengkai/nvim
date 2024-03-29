" 删除空行
function RemoveTrailingWhitespace()
	if &ft != "diff"
		let b:curcol = col(".")
		let b:curline = line(".")
		%s/\s\+$//e
		" $put _
		%s/\(\s*\n\)\+\%$/\r/ " 删除结尾空格
		%s/\n\{3,}/\r\r/e " 删除多余空行
		%s/\n\+\%$//ge " 删除文件尾部多余换行
		call cursor(b:curline, b:curcol)
	endif
endfunction

" UNIX 换行
au FileType php,sh,fstab,zsh,json,typescript,javascript,css,less,sass,scss,text,html,dosini,vim,gitconfig,conf,nginx au BufWritePre * :silent! undojoin | silent! call RemoveTrailingWhitespace()
au FileType php,sh,fstab,zsh,json,typescript,javascript,css,less,sass,scss,text,html,dosini,vim,gitconfig,conf,nginx,mkd silent! set fileformat=unix
au FileType go au BufWritePre * :silent! undojoin | silent! call RemoveTrailingWhitespace() | silent! Fmt

au BufWritePre ~/conf/filelist,~/conf/apt/list-aptget,~/conf/apt/list-desktop :sort u
