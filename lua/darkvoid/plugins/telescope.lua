local M = {}

function M.setup(config)
	local colors = config.colors
	local transparent = config.transparent

	local telescope_highlight_groups = {
		TelescopeNormal = { fg = colors.fg, bg = transparent and "NONE" or colors.bg },
		TelescopeBorder = { fg = colors.border, bg = transparent and "NONE" or colors.bg },
		TelescopePromptNormal = { fg = colors.pmenu_fg, bg = transparent and "NONE" or colors.pmenu_bg },
		TelescopePromptBorder = { fg = colors.border, bg = transparent and "NONE" or colors.pmenu_bg },
		TelescopePromptTitle = { fg = colors.title, bg = transparent and "NONE" or colors.bg, gui = "bold" },
		TelescopePromptCounter = { fg = colors.cursor, bg = transparent and "NONE" or colors.bg },
		TelescopeSelectionCaret = { fg = colors.operator, bg = colors.visual },
		TelescopeSelection = { fg = colors.fg, bg = colors.visual, gui = "bold" },
		TelescopeMatching = { fg = colors.operator, bg = transparent and "NONE" or colors.bg, gui = "bold" },
	}

	for group_name, config in pairs(telescope_highlight_groups) do
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
