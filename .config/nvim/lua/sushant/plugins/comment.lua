return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    -- import comment plugin safely
    local comment = require("Comment")

    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    -- enable comment
    comment.setup({
      -- for commenting tsx, jsx, svelte, html files
      pre_hook = ts_context_commentstring.create_pre_hook(),
    })

    -- Custom keymaps for easier commenting
    local keymap = vim.keymap
    -- Simple single line comment toggle
    keymap.set("n", "<leader>/", "gcc", { desc = "Toggle comment on current line", remap = true })
    keymap.set("v", "<leader>/", "gc", { desc = "Toggle comment on selected lines", remap = true })
  end,
}
