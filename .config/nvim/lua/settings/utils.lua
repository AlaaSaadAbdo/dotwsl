local bo = vim.bo
local cmd = vim.cmd
local api = vim.api
local g = vim.g
local U = {}

function U.apply_options(opts)
	for k, v in pairs(opts) do
		if v == true then
			cmd("set " .. k)
		elseif v == false then
			cmd(string.format("set no%s", k))
		else
			cmd(string.format("set %s=%s", k, v))
		end
	end
end

function U.apply_globals(opts)
	for k, v in pairs(opts) do
		g[k] = v
	end
end

function U.help_tab()
	if bo.buftype == "help" then
		local nr = api.nvim_get_current_buf()
		api.nvim_buf_set_keymap(nr, "", "q", ":q<CR>", { noremap = true, silent = true })
	end
end

function U.map(mode, key, result, opts)
	opts = vim.tbl_extend("keep", opts or {}, {
		noremap = true,
		silent = true,
		expr = false,
	})
	vim.api.nvim_set_keymap(mode, key, result, opts)
end

_G.folds_render = require("settings.fold").render

function _G.reload()
	local modules = { "lsp", "plugins", "settings" }
	for _, moduleName in pairs(modules) do
		for packageName, _ in pairs(package.loaded) do
			if string.find(packageName, "^" .. moduleName) then
				package.loaded[packageName] = nil
			end
		end
		require(moduleName)
	end
	print("Reloaded!")
end

return U
