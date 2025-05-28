return {
    {
        'olimorris/codecompanion.nvim',
        opts = {},
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
        },
        config = function()
            require('codecompanion').setup {
                prompt_library = {
                    ['docs'] = {
                        strategy = 'chat',
                        description = 'Write documentation for the selected code',
                        prompts = {
                            {
                                role = 'user',
                                content = 'Help write detailed documentation',
                            },
                        },
                    },
                },
            }
        end,
    },
}
