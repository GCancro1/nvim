vim.opt.runtimepath:append("/home/g/.local/share/nvim/site")

vim.g.have_nerd_font = true
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true
vim.o.mouse = "a"

vim.opt.relativenumber = true -- editor.lineNumbers: "relative"
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.wrap = true -- editor.wordWrap: "wordWrapColumn"
vim.opt.wrapmargin = 160 -- editor.wordWrapColumn: 160
vim.opt.termguicolors = true
vim.opt.scrolloff = 8 -- editor.cursorSurroundingLines: 6
vim.opt.hlsearch = true -- vim.hlsearch: true
vim.opt.ignorecase = true -- vim.sneakUseIgnorecaseAndSmartcase: true
vim.opt.smartcase = true
vim.opt.updatetime = 100 -- vim.highlightedyank.duration equivalent

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.backspace = { "start", "eol", "indent" }

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.schedule(function()
-- 	vim.o.clipboard = "unnamedplus"
-- end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = "yes"

-- Decrease update time
-- vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- need to change terminal pref to not eat these
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

local map = vim.keymap.set
-- LSP bindings (your gd, gr, gi)
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

-- Comment toggle (your <leader>/)
map("n", "<leader>/", "gcc", { noremap = true, desc = "Toggle comment" })
map("v", "<leader>/", "gcc", { noremap = true, desc = "Toggle comment" })

-- Insert mode: jk → Esc + nohl
map("i", "jj", "<Esc><cmd>nohlsearch<CR>l", { noremap = true })

-- Search centering
map("n", "n", "nzzzv", { noremap = true })
map("n", "N", "Nzzzv", { noremap = true })
map("n", "<C-d>", "<C-d>zz", { noremap = true })
map("n", "<C-u>", "<C-u>zz", { noremap = true })

map("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
map("n", "<leader>p", '"+p', { desc = "Paste from clipboard" })
map("n", "<leader>w", "<cmd>w!<CR>", { desc = "Force write" })

map("o", "l", "$", { desc = "Operator pending: l → $" })
map("o", "h", "^", { desc = "Operator pending: h → ^" })

-- Ctrl+q → Visual Block Mode (your VSCode Vim habit)
map("n", "<C-q>", "<C-v>", { desc = "Visual block mode" })

map("n", "<leader>q", ":bd<CR>")

vim.keymap.set("n", "<leader>d", [["_d]], { desc = "Delete to black hole" })
vim.keymap.set("v", "<leader>d", [["_d]], { desc = "Delete to black hole" })

-- TODO !!!
-- <leader>, = Text object yank namespace
-- vim.keymap.set("n", "<leader>,", "<Nop>", { desc = "Text objects" })
--
--
-- vim.keymap.set("n", "<leader>,'",  "vi'pgv\"+y",   { desc = "Yank quotes" })
-- vim.keymap.set("n", "<leader>,\"", "vi\"pgv\"+y",  { desc = "Yank quotes" })
-- vim.keymap.set("n", "<leader>,[",  "vi]pgv\"+y",   { desc = "Yank brackets" })
-- vim.keymap.set("n", "<leader>,{",  "vi}pgv\"+y",   { desc = "Yank braces" })
-- vim.keymap.set("n", "<leader>,b",  "vibpgv\"+y",   { desc = "Yank parens" })
--

-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "Toggle explorer" })

-- ====== LOAD PLUGINS ======
require("setuplazy") -- Your plugins/lazy/kickstart logic
