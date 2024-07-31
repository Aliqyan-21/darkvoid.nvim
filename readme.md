# Darkvoid.nvim

**Darkvoid.nvim** is a visually stunning and customizable colorscheme for Neovim, designed to offer a warm, classic aesthetic with a unique `glow effect`. This colorscheme focuses on highlighting important code elements and provides a monochromatic color palette that enhances readability and reduces eye strain.

## Features

- **Monochromatic Palette**: Emphasizes a warm, classic feeling with carefully selected monochromatic colors.
- **Glow Effect**: Optional glow effect for key syntax elements like functions, keywords, and operators.
- **Customizable**: Easily configure transparency, glow effect, and color settings to suit your preferences.

## Installation

To install `darkvoid.nvim`, you can use your preferred plugin manager. For example, with [packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
use 'aliqyan-21/darkvoid.nvim'
```


To install `darkvoid.nvim`, you can use your preferred plugin manager. For example, with [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
return {'aliqyan-21/darkvoid.nvim'}
```

## Configuration
You can configure darkvoid.nvim by setting up the colorscheme in your way and configuring it like this:

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

## Supported Plugins
Currently, darkvoid.nvim supports basic Neovim syntax highlighting. However, support for popular plugins is still in progress. The following plugins are planned for support:

- [x] nvim-tree: File explorer integration
- [x] treesitter: Enhanced syntax highlighting
- [ ] telescope: Fuzzy finder integration
- [x] gitsigns: Git integration and signs
- [ ] bufferline: buffer tabs
- [ ] lualine: lualine support

... You can update readme to add more famous plugins

I welcome contributions from the community to help integrate support for these plugins. If you are interested in contributing, please refer to the Contributing Guidelines section below.

## Contributing

I encourage contributions to enhance the functionality and compatibility of darkvoid.nvim. To contribute:

- Fork the repository.
- Create a new branch for your feature or bug fix.
- Make your changes and test thoroughly.
- Submit a pull request with a detailed description of your changes.
- Please follow the coding standards and ensure that your contributions adhere to the project's guidelines.

## License

darkvoid.nvim is licensed under the MIT License.
