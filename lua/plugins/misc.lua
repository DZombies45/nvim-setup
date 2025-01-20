-- Standalone plugins with less than 10 lines of config go here
return {
    {
-- Hints keybinds
        'folke/which-key.nvim',
    },
    {
-- Autoclose parentheses, brackets, quotes, etc.
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        opts = {},
        config = function()
        require('nvim-autopairs').setup {}
-- If you want to automatically add `(` after selecting a function or method
        local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
        local cmp = require 'cmp'
        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
        end,
    },
    {
-- Highlight todo, notes, etc in comments
        'folke/todo-comments.nvim',
        event = 'VimEnter',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        opts = {
            signs = false
        }
    },
    {
-- High-performance color highlighter
        'norcalli/nvim-colorizer.lua',
        config = function()
        require('colorizer').setup()
        end,
    },
}