return {
	"hrsh7th/nvim-cmp",
	-- event = "InsertEnter", I wnat to start them at the nvim is started
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
		"hrsh7th/cmp-cmdline",
	},

	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
		require("luasnip.loaders.from_vscode").lazy_load()
		cmp.setup({
			completion = {
				completeopt = "menu,menuone, noinsert",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					else
						cmp.complete()
					end
				end, { "i", "s" }),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.scroll_docs(-4),
				["<C-k>"] = cmp.mapping.scroll_docs(4),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-y>"] = cmp.mapping.confirm(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
		})

		cmp.setup.cmdline("/", {
			completion = {
				completeopt = "menu,menuone, noinsert",
			},
			mapping = cmp.mapping.preset.cmdline({
				["<C-n>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					else
						cmp.complete()
					end
				end, { "i", "s" }),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.scroll_docs(-4),
				["<C-k>"] = cmp.mapping.scroll_docs(4),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-y>"] = {
					c = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Insert,
						select = true,
					}),
				},
			}),
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline(":", {
			completion = {
				completeopt = "menu,menuone, noinsert",
			},
			mapping = cmp.mapping.preset.cmdline({
				["<C-n>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					else
						cmp.complete()
					end
				end, { "i", "s" }),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.scroll_docs(-4),
				["<C-k>"] = cmp.mapping.scroll_docs(4),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-y>"] = {
					c = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Insert,
						select = true,
					}),
				},
			}),
			sources = {
				{ name = "path" },
				{ name = "cmdline" },
			},
		})
	end,
}
