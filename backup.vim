set backup
set backupdir=~/.config/nvim/backup

function! BackupDir()
	let l:backupdir=$HOME.'/.tmp/vim-backup/'. strftime('%Y%m%d')
	if !isdirectory(l:backupdir)
		call mkdir(l:backupdir, 'p', 0700)
	endif

	echo l:backupdir

	let &backupdir=l:backupdir
	let &backupext=strftime("-%H%M%S")
endfunction

au! BufWritePre * call BackupDir()
