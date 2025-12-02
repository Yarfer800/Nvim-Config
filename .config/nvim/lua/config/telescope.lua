local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

-- Настройка Telescope
telescope.setup({
  defaults = {
    mappings = {
      i = {
        -- Закрыть на ESC
        ["<esc>"] = actions.close,
        -- Перемещение в результатах
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        -- Открыть в новом окне
        ["<C-v>"] = actions.select_vertical,
        ["<C-s>"] = actions.select_horizontal,
        -- Предпросмотр
        ["<C-p>"] = actions.preview_scrolling_up,
        ["<C-n>"] = actions.preview_scrolling_down,
      },
      n = {
        -- Закрыть на q
        ["q"] = actions.close,
      },
    },
    -- Внешний вид
    layout_config = {
      width = 0.9,
      height = 0.9,
    },
    -- Игнорируемые файлы
    file_ignore_patterns = {
      "node_modules",
      ".git",
      ".cache",
      "%.o",
      "%.a",
      "%.out",
      "%.class",
      "%.pdf",
      "%.mkv",
      "%.mp4",
      "%.zip",
    },
    -- Подсветка результатов
    color_devicons = true,
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      hidden = true,  -- Показывать скрытые файлы
    },
    live_grep = {
      theme = "dropdown",
    },
    buffers = {
      theme = "dropdown",
      sort_lastused = true,
    },
  },
  extensions = {
    -- Можно добавить расширения позже
  },
})

-- Загрузка расширений (если есть)
-- telescope.load_extension('fzf')

-- Горячие клавиши
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = '[F]ind [C]ommands' })
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = '[F]ind [R]ecent files' })
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = '[F]ind [S]ymbols' })

-- Поиск по слову под курсором
vim.keymap.set('n', '<leader>fw', function()
  builtin.grep_string({ search = vim.fn.expand("<cword>") })
end, { desc = '[F]ind [W]ord under cursor' })

-- Git команды (если есть fugitive)
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = '[G]it [F]iles' })
vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = '[G]it [C]ommits' })
vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = '[G]it [B]ranches' })

-- LSP команды
vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = '[G]oto [R]eferences' })
vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = '[G]oto [D]efinition' })
vim.keymap.set('n', 'gi', builtin.lsp_implementations, { desc = '[G]oto [I]mplementation' })

print("✅ Telescope configured!")
