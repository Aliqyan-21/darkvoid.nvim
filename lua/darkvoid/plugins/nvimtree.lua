local M = {}

M.setup = function()
	local colors = require("darkvoid.colors").config.colors

	local highlight_groups = {
		NvimTreeFolderIcon = { fg = colors.identifier, bg = "NONE" },
		NvimTreeFolderName = { fg = colors.func, bg = "NONE" },
		NvimTreeOpenedFolderName = { fg = colors.kw, bg = "NONE" },
		NvimTreeEmptyFolderName = { fg = colors.comment, bg = "NONE" },
		NvimTreeRootFolder = { fg = colors.type, bg = "NONE" },
		NvimTreeSymlink = { fg = colors.string, bg = "NONE" },
		NvimTreeSpecialFile = { fg = colors.operator, bg = "NONE", gui = "bold" },
		NvimTreeWindowPicker = { fg = colors.bg, bg = colors.search_highlight, gui = "bold" },
		NvimTreeLineNr = { fg = colors.line_nr, bg = "NONE" },
		NvimTreeCursorLineNr = { fg = colors.cursor, bg = "NONE", gui = "bold" },
	}

	for group_name, config in pairs(highlight_groups) do
		local cmd = "highlight " .. group_name
		if config.fg then
			cmd = cmd .. " guifg=" .. config.fg
		end
		if config.bg then
			cmd = cmd .. " guibg=" .. config.bg
		end
		if config.gui then
			cmd = cmd .. " gui=" .. config.gui
		end
		vim.cmd(cmd)
	end
end

return M
