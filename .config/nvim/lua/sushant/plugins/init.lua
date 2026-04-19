return {
	{
		"nvim-lua/plenary.nvim", -- Lua functions that many plugins use
	},
	{
		"christoomey/vim-tmux-navigator", -- tmux & split window navigation
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		main = "ibl",
		opts = {
			indent = { char = "┊" },
		},
	},
	{

		"kylechui/nvim-surround",
		event = { "BufReadPre", "BufNewFile" },
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = true,
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
}
