return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    local function my_on_attach(bufnr)
      local api = require 'nvim-tree.api'

      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- custom mappings
      vim.keymap.set('n', '<leader>t', api.tree.toggle, { noremap = true, silent = true, desc = '[T]oggles nvim-tree' })
      vim.keymap.set('n', '<leader>f', api.tree.focus, { noremap = true, silent = true, desc = '[F]ocuses nvim-tree' })
    end

    -- pass to setup along with your other options
    require('nvim-tree').setup {
      ---
      on_attach = my_on_attach,
      ---
    }
  end,
}
