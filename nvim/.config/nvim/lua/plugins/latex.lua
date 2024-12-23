return {
	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		init = function()
			vim.g.tex_flavor = "latex"
			vim.g.vimtex_view_method = "zathura"
			-- vim.g.vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
			-- vim.g.vimtex_view_general_options_latexmk = '--unique'
			-- vim.g.vimtex_view_method = skim
			-- vim.g.vimtex_view_automatic = 1 -- prevent `latexmk` (or other build tools) from starting Skim
			vim.g.vimtex_complete_bib_simple = 1
		end,
	},
}
