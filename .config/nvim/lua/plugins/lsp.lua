return {
  -- LSP Zero
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    init = function()
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },

  -- Mason
  {
    'williamboman/mason.nvim',
    lazy = true,
    config = true,
  },

  -- CMP
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {'L3MON4D3/LuaSnip'},
      {'hrsh7th/cmp-nvim-lsp'},
    },
    config = function()
      require("config.cmp")
    end
  },

  -- LSP Config
  {
    'neovim/nvim-lspconfig',
    cmd = {'LspInfo', 'LspInstall', 'LspStart'},
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      {'williamboman/mason-lspconfig.nvim'},
    },
    config = function()
      require("config.lsp")
    end
  },
	--   {
	--    'mrcjkb/rustaceanvim',
	--    version = '^5', -- Recommended
	--    lazy = false, -- This plugin is already lazy
	--    ft = "rust",
	--    config = function ()
	--      local mason_registry = require('mason-registry')
	--      local codelldb = mason_registry.get_package("codelldb")
	--      local extension_path = codelldb:get_install_path() .. "/extension/"
	--      local codelldb_path = extension_path .. "adapter/codelldb"
	-- -- If you are on Linux, replace the line above with the line below:
	-- -- local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
	--      local cfg = require('rustaceanvim.config')
	--
	--      vim.g.rustaceanvim = {
	--        dap = {
	--          adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
	--        },
	--      }
	--    end
	--  },   
-- Настройка Mason
}
