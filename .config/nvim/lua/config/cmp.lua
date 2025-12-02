local cmp = require('cmp')
local luasnip = require('luasnip')

-- Настройка автодополнения
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- Выбрать следующий элемент
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    
    -- Прокрутка документации
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    
    -- Подтверждение выбора
    ['<CR>'] = cmp.mapping.confirm({ 
      select = true,
      behavior = cmp.ConfirmBehavior.Replace
    }),
    
    -- Открыть/закрыть автодополнение
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    
    -- Luasnip прыжки
    ['<C-l>'] = cmp.mapping(function()
      if luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      end
    end, { 'i', 's' }),
    ['<C-h>'] = cmp.mapping(function()
      if luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { 'i', 's' }),
  }),
  
  -- Источники автодополнения (в порядке приоритета)
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  }),
  
  -- Внешний вид
  formatting = {
    format = function(entry, vim_item)
      -- Иконки для разных источников
      local icons = {
        nvim_lsp = '',
        luasnip = '',
        buffer = '',
        path = '',
        cmdline = '',
      }
      
      vim_item.kind = string.format('%s %s', icons[entry.source.name] or '', vim_item.kind)
      
      -- Название источника
      vim_item.menu = ({
        nvim_lsp = '[LSP]',
        luasnip = '[Snippet]',
        buffer = '[Buffer]',
        path = '[Path]',
      })[entry.source.name]
      
      return vim_item
    end
  },
  
  -- Экспериментальные фичи
  experimental = {
    ghost_text = true,  -- Показывать текст-призрак
  },
})

-- Автодополнение для командной строки
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Автодополнение для поиска
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

print("✅ nvim-cmp configured!")
