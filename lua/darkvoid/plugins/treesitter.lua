local M = {}

function M.setup()
	local colors = require("darkvoid.colors").config.colors
	local enabled = require("darkvoid.colors").config.colors.plugins.treesitter

	if not enabled then
		return
	end

	local highlight_groups = {
		["@function"] = { fg = colors.func },
		["@method"] = { fg = colors.func },
		["@function.builtin"] = { fg = colors.func },
		["@keyword"] = { fg = colors.kw },
		["@keyword.function"] = { fg = colors.kw },
		["@conditional"] = { fg = colors.kw },
		["@repeat"] = { fg = colors.kw },
		["@string"] = { fg = colors.string },
		["@string.regex"] = { fg = colors.string },
		["@variable"] = { fg = colors.identifier },
		["@variable.builtin"] = { fg = colors.identifier },
		["@type"] = { fg = colors.type },
		["@parameter"] = { fg = colors.identifier },
		["@constant"] = { fg = colors.constant },
		["@constant.builtin"] = { fg = colors.constant },
		["@comment"] = { fg = colors.comment, gui = "italic" },
		["@punctuation.delimiter"] = { fg = colors.bracket },
		["@punctuation.bracket"] = { fg = colors.bracket },
		["@operator"] = { fg = colors.operator },
	}

	for group_name, config in pairs(highlight_groups) do
		local cmd = "highlight " .. group_name
		cmd = cmd .. " guifg=" .. (config.fg or "NONE")
		cmd = cmd .. " guibg=" .. (config.bg or "NONE")
		if config.gui then
			cmd = cmd .. " gui=" .. config.gui
		end
		vim.cmd(cmd)
	end
end

return M
