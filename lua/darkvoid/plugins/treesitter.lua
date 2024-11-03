local M = {}

function M.setup()
	local colors = require("darkvoid.colors").config.colors
	local enabled = require("darkvoid.colors").config.colors.plugins.treesitter

	if not enabled then
		return
	end

	local highlight_groups = {
		-- functions & methods
		["@function"] = { fg = colors.func },
		["@method"] = { fg = colors.func },
		["@function.builtin"] = { fg = colors.func },
		["@function.call"] = { fg = colors.func },

		-- keywords & conditionals
		["@keyword"] = { fg = colors.kw },
		["@keyword.function"] = { fg = colors.kw },
		["@keyword.return"] = { fg = colors.kw },
		["@conditional"] = { fg = colors.kw },
		["@repeat"] = { fg = colors.kw },

		-- constants, strings, & numbers
		["@constant"] = { fg = colors.constant },
		["@constant.builtin"] = { fg = colors.constant },
		["@string"] = { fg = colors.string },
		["@string.regex"] = { fg = colors.string },
		["@string.escape"] = { fg = colors.operator },
		["@number"] = { fg = colors.constant },
		["@boolean"] = { fg = colors.bool },

		-- variables & parameters
		["@variable"] = { fg = colors.identifier },
		["@variable.builtin"] = { fg = colors.identifier },
		["@parameter"] = { fg = colors.identifier },
		["@parameter.reference"] = { fg = colors.identifier },
		["@field"] = { fg = colors.identifier },
		["@property"] = { fg = colors.identifier },

		-- types, enums, & classes
		["@type"] = { fg = colors.type },
		["@type.builtin"] = { fg = colors.type_builtin },
		["@class"] = { fg = colors.type },
		["@enum"] = { fg = colors.type },
		["@namespace"] = { fg = colors.identifier },
		["@struct"] = { fg = colors.type },

		-- modules & attributes
		["@module"] = { fg = colors.identifier },
		["@attribute"] = { fg = colors.identifier },

		-- punctuation & operators
		["@punctuation.delimiter"] = { fg = colors.bracket },
		["@punctuation.bracket"] = { fg = colors.bracket },
		["@punctuation.special"] = { fg = colors.operator },
		["@operator"] = { fg = colors.operator },

		-- comments & annotations
		["@comment"] = { fg = colors.comment },
		["@annotation"] = { fg = colors.preprocessor },

		-- additional 'special' highlight groups
		["@tag"] = { fg = colors.func },
		["@tag.attribute"] = { fg = colors.identifier },
		["@tag.delimiter"] = { fg = colors.bracket },
		["@constructor"] = { fg = colors.operator },
		["@constructor.lua"] = { fg = colors.bracket },
		["@decorator"] = { fg = colors.preprocessor },
	}

	for group_name, config in pairs(highlight_groups) do
		local cmd = "highlight " .. group_name
		cmd = cmd .. " guifg=" .. (config.fg or "NONE")
		cmd = cmd .. " guibg=" .. (config.bg or "NONE")
		vim.cmd(cmd)
	end
end

return M
