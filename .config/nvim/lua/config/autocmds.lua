-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "json", "jsonc", "markdown" },
	callback = function()
		vim.opt.conceallevel = 0
	end,
})

vim.api.nvim_create_user_command("MC", function()
	if vim.opt_local.nu:get() then
		vim.opt_local.nu = false
		vim.opt.relativenumber = false

		-- built in
		vim.opt.list = false

		-- indent-blankline
		vim.cmd(":IBLDisable")
	else
		vim.opt_local.nu = true
		vim.opt.relativenumber = true

		-- built in
		vim.opt.list = true

		-- indent-blankline
		vim.cmd(":IBLEnable")
	end
end, {})
