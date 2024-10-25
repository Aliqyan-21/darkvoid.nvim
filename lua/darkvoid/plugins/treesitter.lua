local M = {}

function M.setup()
	local colors = require("darkvoid.colors").config.colors

	local highlight_groups = {
		-- Functions
		["@function"] = { fg = colors.func, bg = "NONE" },
		["@method"] = { fg = colors.func, bg = "NONE" },
		["@function.builtin"] = { fg = colors.func, bg = "NONE" },
		["@function.macro"] = { fg = colors.func, bg = "NONE" },

		-- Keywords
		["@keyword"] = { fg = colors.kw, bg = "NONE" },
		["@keyword.function"] = { fg = colors.kw, bg = "NONE" },
		["@conditional"] = { fg = colors.kw, bg = "NONE" },
		["@repeat"] = { fg = colors.kw, bg = "NONE" },
		["@label"] = { fg = colors.kw, bg = "NONE" },

		-- Strings
		["@string"] = { fg = colors.string, bg = "NONE" },
		["@string.regex"] = { fg = colors.string, bg = "NONE" },
		["@string.escape"] = { fg = colors.string, bg = "NONE" },

		-- Variables
		["@variable"] = { fg = colors.identifier, bg = "NONE" },
		["@variable.builtin"] = { fg = colors.identifier, bg = "NONE" },

		-- Types
		["@type"] = { fg = colors.type, bg = "NONE" },
		["@type.builtin"] = { fg = colors.type, bg = "NONE" },
		["@parameter"] = { fg = colors.identifier, bg = "NONE" },
		["@parameter.reference"] = { fg = colors.identifier, bg = "NONE" },

		-- Constants
		["@constant"] = { fg = colors.constant, bg = "NONE" },
		["@constant.builtin"] = { fg = colors.constant, bg = "NONE" },
		["@constant.macro"] = { fg = colors.constant, bg = "NONE" },

		-- Comments
		["@comment"] = { fg = colors.comment, bg = "NONE", gui = "italic" },

		-- Punctuation
		["@punctuation.delimiter"] = { fg = colors.bracket, bg = "NONE" },
		["@punctuation.bracket"] = { fg = colors.bracket, bg = "NONE" },
		["@punctuation.special"] = { fg = colors.bracket, bg = "NONE" },

		-- Operators
		["@operator"] = { fg = colors.operator, bg = "NONE" },

		-- Others
		["@annotation"] = { fg = colors.preprocessor, bg = "NONE" },
		["@attribute"] = { fg = colors.identifier, bg = "NONE" },
		["@boolean"] = { fg = colors.bool, bg = "NONE" },
		["@tag"] = { fg = colors.func, bg = "NONE" },
		["@tag.delimiter"] = { fg = colors.bracket, bg = "NONE" },
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
