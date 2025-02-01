return {
  'AckslD/nvim-neoclip.lua',
  dependencies = {
    { 'kkharji/sqlite.lua', module = 'sqlite' },
    -- you'll need at least one of these
    { 'nvim-telescope/telescope.nvim' },
    -- {'ibhagwan/fzf-lua'},
  },
  config = function()
    require('neoclip').setup({
      history = 200,
      enable_persistent_history = true,
      preview = true,
      default_register = '"',
      default_register_macros = 'q',
      enable_macro_history = true,
      initial_mode = 'insert',
      on_select = {
        move_to_front = true,
        close_telescope = true,
      },
      on_paste = {
        set_reg = true,
        move_to_front = true,
        close_telescope = true,
      },
      on_replay = {
        set_reg = true,
        move_to_front = true,
        close_telescope = true,
      },
      on_custom_action = {
        close_telescope = true,
      },
    })
  end,
}
