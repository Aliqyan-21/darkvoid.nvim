local M = {}

function M.setup(colors)
	local enabled = require("darkvoid.colors").config.colors.plugins.oil

	if not enabled then
		return
	end

	-- let's get oily
	local oil_highlight_groups = {
		OilDir = { fg = colors.identifier, bg = "NONE" },
		OilDirIcon = { fg = colors.func, bg = "NONE" },
		OilSocket = { fg = colors.operator, bg = "NONE" },
		OilLink = { fg = colors.string, bg = "NONE" },
		OilLinkTarget = { fg = colors.kw, bg = "NONE" },
		OilFile = { fg = colors.constant, bg = "NONE" },
		OilCreate = { fg = colors.func, bg = "NONE" },
		OilDelete = { fg = colors.error, bg = "NONE" },
		OilMove = { fg = colors.kw, bg = "NONE" },
		OilCopy = { fg = colors.string, bg = "NONE" },
		OilChange = { fg = colors.changed, bg = "NONE" },
		OilRestore = { fg = colors.info, bg = "NONE" },
		OilPurge = { fg = colors.error, bg = "NONE" },
		OilTrash = { fg = colors.warning, bg = "NONE" },
		OilTrashSourcePath = { fg = colors.comment, bg = "NONE" },
	}

	for group_name, config in pairs(oil_highlight_groups) do
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
