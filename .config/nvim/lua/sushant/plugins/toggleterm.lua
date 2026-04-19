return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local toggleterm = require("toggleterm")

    toggleterm.setup({
      size = 20,
      open_mapping = [[<c-\>]], -- default mapping, we'll override with custom
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved", -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
        width = 120,
        height = 30,
        winblend = 3,
      },
    })

    -- Custom keymaps
    local keymap = vim.keymap

    -- Toggle floating terminal with backslash
    keymap.set("n", "\\", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle floating terminal" })
    keymap.set("t", "\\", "<cmd>ToggleTerm<CR>", { desc = "Toggle floating terminal from terminal mode" })

    -- Optional: Quick escape from terminal mode
    keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
    
    -- Optional: Navigate between terminal and editor
    keymap.set("t", "<C-h>", "<cmd>wincmd h<CR>", { desc = "Navigate left from terminal" })
    keymap.set("t", "<C-j>", "<cmd>wincmd j<CR>", { desc = "Navigate down from terminal" })
    keymap.set("t", "<C-k>", "<cmd>wincmd k<CR>", { desc = "Navigate up from terminal" })
    keymap.set("t", "<C-l>", "<cmd>wincmd l<CR>", { desc = "Navigate right from terminal" })
  end,
}