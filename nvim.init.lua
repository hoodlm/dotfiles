-- Load legacy vimrc
vim.cmd('source ~/.vimrc')

-- Some neovim specifics
-- Based on details in this tutorial by Jaya Moore:
-- https://mattermost.com/blog/how-to-install-and-set-up-neovim-for-code-editing/
-- https://mattermost.com/blog/turning-neovim-into-a-full-fledged-code-editor-with-lua/
--
-- I diverge in a few places, like using pckr instead of Packer.
vim.opt.termguicolors = true

vim.g.mapleader = ","
local map = vim.api.nvim_set_keymap

-- Pckr setup. Verbatim from:
-- https://github.com/lewis6991/pckr.nvim/blob/90dd56d9234eeba0b9bb0f05f51d464015de5a70/README.md
local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

  if not (vim.uv or vim.loop).fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end
  vim.opt.rtp:prepend(pckr_path)
end
bootstrap_pckr()

-- # PLUGINS
require('pckr').add{
    {
        'https://github.com/nvim-tree/nvim-tree.lua',
        tag = 'v1.10.0',
    },
    {
        'https://github.com/nvim-treesitter/nvim-treesitter',
        tag = 'v0.9.3',
    },
    -- Mason, lsp, and nvim-cmp are an IDE-like setup. Largely based on:
    -- https://rsdlt.github.io/posts/rust-nvim-ide-guide-walkthrough-development-debug/
    {
        'https://github.com/williamboman/mason.nvim',
        tag = 'v1.10.0',
    },
    {
        'https://github.com/williamboman/mason-lspconfig.nvim',
        tag = 'v1.31.0',
    },
    {
        'https://github.com/neovim/nvim-lspconfig',
        tag = 'v1.4.0',
    },
    -- Autocomplete
    {
        'https://github.com/hrsh7th/nvim-cmp',
        tag = "v0.0.2",
    },
    {
        'https://github.com/hrsh7th/cmp-nvim-lsp',
        commit = "99290b3ec1322070bcfb9e846450a46f6efa50f0",
    },
    {
        'https://github.com/hrsh7th/cmp-path',
        commit = "91ff86cd9c29299a64f968ebb45846c485725f23",
    },
    {
        'https://github.com/hrsh7th/cmp-buffer',
        commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa",
    },
    {
        'https://github.com/hrsh7th/cmp-nvim-lsp-signature-help',
        commit = "031e6ba70b0ad5eee49fd2120ff7a2e325b17fa7",
    },
}

-- Plugin-specific setups
-- nvim-tree
require('nvim-tree').setup()
map('n', '<Leader>n', [[:NvimTreeToggle<CR>]], {})

-- mason
require('mason').setup()
require('mason-lspconfig').setup()

-- lsp servers
local lspconfig = require('lspconfig')
lspconfig.rust_analyzer.setup {
    settings = {
        ['rust-analyzer'] = {},
    },
}

-- autocomplete setup
vim.opt.completeopt = {'menuone', 'noinsert'}
local cmp = require('cmp')
cmp.setup({
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp', keyword_length = 3 },
        { name = 'buffer', keyword_length = 3 },
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        })
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
})
