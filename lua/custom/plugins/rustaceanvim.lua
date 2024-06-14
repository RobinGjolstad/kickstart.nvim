-- Configuration can be found at:
-- https://github.com/mrcjkb/rustaceanvim
vim.g.rustaceanvim = {
  tools = {
    float_win_config = {
      opts = {
        border = 'soft',
      },
    },
  },
  server = {
    default_settings = {
      ['rust-analyzer'] = {
        checkOnSave = true,
        check = {
          enable = true,
          command = 'clippy',
          features = 'all',
        },
      },
    },
  },
}

return {
  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
}
