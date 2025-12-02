-- ~/.config/nvim/lua/core/autocommands.lua

-- Базовые autocommands
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

-- Автоформатирование при сохранении (опционально)
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    -- Можно добавить форматирование для определенных файлов
  end,
})

-- Автоматическое закрытие некоторых окон
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    -- Закрыть Neovim если осталось только NvimTree
    if #vim.api.nvim_list_wins() == 1 and vim.bo.filetype == "nvim-tree" then
      vim.cmd("quit")
    end
  end,
})

