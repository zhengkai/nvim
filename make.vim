nmap <C-N> :call Make()<CR>
nmap <Esc>n :te cat $HOME"/.config/nvim/script/make-output.txt"<CR>

function! Make()
	let makesh=$HOME."/.config/nvim/script/make.sh"
	let target=expand('%:p:h')
	echo "start making: " . target
    call jobstart([makesh, target], {
		\ "on_stdout": "MakeEnd",
		\ "on_stderr": "MakeEnd",
		\ "stderr_buffered": v:true,
		\ "stdout_buffered": v:true})
endfunction

function! MakeEnd(job_id, data, event)
	if a:data == [""]
		return
	endif
	if a:event == "stdout"
		echo "make success: " . join(a:data)
	else
		" 报错时，按 C+\ C+N 进入浏览模式，按 i 按任意键退出
		call termopen(["cat", a:data[0]])
	endif
endfunction
