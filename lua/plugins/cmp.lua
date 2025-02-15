return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-vsnip",
		"hrsh7th/vim-vsnip",
	},
	config = function()
		local cmp = require 'cmp'

		cmp.setup({
			matching = {
				disallow_fuzzy_matching = true,
				disallow_fullfuzzy_matching = true,
				disallow_partial_fuzzy_matching = true,
				disallow_partial_matching = true,
				disallow_prefix_unmatching = true, -- 仅保留前缀匹配的候选项
			},
			snippet = {
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body) -- 使用 vsnip 作为代码片段引擎
				end,
			},
			mapping = {
				['<Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item() -- 如果补全菜单可见，选择下一个补全项
					else
						fallback() -- 否则，执行默认的 Tab 行为
					end
				end, { 'i', 's' }), -- 在插入模式和代码片段模式下生效

				['<S-Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()            -- 如果补全菜单可见，选择上一个补全项
					else
						fallback()                        -- 否则，执行默认的 Shift+Tab 行为
					end
				end, { 'i', 's' }),                       -- 在插入模式和代码片段模式下生效
				['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4)), -- 向上滚动文档
				['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4)), -- 向下滚动文档
				['<C-Space>'] = cmp.mapping(cmp.mapping.complete()), -- 触发补全
				['<C-e>'] = cmp.mapping({
					i = cmp.mapping.abort(),              -- 取消补全
					c = cmp.mapping.close(),              -- 关闭补全窗口
				}),
				['<CR>'] = cmp.mapping.confirm({ select = true }), -- 确认选择
			},
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' }, -- LSP 提供的补全
				{ name = 'vsnip' }, -- vsnip 提供的代码片段
				{ name = 'buffer' }, -- 当前缓冲区中的单词
				{ name = 'path' }, -- 文件路径
			})
		})

		-- 为 `/` 和 `?` 设置 cmdline 补全
		cmp.setup.cmdline({ '/', '?' }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = 'buffer' }
			}
		})

		-- 为 `:` 设置 cmdline 补全
		cmp.setup.cmdline(':', {
			completion = {
				keyword_length = 3,
			},
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = 'path' }
			}, {
				{ name = 'cmdline' }
			})
		})
	end
}
