return {

    {
        'supermaven-inc/supermaven-nvim',
        config = function()
            require('supermaven-nvim').setup {
                keymaps = {
                    accept_suggestion = '<Tab>',
                    clear_suggestion = '<S-Tab>',
                },
            }
        end,
    },
}
