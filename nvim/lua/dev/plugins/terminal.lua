return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    local term = require 'toggleterm'
    term.setup {
      shell = '/opt/homebrew/bin/fish',
    }

    vim.keymap.set({ 'n', 't' }, '<leader>t', function()
      term.toggle(1, 20, vim.fn.getcwd(), 'horizontal', 'default')
    end, { desc = 'Toggle terminal' })

    vim.keymap.set({ 'n', 't' }, '<leader>vt', function()
      term.toggle(1, 60, vim.fn.getcwd(), 'vertical', 'default')
    end, { desc = 'Toggle vertical terminal' })

    vim.keymap.set({ 'n', 't' }, '<leader>ft', function()
      term.toggle(1, 20, vim.fn.getcwd(), 'float', 'default')
    end, { desc = 'Toggle float terminal' })

    vim.keymap.set({ 'n', 't' }, '<leader>tt', function()
      term.toggle(1, 20, vim.fn.getcwd(), 'tab', 'default')
    end, { desc = 'Toggle tab terminal' })

    vim.api.nvim_create_autocmd('BufEnter', {
      pattern = 'term://*',
      callback = function()
        vim.cmd 'startinsert'
      end,
    })
  end,
}
