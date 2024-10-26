local M = {}

M.setup = function()
	local colors = require("darkvoid.colors").config.colors
	local enabled = require("darkvoid.colors").config.colors.plugins.whichkey
	local transparent = require("darkvoid.colors").config.transparent

	if not enabled then
		return
	end

	local highlight_groups = {
		WhichKey = { fg = colors.func, bg = transparent and "NONE" or colors.bg },
		WhichKeyBorder = { fg = colors.comment, bg = transparent and "NONE" or colors.bg },
		WhichKeyDesc = { fg = colors.func, bg = transparent and "NONE" or colors.bg },
		WhichKeyGroup = { fg = colors.kw, bg = transparent and "NONE" or colors.bg, gui = "bold" },
		WhichKeyIcon = { fg = colors.func, bg = transparent and "NONE" or colors.bg },
		WhichKeyIconAzure = { fg = colors.kw, bg = transparent and "NONE" or colors.bg },
		WhichKeyIconBlue = { fg = colors.fg, bg = transparent and "NONE" or colors.bg },
		WhichKeyIconCyan = { fg = colors.cursor, bg = transparent and "NONE" or colors.bg },
		WhichKeyIconGreen = { fg = colors.string, bg = transparent and "NONE" or colors.bg },
		WhichKeyIconGrey = { fg = colors.comment, bg = transparent and "NONE" or colors.bg },
		WhichKeyIconOrange = { fg = colors.visual, bg = transparent and "NONE" or colors.bg },
		WhichKeyIconPurple = { fg = colors.const, bg = transparent and "NONE" or colors.bg },
		WhichKeyIconRed = { fg = colors.error, bg = transparent and "NONE" or colors.bg },
		WhichKeyIconYellow = { fg = colors.warn, bg = transparent and "NONE" or colors.bg },
		WhichKeyNormal = { fg = colors.fg, bg = transparent and "NONE" or colors.bg },
		WhichKeySeparator = { fg = colors.comment, bg = transparent and "NONE" or colors.bg },
		WhichKeyTitle = { fg = colors.kw, bg = transparent and "NONE" or colors.bg, gui = "bold" },
		WhichKeyValue = { fg = colors.comment, bg = transparent and "NONE" or colors.bg },
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
