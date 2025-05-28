require 'core.options'
require 'core.keymaps'

-- Setup Lazy Plugin Manager
-- 	Here UV or Loop are asynchronous IO libraries
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

local rtp = vim.opt.rtp
rtp:prepend(lazypath)
-- Lazy.nvim Plugin Setup
-- This configuration uses the lazy.nvim plugin manager to load and manage various plugins efficiently.

require('lazy').setup {
  -- Plugin: Bufferline
  -- Provides a customizable buffer line for managing open buffers in Neovim.
  require 'plugins.bufferline',

  -- Plugin: NeoTree
  -- Implements a file explorer tree for navigating the filesystem.
  require 'plugins.neotree',

  -- Plugin: OneDark Theme
  -- Applies the OneDark theme to Neovim for a visually appealing color scheme.
  require 'plugins.themes.onedark',

  -- Plugin: Lualine
  -- Configures a status line to display useful information like mode, file name, and diagnostics.
  require 'plugins.lualine',

  -- Plugin: Treesitter
  -- Integrates Tree-sitter for syntax highlighting and code parsing, improving code navigation and editing.
  require 'plugins.treesitter',

  -- Plugin: Telescope
  -- Provides fuzzy finder functionality for searching files, buffers, and more.
  require 'plugins.telescope',

  -- Plugin: LSP
  -- Configures Language Server Protocol (LSP) support for autocompletion, diagnostics, and code navigation.
  require 'plugins.lsp',

  -- Plugin: Autocompletion
  -- Sets up autocompletion for coding, working with LSP and other completion sources.
  require 'plugins.autocompletion',

  -- Plugin: Null-ls
  -- Configures null-ls for integrating external tools like linters and formatters.
  require 'plugins.none-ls',

  -- Plugin: Indent Blankline
  -- Adds indentation guides to improve code readability by visually aligning blocks.
  require 'plugins.indent-blankline',

  -- Plugin: Presenting
  -- Adds tools for creating presentations directly in Neovim.
  require 'plugins.presenting',

  -- Plugin: Slides
  -- Provides slide creation and navigation functionality for presentations.
  require 'plugins.slides',

  -- Plugin: SuperMaven
  -- Likely a custom plugin for Maven integration, facilitating Java project management and builds.
  require 'plugins.supermaven',

  -- Plugin: Copilot
  -- Integrates GitHub Copilot for AI-assisted coding with intelligent code suggestions and completions.
  require 'plugins.copilot',

  -- Plugin: Companion
  -- Likely a custom plugin for additional utilities or enhancements specific to the user's workflow.
  require 'plugins.companion',

  -- Plugin: Rust Tools
  -- Provides Rust-specific tools  and utilities for Neovim.
  require 'plugins.rust-tools',

  -- Plugin: NVIM DAP
  -- Provides a debugging interface for Neovim, allowing users to debug code using various debuggers.
  require 'plugins.nvim-dap',

  -- Plugin: NVIM DAP UI
  -- Provides a user interface for NVIM DAP
  require 'plugins.nvim-dap-ui',
}
