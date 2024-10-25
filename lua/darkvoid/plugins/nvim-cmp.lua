local M = {}

M.setup = function(config)
	local colors = require("darkvoid.colors").config.colors
	local enabled = require("darkvoid.colors").config.colors.plugins.nvim_cmp

	if not enabled then
		return
	end

	local highlight_groups = {
		CmpItemAbbr = { fg = colors.fg, bg = config.transparent and "NONE" },
		CmpItemAbbrMatch = { fg = colors.cursor, bg = config.transparent and "NONE", gui = "bold" },
		CmpItemAbbrDeprecated = {
			fg = colors.comment,
			bg = config.transparent and "NONE",
			gui = "italic",
		},
		CmpItemAbbrMatchFuzzy = { fg = colors.visual, bg = config.transparent and "NONE", gui = "bold" },
		CmpItemMenu = { fg = colors.comment, bg = config.transparent and "NONE" },
	}

	local kinds = {
		"Text",
		"Method",
		"Function",
		"Constructor",
		"Field",
		"Variable",
		"Class",
		"Interface",
		"Module",
		"Property",
		"Unit",
		"Value",
		"Enum",
		"Keyword",
		"Snippet",
		"Color",
		"File",
		"Reference",
		"Folder",
		"EnumMember",
		"Constant",
		"Struct",
		"Event",
		"Operator",
		"TypeParameter",
	}

	for _, kind in ipairs(kinds) do
		highlight_groups["CmpItemKind" .. kind] = { fg = colors.kw }
	end

	for group_name, conf in pairs(highlight_groups) do
		local cmd = "highlight " .. group_name
		if conf.fg then
			cmd = cmd .. " guifg=" .. conf.fg
		end
		if conf.bg then
			cmd = cmd .. " guibg=" .. conf.bg
		end
		if conf.gui then
			cmd = cmd .. " gui=" .. conf.gui
		end
		vim.cmd(cmd)
	end
end

return M
