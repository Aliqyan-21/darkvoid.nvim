# Configuration

You can configure **darkvoid.nvim** by setting up the colorscheme in your way and configuring it like this:

```
require('darkvoid').setup({
    transparent = false,  -- Set to true for a transparent background
    glow = false,         -- Set to true to enable glow effect
    colors = {
        fg = "#C0C0C0",
        bg = "#1C1C1C",
        cursor = "#FFFF00",
        line_nr = "#404040",
        visual = "#303030",
        comment = "#585858",
        string = "#D1D1D1",
        func = "#E1E1E1",
        kw = "#F1F1F1",
        identifier = "#B1B1B1",
        type = "#A1A1A1",
        search_highlight = "#1bfd9c",
        operator = "#1bfd9c",
        bracket = "#E6E6E6",
    }
})

```
