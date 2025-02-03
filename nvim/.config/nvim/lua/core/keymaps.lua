-- Keymaps for better default experience

-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- For conciseness
local function opts(desc)
  local options = { noremap = true, silent = true }
  if desc then
    options.desc = desc
  end
  return options
end

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Allow moving the cursor through wrapped lines with j, k
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- clear highlights
vim.keymap.set('n', '<Esc>', ':noh<CR>', opts())

-- save file without auto-formatting
vim.keymap.set('n', '<C-s>', '<cmd>noautocmd w <CR>', opts())

-- format file
vim.keymap.set('n', '<leader>cF', function()
  vim.lsp.buf.format()
end, opts 'Format')

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts())

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts())
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts())

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Resize with arrows
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts())
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts())
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts())
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts())

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts())                                -- next buffer
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts())                          -- previous buffer
-- vim.keymap.set('n', '<leader><Tab>n', ':bnext<CR>', opts 'Next buffer')           -- next buffer
-- vim.keymap.set('n', '<leader><Tab><S-Tab>', ':bprevious<CR>', opts 'Previous buffer') -- previous buffer
vim.keymap.set('n', '<leader><Tab>x', ':Bdelete!<CR>', opts 'Close buffer')           -- close buffer
vim.keymap.set('n', '<leader><Tab>n', '<cmd> enew <CR>', opts 'New buffer')       -- new buffer

-- Increment/decrement numbers
-- vim.keymap.set('n', '<leader>+', '<C-a>', opts 'Increment number') -- increment
-- vim.keymap.set('n', '<leader>-', '<C-x>', opts 'Decrement number') -- decrement

-- Window management
vim.keymap.set('n', '<leader>wv', '<C-w>v', opts 'Split window vertically')        -- split window vertically
vim.keymap.set('n', '<leader>wh', '<C-w>s', opts 'Split window horizontally')      -- split window horizontally
vim.keymap.set('n', '<leader>wx', ':close<CR>', opts 'Close current split window') -- close current split window

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts())
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts())
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts())
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts())

-- Tabs
vim.keymap.set('n', '<leader>T<Tab>', ':tabnew<CR>', opts 'New tab') -- open new tab
vim.keymap.set('n', '<leader>Tx', ':tabclose<CR>', opts 'Close tab') -- close current tab
vim.keymap.set('n', '<leader>Tn', ':tabn<CR>', opts 'Next tab')      --  go to next tab
vim.keymap.set('n', '<leader>Tp', ':tabp<CR>', opts 'Previous tab')  --  go to previous tab

-- Toggle line wrapping
-- vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts())

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts())
vim.keymap.set('v', '>', '>gv', opts())

-- Move text up and down
vim.keymap.set('v', '<A-j>', ':m .+1<CR>==', opts())
vim.keymap.set('v', '<A-k>', ':m .-2<CR>==', opts())

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts())

-- Explicitly yank to system clipboard (highlighted and entire row)
-- vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
-- vim.keymap.set('n', '<leader>Y', [["+Y]])

-- Toggle diagnostics
local diagnostics_active = true

vim.keymap.set('n', '<leader>xD', function()
  diagnostics_active = not diagnostics_active

  if diagnostics_active then
    vim.diagnostic.enable(true)
  else
    vim.diagnostic.enable(false)
  end
end, opts 'Toggle diagnostics')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>cq', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.keymap.set('n', '<leader>Ss', ':mksession! .session.vim<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>Sl', ':source .session.vim<CR>', { noremap = true, silent = false })

vim.keymap.set('n', '<leader>l', ':Lazy<CR>', opts() )
vim.keymap.set('n', '<leader>m', ':Mason<CR>', opts())

-- Colorschemes
vim.keymap.set('n', '<leader>us', ':Themery<CR>', opts 'Select Colorscheme')

vim.keymap.set('n', '<leader>uc', ':colorscheme<CR>', opts 'Current Colorscheme')
