local lsp_zero = require('lsp-zero')
lsp_zero.extend_lspconfig()

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end

require('mason-lspconfig').setup({
  ensure_installed = {
    'pyright',
    'ts_ls', 
    'rust_analyzer',
    'html',
    "cssls",
    "jsonls",
    "emmet_ls"
  },
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})

-- Конфиги конкретных LSP серверов
local util = require("lspconfig/util")
local path = util.path

local lspconfig = require("lspconfig")

lspconfig.pyright.setup {
  filetypes = { "python" },
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "strict",
      },
    },
  },
}

require('lspconfig').html.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html" } 
})
--
-- require('lspconfig').rust_analyzer.setup({
--   cmd = { "/root/.cargo/bin/rust-analyzer" },
--   on_attach = on_attach,
--   capabilities = capabilities,
--   settings = {
--     ["rust-analyzer"] = {
--       cargo = { allFeatures = true },
--       check = { command = "clippy" },
--       inlayHints = { enable = true },
--       checkOnSave = true
--     }
--   }
-- })

local lspconfig = require('lspconfig')

lspconfig.tsserver.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    -- Отключаем tsserver форматирование, используем prettier
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    
    -- Клавиши для LSP
    local opts = { buffer = bufnr, noremap = true, silent = true }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  end
})

-- HTML
lspconfig.html.setup({
  capabilities = capabilities,
})

-- CSS
lspconfig.cssls.setup({
  capabilities = capabilities,
})

-- JSON
lspconfig.jsonls.setup({
  capabilities = capabilities,
})

-- Emmet
lspconfig.emmet_ls.setup({
  capabilities = capabilities,
  filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss' },
})
