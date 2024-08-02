local config = require("darkvoid.colors").config
local colors = config.colors

local common_bg = config.transparent and "NONE" or colors.bg
local glow_fg = config.glow and "bold"

local theme = {
  normal = {
    a = {
      bg = config.transparent and "NONE" or colors.bool,
      fg = config.transparent and colors.added or colors.bg,
    },
    b = { bg = common_bg, fg = colors.bool },
    c = { bg = colors.line_nr, fg = colors.bracket },
    x = { bg = colors.line_nr, fg = colors.bracket, gui = glow_fg },
  },
  insert = {
    a = { bg = common_bg, fg = colors.search_highlight, gui = glow_fg },
    b = { bg = colors.bg, fg = colors.type },
    c = { bg = colors.line_nr, fg = colors.bracket, gui = glow_fg },
    x = { bg = colors.line_nr, fg = colors.bool },
  },
  visual = {
    a = { bg = common_bg, fg = colors.title, gui = glow_fg },
    b = { bg = common_bg, fg = colors.type },
    c = { bg = colors.line_nr, fg = colors.bracket, gui = glow_fg },
    x = { bg = colors.line_nr, fg = colors.bracket },
  },

  inactive = {
    a = { bg = colors.eob, fg = colors.string, gui = glow_fg },
    b = { bg = colors.eob, fg = colors.string },
    c = { bg = colors.eob, fg = colors.string }
  }
}

theme.command = theme.visual
theme.replace = theme.visual
theme.terminal = theme.normal

return theme
