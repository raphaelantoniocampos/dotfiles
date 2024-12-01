-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used--[[ ) --[[ ]] ]]
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, for help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- Custom keymap
for i = 1, 9 do
	vim.keymap.set("n", "<leader>" .. i, ":tabn " .. i .. "<CR>", {})
end

vim.keymap.set("n", "<leader>ca", function()
	require("tiny-code-action").code_action()
end, { noremap = true, silent = true })

-- HTML SNIPPET
vim.api.nvim_set_keymap(
	"n",
	"<leader>th", -- Atalho: \ + t + h
	'i<!DOCTYPE html>\n<html lang="en">\n<head>\n  <meta charset="UTF-8">\n  <meta http-equiv="X-UA-Compatible" content="IE=edge">\n <meta name="viewport" content="width=device-width, initial-scale=1.0">\n  <title>Document</title>\n</head>\n<body>\n\n</body>\n</html>',
	{ noremap = true, silent = true }
)

vim.keymap.set("n", "<S-tab>", ":tabp<CR>", {})
vim.keymap.set("n", "<tab>", ":tabn<CR>", {})
vim.keymap.set("n", "<C-W>n", ":Neotree<CR>", { desc = "Open [n]eotree" })
vim.keymap.set("n", "<C-W>g", ":Neogit<CR>", { desc = "Open Neo[g]it" })
vim.keymap.set("n", "<C-W>t", ":tabnew<CR>", { desc = "Open a new [t]ab" })
vim.keymap.set("n", "<C-W>T", ":tabnew | term<CR>", { desc = "Open a new tab and [T]erminal" })
vim.keymap.set("n", "<C-W>m", ":tabnew | edit main.py<CR>", { desc = "Open a new tab and main" })
vim.keymap.set("n", "<leader>se", function()
	vim.cmd("split | terminal tuimoji")
end, { desc = "[S]earch [E]moji" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins, you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require("lazy").setup({
	-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

	-- NOTE: Plugins can also be added by using a table,
	-- with the first argument being the link and the following
	-- keys can be used to configure plugin behavior/loading/etc.
	--
	-- Use `opts = {}` to force a plugin to be loaded.
	--
	--  This is equivalent to:
	--    require('Comment').setup({})
	--
	--
	-- Custom Plugins
	--
	--
	--
	{
		"rachartier/tiny-code-action.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim" },
		},
		event = "LspAttach",
		config = function()
			require("tiny-code-action").setup()
		end,
	},

	{
		"sbdchd/neoformat",
		-- config = function()
		-- 	require("neoformat").setup()
		-- end,
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
			config = function()
				require("noice").setup({
					lsp = {
						-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
						override = {
							["vim.lsp.util.convert_input_to_markdown_lines"] = true,
							["vim.lsp.util.stylize_markdown"] = true,
							["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
						},
					},
					-- you can enable a preset for easier configuration
					presets = {
						bottom_search = true, -- use a classic bottom cmdline for search
						command_palette = true, -- position the cmdline and popupmenu together
						long_message_to_split = true, -- long messages will be sent to a split
						inc_rename = false, -- enables an input dialog for inc-rename.nvim
						lsp_doc_border = false, -- add a border to hover docs and signature help
					},
				})
			end,
		},
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		config = function()
			require("neo-tree").setup({})
		end,
	},
	--
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},

	{
		"norcalli/nvim-colorizer.lua",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("colorizer").setup({})
		end,
	},

	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		-- dependencies = { { "echasnovski/mini.icons", opts = {} } },
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
		config = function()
			require("oil").setup()
		end,
	},

	-- Debug Adapter
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			dependencies = {
				{ "nvim-neotest/nvim-nio" },
				{
					"mfussenegger/nvim-dap-python",
					config = function()
						local dappython = require("dap-python")
						dappython.setup("~/.virtualenvs/debugpy/bin/python")
						dappython.test_runner = "pytest"
					end,
				},
				{
					"folke/neodev.nvim",
					config = function()
						local neodev = require("neodev")
						neodev.setup({
							library = { plugins = { "nvim-dap-ui" }, types = true },
						})
					end,
				},
			},
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
			vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, {})
			vim.keymap.set("n", "<F2>", dap.continue, {})
			vim.keymap.set("n", "<F3>", dap.step_into, {})
			vim.keymap.set("n", "<F4>", dap.step_over, {})
			vim.keymap.set("n", "<F5>", dap.step_out, {})
			vim.keymap.set("n", "<F6>", dap.terminate, {})
		end,
	},
	--
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				theme = "hyper",
				config = {
					week_header = {
						enable = true,
					},
					shortcut = {
						{ desc = "µ Update", group = "@property", action = "Lazy update", key = "u" },
						{
							icon = " ",
							icon_hl = "@variable",
							desc = "Files",
							group = "Label",
							action = "Telescope find_files",
							key = "f",
						},
						{
							desc = " Health",
							group = "DiagnosticHint",
							action = "checkhealth",
							key = "h",
						},
						{
							desc = " Dot Files",
							group = "Number",
							action = function()
								require("telescope.builtin").find_files({
									cwd = "~/dotfiles/",
									follow = true,
									hidden = true,
									no_ignore = false,
									no_ignore_parent = false,
									file_ignore_patterns = { ".git/" },
								})
							end,
							key = ".",
						},
					},
				},
				-- config
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	--
	-- "gc" to comment visual regions/lines
	{ "numToStr/Comment.nvim", opts = {} },

	-- Here is a more advanced example where we pass configuration
	-- options to `gitsigns.nvim`. This is equivalent to the following lua:
	--    require('gitsigns').setup({ ... })
	--
	-- See `:help gitsigns` to understand what the configuration keys do
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed.
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = function()
			local neogit = require("neogit")

			neogit.setup({
				-- Hides the hints at the top of the status buffer
				disable_hint = false,
				-- Disables changing the buffer highlights based on where the cursor is.
				disable_context_highlighting = false,
				-- Disables signs for sections/items/hunks
				disable_signs = false,
				-- Changes what mode the Commit Editor starts in. `true` will leave nvim in normal mode, `false` will change nvim to
				-- insert mode, and `"auto"` will change nvim to insert mode IF the commit message is empty, otherwise leaving it in
				-- normal mode.
				disable_insert_on_commit = "auto",
				-- When enabled, will watch the `.git/` directory for changes and refresh the status buffer in response to filesystem
				-- events.
				filewatcher = {
					interval = 1000,
					enabled = true,
				},
				-- "ascii"   is the graph the git CLI generates
				-- "unicode" is the graph like https://github.com/rbong/vim-flog
				-- "kitty"   is the graph like https://github.com/isakbm/gitgraph.nvim - use https://github.com/rbong/flog-symbols if you don't use Kitty
				graph_style = "ascii",
				-- Used to generate URL's for branch popup action "pull request".
				git_services = {
					["github.com"] = "https://github.com/${owner}/${repository}/compare/${branch_name}?expand=1",
					["bitbucket.org"] = "https://bitbucket.org/${owner}/${repository}/pull-requests/new?source=${branch_name}&t=1",
					["gitlab.com"] = "https://gitlab.com/${owner}/${repository}/merge_requests/new?merge_request[source_branch]=${branch_name}",
					["azure.com"] = "https://dev.azure.com/${owner}/_git/${repository}/pullrequestcreate?sourceRef=${branch_name}&targetRef=${target}",
				},
				-- Allows a different telescope sorter. Defaults to 'fuzzy_with_index_bias'. The example below will use the native fzf
				-- sorter instead. By default, this function returns `nil`.
				telescope_sorter = function()
					return require("telescope").extensions.fzf.native_fzf_sorter()
				end,
				-- Persist the values of switches/options within and across sessions
				remember_settings = true,
				-- Scope persisted settings on a per-project basis
				use_per_project_settings = true,
				-- Table of settings to never persist. Uses format "Filetype--cli-value"
				ignored_settings = {
					"NeogitPushPopup--force-with-lease",
					"NeogitPushPopup--force",
					"NeogitPullPopup--rebase",
					"NeogitCommitPopup--allow-empty",
					"NeogitRevertPopup--no-edit",
				},
				-- Configure highlight group features
				highlight = {
					italic = true,
					bold = true,
					underline = true,
				},
				-- Set to false if you want to be responsible for creating _ALL_ keymappings
				use_default_keymaps = true,
				-- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size.
				-- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
				auto_refresh = true,
				-- Value used for `--sort` option for `git branch` command
				-- By default, branches will be sorted by commit date descending
				-- Flag description: https://git-scm.com/docs/git-branch#Documentation/git-branch.txt---sortltkeygt
				-- Sorting keys: https://git-scm.com/docs/git-for-each-ref#_options
				sort_branches = "-committerdate",
				-- Default for new branch name prompts
				initial_branch_name = "",
				-- Change the default way of opening neogit
				kind = "tab",
				-- Disable line numbers and relative line numbers
				disable_line_numbers = true,
				-- The time after which an output console is shown for slow running commands
				console_timeout = 2000,
				-- Automatically show console if a command takes more than console_timeout milliseconds
				auto_show_console = true,
				-- Automatically close the console if the process exits with a 0 (success) status
				auto_close_console = true,
				status = {
					show_head_commit_hash = true,
					recent_commit_count = 10,
					HEAD_padding = 10,
					HEAD_folded = false,
					mode_padding = 3,
					mode_text = {
						M = "modified",
						N = "new file",
						A = "added",
						D = "deleted",
						C = "copied",
						U = "updated",
						R = "renamed",
						DD = "unmerged",
						AU = "unmerged",
						UD = "unmerged",
						UA = "unmerged",
						DU = "unmerged",
						AA = "unmerged",
						UU = "unmerged",
						["?"] = "",
					},
				},
				commit_editor = {
					kind = "tab",
					show_staged_diff = true,
					-- Accepted values:
					-- "split" to show the staged diff below the commit editor
					-- "vsplit" to show it to the right
					-- "split_above" Like :top split
					-- "vsplit_left" like :vsplit, but open to the left
					-- "auto" "vsplit" if window would have 80 cols, otherwise "split"
					staged_diff_split_kind = "split",
					spell_check = true,
				},
				commit_select_view = {
					kind = "tab",
				},
				commit_view = {
					kind = "vsplit",
					verify_commit = vim.fn.executable("gpg") == 1, -- Can be set to true or false, otherwise we try to find the binary
				},
				log_view = {
					kind = "tab",
				},
				rebase_editor = {
					kind = "auto",
				},
				reflog_view = {
					kind = "tab",
				},
				merge_editor = {
					kind = "auto",
				},
				tag_editor = {
					kind = "auto",
				},
				preview_buffer = {
					kind = "floating",
				},
				popup = {
					kind = "split",
				},
				signs = {
					-- { CLOSED, OPENED }
					hunk = { "", "" },
					item = { ">", "v" },
					section = { ">", "v" },
				},
				-- Each Integration is auto-detected through plugin presence, however, it can be disabled by setting to `false`
				integrations = {
					-- If enabled, use telescope for menu selection rather than vim.ui.select.
					-- Allows multi-select and some things that vim.ui.select doesn't.
					telescope = nil,
					-- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `diffview`.
					-- The diffview integration enables the diff popup.
					--
					-- Requires you to have `sindrets/diffview.nvim` installed.
					diffview = nil,

					-- If enabled, uses fzf-lua for menu selection. If the telescope integration
					-- is also selected then telescope is used instead
					-- Requires you to have `ibhagwan/fzf-lua` installed.
					fzf_lua = nil,

					-- If enabled, uses mini.pick for menu selection. If the telescope integration
					-- is also selected then telescope is used instead
					-- Requires you to have `echasnovski/mini.pick` installed.
					mini_pick = nil,
				},
				sections = {
					-- Reverting/Cherry Picking
					sequencer = {
						folded = false,
						hidden = false,
					},
					untracked = {
						folded = false,
						hidden = false,
					},
					unstaged = {
						folded = false,
						hidden = false,
					},
					staged = {
						folded = false,
						hidden = false,
					},
					stashes = {
						folded = true,
						hidden = false,
					},
					unpulled_upstream = {
						folded = true,
						hidden = false,
					},
					unmerged_upstream = {
						folded = false,
						hidden = false,
					},
					unpulled_pushRemote = {
						folded = true,
						hidden = false,
					},
					unmerged_pushRemote = {
						folded = false,
						hidden = false,
					},
					recent = {
						folded = true,
						hidden = false,
					},
					rebase = {
						folded = true,
						hidden = false,
					},
				},
				mappings = {
					commit_editor = {
						["q"] = "Close",
						["<c-c><c-c>"] = "Submit",
						["<c-c><c-k>"] = "Abort",
					},
					commit_editor_I = {
						["<c-c><c-c>"] = "Submit",
						["<c-c><c-k>"] = "Abort",
					},
					rebase_editor = {
						["p"] = "Pick",
						["r"] = "Reword",
						["e"] = "Edit",
						["s"] = "Squash",
						["f"] = "Fixup",
						["x"] = "Execute",
						["d"] = "Drop",
						["b"] = "Break",
						["q"] = "Close",
						["<cr>"] = "OpenCommit",
						["gk"] = "MoveUp",
						["gj"] = "MoveDown",
						["<c-c><c-c>"] = "Submit",
						["<c-c><c-k>"] = "Abort",
						["[c"] = "OpenOrScrollUp",
						["]c"] = "OpenOrScrollDown",
					},
					rebase_editor_I = {
						["<c-c><c-c>"] = "Submit",
						["<c-c><c-k>"] = "Abort",
					},
					finder = {
						["<cr>"] = "Select",
						["<c-c>"] = "Close",
						["<esc>"] = "Close",
						["<c-n>"] = "Next",
						["<c-p>"] = "Previous",
						["<down>"] = "Next",
						["<up>"] = "Previous",
						["<tab>"] = "MultiselectToggleNext",
						["<s-tab>"] = "MultiselectTogglePrevious",
						["<c-j>"] = "NOP",
					},
					-- Setting any of these to `false` will disable the mapping.
					popup = {
						["?"] = "HelpPopup",
						["A"] = "CherryPickPopup",
						["D"] = "DiffPopup",
						["M"] = "RemotePopup",
						["P"] = "PushPopup",
						["X"] = "ResetPopup",
						["Z"] = "StashPopup",
						["b"] = "BranchPopup",
						["B"] = "BisectPopup",
						["c"] = "CommitPopup",
						["f"] = "FetchPopup",
						["l"] = "LogPopup",
						["m"] = "MergePopup",
						["p"] = "PullPopup",
						["r"] = "RebasePopup",
						["v"] = "RevertPopup",
						["w"] = "WorktreePopup",
					},
					status = {
						["k"] = "MoveUp",
						["j"] = "MoveDown",
						["q"] = "Close",
						["o"] = "OpenTree",
						["I"] = "InitRepo",
						["1"] = "Depth1",
						["2"] = "Depth2",
						["3"] = "Depth3",
						["4"] = "Depth4",
						["<tab>"] = "Toggle",
						["x"] = "Discard",
						["s"] = "Stage",
						["S"] = "StageUnstaged",
						["<c-s>"] = "StageAll",
						["K"] = "Untrack",
						["u"] = "Unstage",
						["U"] = "UnstageStaged",
						["$"] = "CommandHistory",
						["Y"] = "YankSelected",
						["<c-r>"] = "RefreshBuffer",
						["<cr>"] = "GoToFile",
						["<s-cr>"] = "PeekFile",
						["<c-v>"] = "VSplitOpen",
						["<c-x>"] = "SplitOpen",
						["<c-t>"] = "TabOpen",
						["{"] = "GoToPreviousHunkHeader",
						["}"] = "GoToNextHunkHeader",
						["[c"] = "OpenOrScrollUp",
						["]c"] = "OpenOrScrollDown",
						["<c-k>"] = "PeekUp",
						["<c-j>"] = "PeekDown",
					},
				},
			})
		end,
	},

	-- NOTE: Plugins can also be configured to run lua code when they are loaded.
	--
	-- This is often very useful to both group configuration, as well as handle
	-- lazy loading plugins that don't need to be loaded immediately at startup.
	--
	-- For example, in the following configuration, we use:
	--  event = 'VimEnter'
	--
	-- which loads which-key before all the UI elements are loaded. Events can be
	-- normal autocommands events (`:help autocmd-events`).
	--
	-- Then, because we use the `config` key, the configuration only runs
	-- after the plugin has been loaded:
	--  config = function() ... end

	{ -- Useful plugin to show you pending keybinds.
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		config = function() -- This is the function that runs, AFTER loading
			require("which-key").setup()

			-- Document existing key chains
			require("which-key").register({
				["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
				["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
				["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
				["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
				["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
			})
		end,
	},

	-- NOTE: Plugins can specify dependencies.
	--
	-- The dependencies are proper plugin specifications as well - anything
	-- you do for a plugin at the top level, you can do for a dependency.
	--
	-- Use the `dependencies` key to specify the dependencies of a particular plugin

	{ -- Fuzzy Finder (files, lsp, etc)
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		-- branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ -- If encountering errors, see telescope-fzf-native README for install instructions
				"nvim-telescope/telescope-fzf-native.nvim",

				-- `build` is used to run some command when the plugin is installed/updated.
				-- This is only run then, not every time Neovim starts up.
				build = "make",

				-- `cond` is a condition used to determine whether this plugin should be
				-- installed and loaded.
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },

			-- Useful for getting pretty icons, but requires a Nerd Font.
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			-- Telescope is a fuzzy finder that comes with a lot of different things that
			-- it can fuzzy find! It's more than just a "file finder", it can search
			-- many different aspects of Neovim, your workspace, LSP, and more!
			--
			-- The easiest way to use telescope, is to start by doing something like:
			--  :Telescope help_tags
			--
			-- After running this command, a window will open up and you're able to
			-- type in the prompt window. You'll see a list of help_tags options and
			-- a corresponding preview of the help.
			--
			-- Two important keymaps to use while in telescope are:
			--  - Insert mode: <c-/>
			--  - Normal mode: ?
			--
			-- This opens a window that shows you all of the keymaps for the current
			-- telescope picker. This is really useful to discover what Telescope can
			-- do as well as how to actually do it!

			-- [[ Configure Telescope ]]
			-- See `:help telescope` and `:help telescope.setup()`
			require("telescope").setup({
				-- You can put your default mappings / updates / etc. in here
				--  All the info you're looking for is in `:help telescope.setup()`
				--
				-- defaults = {
				--   mappings = {
				--     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
				--   },
				-- },
				-- pickers = {}
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			-- Enable telescope extensions, if they are installed
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			-- See `:help telescope.builtin`
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
			vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
			vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
			vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

			-- Slightly advanced example of overriding default behavior and theme
			vim.keymap.set("n", "<leader>/", function()
				-- You can pass additional configuration to telescope to change theme, layout, etc.
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })

			-- Also possible to pass additional configuration options.
			--  See `:help telescope.builtin.live_grep()` for information about particular keys
			vim.keymap.set("n", "<leader>s/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "[S]earch [/] in Open Files" })

			-- Shortcut for searching your neovim configuration files
			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S]earch [N]eovim files" })
		end,
	},

	{ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs and related tools to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"j-hui/fidget.nvim",

			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					-- NOTE: Remember that lua is a real programming language, and as such it is possible
					-- to define small helper and utility functions so you don't have to repeat yourself
					-- many times.
					--
					-- In this case, we create a function that lets us more easily define mappings specific
					-- for LSP related items. It sets the mode, buffer and description for us each time.
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					-- Jump to the definition of the word under your cursor.
					--  This is where a variable was first declared, or where a function is defined, etc.
					--  To jump back, press <C-t>.
					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

					-- Find references for the word under your cursor.
					map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

					-- Jump to the implementation of the word under your cursor.
					--  Useful when your language has ways of declaring types without an actual implementation.
					map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

					-- Jump to the type of the word under your cursor.
					--  Useful when you're not sure what type a variable is and you want to see
					--  the definition of its *type*, not where it was *defined*.
					map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

					-- Fuzzy find all the symbols in your current document.
					--  Symbols are things like variables, functions, types, etc.
					map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

					-- Fuzzy find all the symbols in your current workspace
					--  Similar to document symbols, except searches over your whole project.
					map(
						"<leader>ws",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[W]orkspace [S]ymbols"
					)

					-- Rename the variable under your cursor
					--  Most Language Servers support renaming across files, etc.
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

					-- Execute a code action, usually your cursor needs to be on top of an error
					-- or a suggestion from your LSP for this to activate.
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

					-- Opens a popup that displays documentation about the word under your cursor
					--  See `:help K` for why this keymap
					map("K", vim.lsp.buf.hover, "Hover Documentation")

					-- WARN: This is not Goto Definition, this is Goto Declaration.
					--  For example, in C this would take you to the header
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

					-- The following two autocommands are used to highlight references of the
					-- word under your cursor when your cursor rests there for a little while.
					--    See `:help CursorHold` for information about when this is executed
					--
					-- When you move your cursor, the highlights will be cleared (the second autocommand).
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.documentHighlightProvider then
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.clear_references,
						})
					end
				end,
			})

			-- LSP servers and clients are able to communicate to each other what features they support.
			--  By default, Neovim doesn't support everything that is in the LSP Specification.
			--  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
			--  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			-- Enable the following language servers
			--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
			--
			--  Add any additional override configuration in the following tables. Available keys are:
			--  - cmd (table): Override the default command used to start the server
			--  - filetypes (table): Override the default list of associated filetypes for the server
			--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
			--  - settings (table): Override the default settings passed when initializing the server.
			--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
			local servers = {
				-- gopls = {},
				html = {},
				-- rust_analyzer = {},
				-- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
				--
				-- Some languages (like typescript) have entire language plugins that can be useful:
				--    https://github.com/pmizio/typescript-tools.nvim
				--
				-- But for many setups, the LSP (`tsserver`) will work just fine
				-- tsserver = {},
				--

				lua_ls = {
					-- cmd = {...},
					-- filetypes { ...},
					-- capabilities = {},
					settings = {
						Lua = {
							runtime = { version = "LuaJIT" },
							workspace = {
								checkThirdParty = false,
								-- Tells lua_ls where to find all the Lua files that you have loaded
								-- for your neovim configuration.
								library = {
									"${3rd}/luv/library",
									unpack(vim.api.nvim_get_runtime_file("", true)),
								},
								-- If lua_ls is really slow on your computer, you can try this instead:
								-- library = { vim.env.VIMRUNTIME },
							},
							completion = {
								callSnippet = "Replace",
							},
							-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
							-- diagnostics = { disable = { 'missing-fields' } },
						},
					},
				},
			}

			-- Ensure the servers and tools above are installed
			--  To check the current status of installed tools and/or manually install
			--  other tools, you can run
			--    :Mason
			--
			--  You can press `g?` for help in this menu

			require("mason").setup()

			-- You can add other tools here that you want Mason to install
			-- for you, so that they are available from within Neovim.
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua", -- Used to format lua code
				"debugpy",
				"mypy",
				"ruff",
				"python-lsp-server",
				"html-lsp",
				"prettier",
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						-- This handles overriding only values explicitly passed
						-- by the server configuration above. Useful when disabling
						-- certain features of an LSP (for example, turning off formatting for tsserver)
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)

						require("lspconfig").gleam.setup({})
						require("lspconfig").html.setup({})
					end,
				},
			})
		end,
	},

	{ -- Autoformat
		"stevearc/conform.nvim",
		opts = {
			notify_on_error = false,
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform can also run multiple formatters sequentially
				python = { "ruff" },
				--
				-- You can use a sub-list to tell conform to run *until* a formatter
				-- is found.
				-- javascript = { { "prettierd", "prettier" } },
			},
		},
	},

	{ -- Autocompletion
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					-- Build Step is needed for regex support in snippets
					-- This step is not supported in many windows environments
					-- Remove the below condition to re-enable on windows
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
			},
			"saadparwaiz1/cmp_luasnip",

			-- Adds other completion capabilities.
			--  nvim-cmp does not ship with all sources by default. They are split
			--  into multiple repos for maintenance purposes.
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",

			-- If you want to add a bunch of pre-configured snippets,
			--    you can use this plugin to help you. It even has snippets
			--    for various frameworks/libraries/etc. but you will have to
			--    set up the ones that are useful for you.
			-- 'rafamadriz/friendly-snippets',
		},
		config = function()
			-- See `:help cmp`
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup({})

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { completeopt = "menu,menuone,noinsert" },

				-- For an understanding of why these mappings were
				-- chosen, you will need to read `:help ins-completion`
				--
				-- No, but seriously. Please read `:help ins-completion`, it is really good!
				mapping = cmp.mapping.preset.insert({
					-- Select the [n]ext item
					["<C-n>"] = cmp.mapping.select_next_item(),
					-- Select the [p]revious item
					["<C-p>"] = cmp.mapping.select_prev_item(),

					-- Accept ([y]es) the completion.
					--  This will auto-import if your LSP supports it.
					--  This will expand snippets if the LSP sent a snippet.
					["<C-y>"] = cmp.mapping.confirm({ select = true }),

					-- Manually trigger a completion from nvim-cmp.
					--  Generally you don't need this, because nvim-cmp will display
					--  completions whenever it has completion options available.
					["<C-Space>"] = cmp.mapping.complete({}),

					-- Think of <c-l> as moving to the right of your snippet expansion.
					--  So if you have a snippet that's like:
					--  function $name($args)
					--    $body
					--  end
					--
					-- <c-l> will move you to the right of each of the expansion locations.
					-- <c-h> is similar, except moving you backwards.
					["<C-l>"] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end, { "i", "s" }),
					["<C-h>"] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { "i", "s" }),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				},
			})
		end,
	},

	{ -- You can easily change to a different colorscheme.
		-- Change the name of the colorscheme plugin below, and then
		-- change the command in the config to whatever the name of that colorscheme is
		--
		-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- Load the colorscheme here.
			-- Like many other themes, this one has different styles, and you could load
			-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
			-- vim.cmd.colorscheme 'tokyonight-night'

			-- You can configure highlights by doing something like
			vim.cmd.hi("Comment gui=none")
		end,
	},
	--

	-- {
	--   'catppuccin/nvim',
	--   name = 'catppuccin',
	--   lazy = false,
	--   priority = 1000,
	--   config = function()
	--     vim.cmd.colorscheme 'catppuccin-mocha'
	--   end,
	-- },
	--
	-- {
	--   'sainnhe/sonokai',
	--   name = 'sonokai',
	--   lazy = false,
	--   priority = 1000,
	--   config = function()
	--     vim.cmd.colorscheme 'sonokai'
	--     vim.g.sonokai_enable_italic = true
	--   end,
	-- },
	--
	{
		"Mofiqul/dracula.nvim",
		lazy = false,
		priority = 100,
		config = function()
			vim.cmd.colorscheme("dracula")
		end,
	},
	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	{ -- Collection of various small independent plugins/modules
		"echasnovski/mini.nvim",
		config = function()
			-- Better Around/Inside textobjects
			--
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [']quote
			--  - ci'  - [C]hange [I]nside [']quote
			require("mini.ai").setup({ n_lines = 500 })
			require("mini.icons").setup()
			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup()

			-- Simple and easy statusline.
			--  You could remove this setup call if you don't like it,
			--  and try some other statusline plugin
			local statusline = require("mini.statusline")
			-- set use_icons to true if you have a Nerd Font
			statusline.setup({ use_icons = vim.g.have_nerd_font })

			-- You can configure sections in the statusline by overriding their
			-- default behavior. For example, here we set the section for
			-- cursor location to LINE:COLUMN
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end

			-- ... and there is more!
			--  Check out: https://github.com/echasnovski/mini.nvim
		end,
	},

	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "bash", "c", "html", "lua", "markdown", "vim", "vimdoc", "python", "gleam" },
			-- Autoinstall languages that are not installed
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		},
		config = function(_, opts)
			-- [[ Configure Treesitter ]] See `:help nvim-treesitter`

			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup(opts)

			-- There are additional nvim-treesitter modules that you can use to interact
			-- with nvim-treesitter. You should go explore a few and see what interests you:
			--
			--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
			--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
			--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
		end,
	},

	-- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
	-- init.lua. If you want these files, they are in the repository, so you can just download them and
	-- put them in the right spots if you want.

	-- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for kickstart
	--
	--  Here are some example plugins that I've included in the kickstart repository.
	--  Uncomment any of the lines below to enable them (you will need to restart nvim).
	--
	require("kickstart.plugins.debug"),
	require("kickstart.plugins.indent_line"),

	-- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
	--    This is the easiest way to modularize your config.
	--
	--  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
	--    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
	{ import = "custom.plugins" },
}, {
	ui = {
		-- If you have a Nerd Font, set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
