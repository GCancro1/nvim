-- OFFLINE MODE: Disable all network activity
vim.g.lazy_bootstrap = false -- Skip lazy bootstrap
vim.g.mapleader = " "

-- Disable Mason updates/checks
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		require("mason").setup({
			install_root_dir = vim.fn.stdpath("data") .. "/mason",
			github_host = "127.0.0.1", -- Block github
		})
	end,
})

-- Lazy.nvim: Offline only
require("lazy").setup({
	-- your plugins here (already copied)
}, {
	checker = { enabled = false }, -- No update checks
	git = { timeout = 1 }, -- Fast git timeout
	install = { missing = false }, -- Don't install missing
	change_detection = { notify = false },
})

-- Mason offline
-- require("mason-lspconfig").setup({
-- 	ensure_installed = {}, -- Nothing auto-installs
-- 	automatic_installation = false,
-- })
