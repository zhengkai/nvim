return require('packer').startup(function()

	use 'wbthomason/packer.nvim'

	use 'haishanh/night-owl.vim'
	use 'tomasiser/vim-code-dark'
	use 'itchyny/lightline.vim'

	use 'fatih/vim-go'

	use 'tpope/vim-fugitive'

	use 'liuchengxu/vista.vim'

	use 'vim-scripts/YankRing.vim'

	use 'rking/ag.vim'

	use 'tomtom/tcomment_vim'
	
	use 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'

	use 'dense-analysis/ale'

	use 'mattn/emmet-vim'

	use 'easymotion/vim-easymotion'

	use 'junegunn/fzf'
	use 'junegunn/fzf.vim'

	use {'neoclide/coc.nvim', branch = 'release'}

end)
