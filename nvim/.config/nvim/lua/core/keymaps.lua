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
vim.keymap.set('n', '<leader>cf', '<cmd>noautocmd w <CR>', opts 'Save without formatting')

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

-- Increment/decrement numbers
-- vim.keymap.set('n', '<leader>+', '<C-a>', opts 'Increment number') -- increment
-- vim.keymap.set('n', '<leader>-', '<C-x>', opts 'Decrement number') -- decrement

-- Window management
vim.keymap.set('n', '<leader>wv', '<C-w>v', opts 'Split window vertically') -- split window vertically
vim.keymap.set('n', '<leader>wh', '<C-w>s', opts 'Split window horizontally') -- split window horizontally
vim.keymap.set('n', '<leader>wx', ':close<CR>', opts 'Close current split window') -- close current split window

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts())
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts())
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts())
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts())

-- Buffers
vim.keymap.set('n', '<leader>bN', '<cmd> enew <CR>', opts 'New buffer') -- new buffer
vim.keymap.set('n', '<leader>bx', ':Bdelete!<CR>', opts 'Close buffer') -- close buffer
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', opts 'Next buffer') -- next buffer
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', opts 'Previous buffer') -- previous buffer

-- Alternative buffers keymaps
-- vim.keymap.set('n', '<leader>q', ':Bdelete!<CR>', opts 'Close buffer') -- using snacks
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts()) -- next buffer
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts()) -- previous buffer

-- Tabs
vim.keymap.set('n', '<leader>tN', ':tabnew<CR>', opts 'New tab') -- open new tab
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts 'Close tab') -- close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts 'Next tab') --  go to next tab
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts 'Previous tab') --  go to previous tab

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
-- local diagnostics_active = true

-- vim.keymap.set('n', '<leader>eT', function()
--   diagnostics_active = not diagnostics_active
--
--   if diagnostics_active then
--     vim.diagnostic.enable(true)
--   else
--     vim.diagnostic.enable(false)
--   end
-- end, opts 'Toggle diagnostics')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>em', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- vim.keymap.set('n', '<leader>el', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.keymap.set('n', '<leader>Ss', ':mksession! .session.vim<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>Sl', ':source .session.vim<CR>', { noremap = true, silent = false })

-- CSS View Mode
vim.keymap.set('n', '<leader>uv', ':CsvViewToggle delimiter=, comment=# display_mode=border<CR>', opts 'CSS View Mode')

-- Terminal mappings
-- vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', opts 'Exit terminal mode')
-- vim.keymap.set('n', '<M-t>', '<cmd>terminal<CR>', opts 'Open terminal')
-- vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', opts 'Move left')
-- vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j', opts 'Move down')
-- vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', opts 'Move up')
-- vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l', opts 'Move right')

-- Plugin management
vim.keymap.set('n', '<leader>l', '<cmd>Lazy<CR>', opts 'Lazy plugin manager')
vim.keymap.set('n', '<leader>m', '<cmd>Mason<CR>', opts 'Mason package manager')

-- UI toggles
-- vim.keymap.set('n', '<leader>us', '<cmd>Themery<CR>', opts 'colorschemes')
-- vim.keymap.set('n', '<leader>uu', '<cmd>colorscheme<CR>', opts 'Save colorscheme')
vim.keymap.set('n', '<leader>uu', '<cmd>lua vim.cmd("colorscheme " .. vim.g.colors_name)<CR>', opts 'Save colorscheme')
