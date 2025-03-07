return {
  'rmagatti/auto-session',
  config = function()
    local auto_session = require('auto-session')

    auto_session.setup({
      auto_restore_enabled = false,
      auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
      auto_session_suppress_dirs = { '~/', '~/Dev/', '~/Downloads', '~/Documents', '~/Desktop/' },
    })

    local keymap = vim.keymap

    keymap.set('n', '<leader>wr', '<cmd>SessionRestore<CR>', { desc = 'Restore session for cwd' }) -- restore last workspace session for current directory
    keymap.set('n', '<leader>ww', '<cmd>SessionSave<CR>', { desc = 'Save session for auto session root dir' }) -- save workspace session for current working directory
    keymap.set("n", "<leader>wd", "<cmd>SessionDelete<CR>", { desc = "Delete session" })
    keymap.set("n", "<leader>wf", "<cmd>SessionSearch<CR>", { desc = "Search sessions" })
  end,
}
