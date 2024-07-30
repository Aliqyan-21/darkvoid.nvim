local M = {}

M.setup = function()
	local colors = require("darkvoid.colors").config.colors

	-- Define GitSigns highlight groups
	local highlight_groups = {
		GitSignsAdd = { fg = colors.added },
		GitSignsChange = { fg = colors.changed },
		GitSignsDelete = { fg = colors.removed },
	}

	-- Apply the highlight groups
	for group_name, config in pairs(highlight_groups) do
		local cmd = "highlight " .. group_name
		if config.fg then
			cmd = cmd .. " guifg=" .. config.fg
		end
		vim.cmd(cmd)
	end
end

return M
