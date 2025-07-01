
require("toggleterm").setup({
  -- Terminal size (ignored in float mode)
  size = 13,

  -- Key mapping to toggle terminal
  open_mapping = [[<c-\>]],

  -- Filetypes to shade (empty disables filetype-specific shading)
  shade_filetypes = {},

  -- Enable shading for terminals
  shade_terminals = true,

  -- Shading factor (must be a number, not a string)
  shading_factor = 1,

  -- Start terminal in insert mode
  start_in_insert = true,

  -- Apply open_mapping in insert mode
  insert_mappings = true,

  -- Apply open_mapping in terminal mode
  terminal_mappings = true,

  -- Persist terminal size across sessions
  persist_size = true,

  -- Remember terminal mode (insert/normal) between toggles
  persist_mode = true,

  -- Close terminal window when the process exits
  close_on_exit = true,

  -- Use the default shell
  shell = vim.o.shell,

  -- Terminal direction: 'horizontal', 'vertical', 'tab', or 'float'
  direction = "float",

  -- Floating window options (only used if direction = 'float')
  float_opts = {
    border = "curved",     -- Options: 'single', 'double', 'shadow', 'curved', etc.
    winblend = 5,          -- Transparency level
    width = 150,           -- Optional: set width
    height = 40,           -- Optional: set height
    title_pos = "center",  -- Title position: 'left', 'center', 'right'
  },

  -- Optional: enable winbar with terminal name
  winbar = {
    enabled = false,
    name_formatter = function(term)
      return term.name
    end,
  },
})
