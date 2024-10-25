local M = {}

M.setup = function(config)
	local colors = require("darkvoid.colors").config.colors
	local enabled = config.colors.plugins.whichkey

	if not enabled then
		return
	end

	local highlight_groups = {
		WhichKey = { fg = colors.fg, bg = colors.bg },
		WhichKeyGroup = { fg = colors.kw, bg = colors.bg },
		WhichKeyDesc = { fg = colors.func, bg = colors.bg },
		WhichKeySeperator = { fg = colors.comment, bg = colors.bg },
	}

	for group_name, conf in pairs(highlight_groups) do
		local cmd = "highlight " .. group_name
		if conf.fg then
			cmd = cmd .. " guifg=" .. conf.fg
		end
		if conf.bg then
			cmd = cmd .. " guibg=" .. conf.bg
		end
		vim.cmd(cmd)
	end
end

return M
