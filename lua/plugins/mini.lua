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
      -- require('mini.animate').setup()
      require('mini.cursorword').setup()
      local hipatterns = require('mini.hipatterns')
      hipatterns.setup({
        highlighters = {
          -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
          -- fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
          -- hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
          -- todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
          -- note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },

          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      })
    end,
  },
}
