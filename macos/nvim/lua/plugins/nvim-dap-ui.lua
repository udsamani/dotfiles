return {
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
    },
    config = function()
      require('dapui').setup {

        vim.keymap.set('n', '<Leader>dl', "<cmd>lua require'dap'.step_into()<CR>", { desc = 'Debugger step into' }),
        vim.keymap.set('n', '<Leader>db', "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = 'Debugger toggle breakpoint' }),
        vim.keymap.set('n', '<Leader>dt', '<cmd>lua vim.cmd("RustLsp testables")<CR>', { desc = 'Debuggables' }),
      }
    end,
  },
}
