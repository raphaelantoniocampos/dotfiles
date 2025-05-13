return
---@class snacks.dashboard.Config
---@field enabled? boolean
---@field sections snacks.dashboard.Section
---@field formats table<string, snacks.dashboard.Text|fun(item:snacks.dashboard.Item, ctx:snacks.dashboard.Format.ctx):snacks.dashboard.Text>
{
  width = 60,
  row = nil, -- dashboard position. nil for center
  col = nil, -- dashboard position. nil for center
  pane_gap = 4, -- empty columns between vertical panes
  autokeys = '1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', -- autokey sequence
  -- These settings are used by some built-in sections
  preset = {
    -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
    ---@type fun(cmd:string, opts:table)|nil
    pick = nil,
    -- Used by the `keys` section to show keymaps.
    -- Set your custom keymaps here.
    -- When using a function, the `items` argument are the default keymaps.
    ---@type snacks.dashboard.Item[]
    keys = {
      { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
      { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
      { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
      { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
      { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
      { icon = ' ', key = 's', desc = 'Restore Session', section = 'session' },
      { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
      { icon = '◍ ', key = 'M', desc = 'Mason', action = ':Mason' },
      { icon = '󰚰 ', key = 'U', desc = 'Update', action = ':Lazy update', enabled = package.loaded.lazy ~= nil },
      { icon = ' ', key = 'H', desc = 'Check Health', action = ':checkhealth' },
      { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
    },
    -- Used by the `header` section
    header = [[
 _   _ _____ _____ _   _ ________  ___
| \ | |  ___|  _  | | | |_   _|  \/  |
|  \| | |__ | | | | | | | | | | .  . |
| . ` |  __|| | | | | | | | | | |\/| |
| |\  | |___\ \_/ \ \_/ /_| |_| |  | |
\_| \_\____/ \___/ \___/ \___/\_|  |_/

,---,---,---,---,---,---,---,---,---,---,---,---,---,-------,
|1/2| 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 | + | ' | &lt;- |
|---'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-----|
| -&gt;| | Q | W | E | R | T | Y | U | I | O | P | ] | ^ |  |
|-----',--',--',--',--',--',--',--',--',--',--',--',--'|    |
| Caps | A | S | D | F | G | H | J | K | L | \ | [ | * |    |
|----,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'---'----|
|    | &lt; | Z | X | C | V | B | N | M | , | . | - |       |
|----'-,-',--'--,'---'---'---'---'---'---'-,-'---',--,------|
| ctrl |  | alt |                          |altgr |  | ctrl |
'------'  '-----'--------------------------'------'  '------']],
    -- header = [[
    --
    --
    -- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
    -- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
    -- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
    -- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
    -- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
    -- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
  },
  -- item field formatters
  formats = {
    icon = function(item)
      if item.file and item.icon == 'file' or item.icon == 'directory' then
        return M.icon(item.file, item.icon)
      end
      return { item.icon, width = 2, hl = 'icon' }
    end,
    footer = { '%s', align = 'center' },
    header = { '%s', align = 'center' },
    file = function(item, ctx)
      local fname = vim.fn.fnamemodify(item.file, ':~')
      fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
      if #fname > ctx.width then
        local dir = vim.fn.fnamemodify(fname, ':h')
        local file = vim.fn.fnamemodify(fname, ':t')
        if dir and file then
          file = file:sub(-(ctx.width - #dir - 2))
          fname = dir .. '/…' .. file
        end
      end
      local dir, file = fname:match '^(.*)/(.+)$'
      return dir and { { dir .. '/', hl = 'dir' }, { file, hl = 'file' } } or { { fname, hl = 'file' } }
    end,
  },
  sections = {

    { section = 'header' },
    { section = 'keys', gap = 1, padding = 1 },
    {
      pane = 1,
      icon = ' ',
      desc = 'Browse Repo',
      padding = 1,
      key = 'b',
      action = function()
        Snacks.gitbrowse()
      end,
    },
    {
      pane = 2,
      title = 'Local',
      section = 'terminal',
      height = 1,
      cmd = 'curl -s "wttr.in/?format=2"',
      padding = 1,
      ttl = 60 * 60,
    },
    {
      pane = 2,
      section = 'terminal',
      height = 1,

      cmd = 'curl -s "https://ipinfo.io/city"',
    },
    {
      pane = 2,
      section = 'terminal',
      height = 1,
      cmd = 'curl -s "https://ipinfo.io/region"',
    },
    {
      pane = 2,
      section = 'terminal',
      height = 1,
      cmd = 'curl -s "https://ipinfo.io/country"',
    },
    {
      pane = 2,
      section = 'terminal',
      height = 4,
      cmd = '',
    },
    function()
      local in_git = Snacks.git.get_root() ~= nil
      local cmds = {
        {
          title = 'Repo',
          -- cmd = 'gh notify -s -a -n5',
          cmd = 'gh repo view',
          action = function()
            vim.ui.open 'https://github.com/notifications'
          end,
          key = 'N',
          icon = ' ',
          height = 5,
          enabled = true,
        },
        {
          title = 'Open Issues',
          cmd = 'gh issue list -L 3',
          key = 'i',
          action = function()
            vim.fn.jobstart('gh issue list --web', { detach = true })
          end,
          icon = ' ',
          height = 7,
        },
        {
          icon = ' ',
          title = 'Open PRs',
          cmd = 'gh pr list -L 3',
          key = 'P',
          action = function()
            vim.fn.jobstart('gh pr list --web', { detach = true })
          end,
          height = 7,
        },
        {
          icon = ' ',
          section = 'terminal',
          title = 'Git Status',
          cmd = 'git status',
          -- cmd = 'git --no-pager diff --stat -B -M -C',
          height = 10,
        },
      }
      return vim.tbl_map(function(cmd)
        return vim.tbl_extend('force', {
          pane = 2,
          section = 'terminal',
          enabled = in_git,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        }, cmd)
      end, cmds)
    end,
    { section = 'startup' },
  },
}
