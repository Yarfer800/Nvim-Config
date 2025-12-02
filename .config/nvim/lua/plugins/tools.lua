return {
  -- Автопairs
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },

  -- Telescope
  { 
    'nvim-telescope/telescope.nvim', 
    branch = '0.1.x', 
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("config.telescope")
    end
  },

  -- Сессии
  {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup({
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Downloads" },
      })
    end
  },

  -- Комментарии
  {
    'terrortylor/nvim-comment',
    event = "BufReadPost",
    config = function()
      require("nvim_comment").setup({ create_mappings = false })
    end
  },

  -- Markdown Preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  -- Emmet
  {
    "olrtg/nvim-emmet",
    config = function()
      vim.keymap.set({"i", "v"}, "<C-e>", require("nvim-emmet").wrap_with_abbreviation)
    end
  },

  -- Autotag
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require('nvim-ts-autotag').setup({
        filetypes = { 
          "html", "xml", "javascript", "typescript", 
          "javascriptreact", "typescriptreact" 
        },
      })
    end
  },
-- В plugins/toggleterm.lua или прямо в init.lua
{
  "akinsho/toggleterm.nvim",
  version = "*",
  event = "VeryLazy", -- или конкретные события
  config = function()
    require("toggleterm").setup({
      -- Настройки
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })

    -- Кастомные команды
    vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
    vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle float terminal" })
    vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Toggle horizontal terminal" })
    vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "Toggle vertical terminal" })
    
    -- Выход из режима терминала
    vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
  end,
  },

    -- lazy.nvim
{
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      ft = { "markdown" },
      build = function() vim.fn["mkdp#util#install"]() end,
    }
}
