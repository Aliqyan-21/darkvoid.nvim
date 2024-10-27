local M = {}

M.setup = function()
	local colors = require("darkvoid.colors").config.colors

	local enabled = require("darkvoid.colors").config.colors.plugins.nvim_notify

	if not enabled then
		return
	end

	local highlight_groups = {
		NotifyERRORBorder = { fg = colors.error, bg = "NONE" },
		NotifyWARNBorder = { fg = colors.warn, bg = "NONE" },
		NotifyINFOBorder = { fg = colors.info, bg = "NONE" },
		NotifyDEBUGBorder = { fg = colors.info, bg = "NONE" },
		NotifyTRACEBorder = { fg = colors.info, bg = "NONE" },

		NotifyERRORIcon = { fg = colors.error, bg = "NONE" },
		NotifyWARNIcon = { fg = colors.warn, bg = "NONE" },
		NotifyINFOIcon = { fg = colors.info, bg = "NONE" },
		NotifyDEBUGIcon = { fg = colors.info, bg = "NONE" },
		NotifyTRACEIcon = { fg = colors.info, bg = "NONE" },

		NotifyERRORTitle = { fg = colors.error, bg = "NONE" },
		NotifyWARNTitle = { fg = colors.warn, bg = "NONE" },
		NotifyINFOTitle = { fg = colors.info, bg = "NONE" },
		NotifyDEBUGTitle = { fg = colors.info, bg = "NONE" },
		NotifyTRACETitle = { fg = colors.info, bg = "NONE" },
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
