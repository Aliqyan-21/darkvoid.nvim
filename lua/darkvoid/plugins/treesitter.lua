local M = {}

function M.setup()
	local colors = require("darkvoid.colors").config.colors

	local highlight_groups = {
		-- Functions
		TSFunction = { fg = colors.func, bg = "NONE" },
		TSMethod = { fg = colors.func, bg = "NONE" },
		TSFuncBuiltin = { fg = colors.func, bg = "NONE" },
		TSFuncMacro = { fg = colors.func, bg = "NONE" },

		-- Keywords
		TSKeyword = { fg = colors.kw, bg = "NONE" },
		TSKeywordFunction = { fg = colors.kw, bg = "NONE" },
		TSConditional = { fg = colors.kw, bg = "NONE" },
		TSRepeat = { fg = colors.kw, bg = "NONE" },
		TSLabel = { fg = colors.kw, bg = "NONE" },

		-- Strings
		TSString = { fg = colors.string, bg = "NONE" },
		TSStringRegex = { fg = colors.string, bg = "NONE" },
		TSStringEscape = { fg = colors.string, bg = "NONE" },

		-- Variables
		TSVariable = { fg = colors.identifier, bg = "NONE" },
		TSVariableBuiltin = { fg = colors.identifier, bg = "NONE" },

		-- Types
		TSType = { fg = colors.type, bg = "NONE" },
		TSTypeBuiltin = { fg = colors.type, bg = "NONE" },
		TSParameter = { fg = colors.identifier, bg = "NONE" },
		TSParameterReference = { fg = colors.identifier, bg = "NONE" },

		-- Constants
		TSConstant = { fg = colors.constant, bg = "NONE" },
		TSConstBuiltin = { fg = colors.constant, bg = "NONE" },
		TSConstMacro = { fg = colors.constant, bg = "NONE" },

		-- Comments
		TSComment = { fg = colors.comment, bg = "NONE", gui = "italic" },

		-- Punctuation
		TSPunctuationDelimiter = { fg = colors.bracket, bg = "NONE" },
		TSPunctuationBracket = { fg = colors.bracket, bg = "NONE" },
		TSPunctuationSpecial = { fg = colors.bracket, bg = "NONE" },

		-- Operators
		TSOperator = { fg = colors.operator, bg = "NONE" },

		-- Others
		TSAnnotation = { fg = colors.preprocessor, bg = "NONE" },
		TSAttribute = { fg = colors.identifier, bg = "NONE" },
		TSBoolean = { fg = colors.bool, bg = "NONE" },
		TSTag = { fg = colors.func, bg = "NONE" },
		TSTagDelimiter = { fg = colors.bracket, bg = "NONE" },
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
