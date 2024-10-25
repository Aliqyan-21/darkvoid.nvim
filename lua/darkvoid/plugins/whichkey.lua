local M = {}

M.setup = function()
	local colors = require("darkvoid.colors").config.colors
	local enabled = require("darkvoid.colors").config.plugins.whichkey

	if not enabled then
		return
	end

	local highlight_groups = {
		WhichKey = { fg = colors.fg, bg = colors.bg },
		WhichKeyGroup = { fg = colors.kw, bg = colors.bg },
		WhichKeyDesc = { fg = colors.func, bg = colors.bg },
		WhichKeySeperator = { fg = colors.comment, bg = colors.bg },
	}

	for group_name, config in pairs(highlight_groups) do
		local cmd = "highlight " .. group_name
		if config.fg then
			cmd = cmd .. " guifg=" .. config.fg
		end
		if config.bg then
			cmd = cmd .. " guibg=" .. config.bg
		end
		vim.cmd(cmd)
	end
end

return M
