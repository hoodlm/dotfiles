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
        'https://github.com/nvim-tree/nvim-tree.lua.git',
        tag = 'v1.10.0',
    },
    {
        'https://github.com/nvim-treesitter/nvim-treesitter.git',
        tag = 'v0.9.3',
    }
}

-- Plugin-specific setups
-- nvim-tree
require('nvim-tree').setup()
map('n', 'n', [[:NvimTreeToggle]], {})
