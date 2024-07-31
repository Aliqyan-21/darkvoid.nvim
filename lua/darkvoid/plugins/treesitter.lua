local M = {}

function M.setup()
	local colors = require("darkvoid.colors").config.colors

	local highlight_groups = {
		TSFunction = { fg = colors.func, bg = "NONE" },
		TSKeyword = { fg = colors.kw, bg = "NONE" },
		TSString = { fg = colors.string, bg = "NONE" },
		TSVariable = { fg = colors.identifier, bg = "NONE" },
		TSType = { fg = colors.type, bg = "NONE" },
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
