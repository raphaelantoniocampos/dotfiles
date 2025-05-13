require 'core.options'
require 'core.keymaps'

-- Install Lazy
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Setup plugins
require('lazy').setup({
  install = {
    colorscheme = { require('custom.save-colors').get_colorscheme 'default' },
  },
  require 'plugins.autocompletion',
  require 'plugins.bufferline',
  require 'plugins.colorschemes',
  require 'plugins.comment',
  require 'plugins.conform',
  require 'plugins.csvview',
  -- require 'plugins.dashboard', -- snacks dashboard
  require 'plugins.dap',
  require 'plugins.gitsigns',
  require 'plugins.grug-far',
  -- require 'plugins.indent-blankline', -- snacks indent
  -- require 'plugins.lazygit', -- snacks lazygit
  require 'plugins.lsp',
  require 'plugins.lualine',
  -- require 'plugins.mini-animate', -- snacks animate and scroll
  require 'plugins.misc',
  -- require 'plugins.neo-tree', -- snacks explorer
  -- require 'plugins.noice', -- snacks notifier
  require 'plugins.oil',
  require 'plugins.snacks',
  require 'plugins.telescope', -- telescope on windows
  require 'plugins.treesitter',
  require 'plugins.trouble',
  -- require 'plugins.ufo',
  require 'plugins.which-key',
}, {
  ui = {
    -- If you have a Nerd Font, set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠️',
      event = '📅',
      ft = '📂',
      init = '☀️',
      keys = '🔑',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- Function to check if a file exists
local function file_exists(file)
  local f = io.open(file, 'r')
  if f then
    f:close()
    return true
  else
    return false
  end
end

-- Path to the session file
local session_file = '.session.vim'

-- Check if the session file exists in the current directory
if file_exists(session_file) then
  -- Source the session file
  vim.cmd('source ' .. session_file)
end

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
vim.cmd('colorscheme ' .. vim.g.colors_name)
