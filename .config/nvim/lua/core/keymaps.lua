local map = vim.keymap.set
vim.g.mapleader = " "

-- Основные keymaps
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<C-s", "<cmd>:w<CR>")
map("i", "<C-s", "<cmd>:w<CR>")
map("n", "<leader>py", ":!python3 %<CR>")
-- ... остальные keymaps
-- plugins/ai.lua
-- Настройка AI агента.
vim.keymap.set("n", "<leader>aa", "<cmd>ChatGPT<CR>", { desc = "ChatGPT" })
vim.keymap.set("n", "<leader>ac", "<cmd>ChatGPTActAs<CR>", { desc = "ChatGPT Act As" })
vim.keymap.set("n", "<leader>ae", "<cmd>ChatGPTEditWithInstructions<CR>", { desc = "ChatGPT Edit" })
vim.keymap.set("v", "<leader>ae", "<cmd>ChatGPTEditWithInstructions<CR>", { desc = "ChatGPT Edit" })
vim.keymap.set("n", "<leader>ar", "<cmd>ChatGPTRun<CR>", { desc = "ChatGPT Run" })



vim.keymap.set("n", "<leader>fs", ":Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fp", ":Telescope git_files<cr>")
vim.keymap.set("n", "<leader>fz", ":Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<cr>")

-- tree
vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<cr>")

-- format code using LSP
vim.keymap.set("n", "<leader>fmd", vim.lsp.buf.format)

-- markdown preview
vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<cr>")

-- nvim-comment
vim.keymap.set({"n", "v"}, "<leader>/", ":CommentToggle<cr>")


-- buffers
vim.keymap.set("n", "<leader>n", ":bn<cr>")
vim.keymap.set("n", "<leader>p", ":bp<cr>")
vim.keymap.set("n", "<leader>x", ":bd<cr>")

-- ruff
vim.keymap.set("n", "<leader>tc", ":!ruff check --fix<CR>")
vim.keymap.set("n", "<leader>tf", ":!ruff format<CR>")


-- lua/config/pyright-keymaps.lua
local M = {}

function M.setup()
  -- Глобальные keymaps для диагностики
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { desc = "Open diagnostic float" })
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { desc = "Set diagnostic loclist" })

  -- Автокоманды для Python файлов
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
      local opts = { buffer = true }

      -- Pyright специфичные команды
      vim.keymap.set('n', '<leader>pt', ':PyrightType<CR>', opts)
      vim.keymap.set('n', '<leader>po', ':PyrightOrganizeImports<CR>', opts)
      vim.keymap.set('n', '<leader>pa', ':PyrightAnalyze<CR>', opts)

      -- Типы и аннотации
      vim.keymap.set('n', '<leader>ti', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', '<leader>td', vim.lsp.buf.type_definition, opts)

      -- Рефакторинг
      vim.keymap.set('n', '<leader>rr', vim.lsp.buf.rename, opts)
      vim.keymap.set('n', '<leader>ra', vim.lsp.buf.code_action, opts)

      -- Навигация
      vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)

      -- Диагностика
      vim.keymap.set('n', '<leader>dd', vim.diagnostic.open_float, opts)
      vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, opts)
      vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, opts)
    end
  })
end

return M


