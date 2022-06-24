nmap <C-N> :call Make()<CR>
nmap <Esc>n :!less $HOME"/.config/nvim/script/make-output.txt"<CR>

function! Make()

	let makesh=$HOME."/.config/nvim/script/make.sh"
	let target=expand('%:p:h')
    let job = jobstart([makesh, target], {"err_cb": "MakeFail", "out_cb": "MakeEnd"})
	echo "start making: " . target

endfunction

function! MakeFail(channel, msg)
	echo "error " . v:shell_error . " channel:" . a:channel . " msg:" . a:msg
	exec "!less -r +G " . shellescape(a:msg)
endfunction

function! MakeEnd(channel, msg)
	echo "make success: " . a:msg
endfunction
