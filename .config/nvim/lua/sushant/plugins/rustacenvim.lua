return {
  {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false, -- This plugin is already lazy
    
    -- the code below is needed for debugging purposed,  enable when needed
    -- config = function()
    --   local mason_registry = require('mason-registry')
    --
    --   if mason_registry.is_installed("codelldb") then
    --     local codelldb = mason_registry.get_package("codelldb")
    --     local extension_path = codelldb:get_installed_path() .. "/extension/"
    --     local codelldb_path = extension_path .. "adapter/codelldb"
    --     local liblldb_path = extension_path.. "lldb/lib/liblldb.dylib"
    --     local cfg = require('rustaceanvim.config')
    --
    --     vim.g.rustaceanvim = {
    --       dap = {
    --         adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
    --       },
    --     }
    --   else
    --     vim.notify("Codelldb not installed via Mason",vim.log.levels.WARN)
    --   end
    -- end
  },
  -- TODO: add debugger dap and dap-ui for rust
  {
    'rust-lang/rust.vim',
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    'saecki/crates.nvim',
    ft = {"toml"},
    config = function()
      require("crates").setup{
        completion = {
          cmp = {
            enabled = true
          },
        },
      }
    require('cmp').setup.buffer({
        sources = {{name="crates"}}
      })
    end
  },
}
