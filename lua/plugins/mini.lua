return {
  {
    'echasnovski/mini.nvim',
    enabled = true,
    config = function()
      local statusline = require('mini.statusline')
      statusline.setup({ use_icons = true })
      statusline.section_location = function()
        return '%2l:%-2v'
      end
      require('mini.ai').setup({ n_lines = 500 })
      require('mini.surround').setup()
      --require('mini.animate').setup()
      require('mini.cursorword').setup()
    end,
  },
}
