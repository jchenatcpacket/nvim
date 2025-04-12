return {
  {
    "karb94/neoscroll.nvim",
    config = function ()
      neoscroll = require('neoscroll')
      neoscroll.setup({
        -- Default easing function used in any animation where
        -- the `easing` argument has not been explicitly supplied
        easing = "quadratic"
      })
      local keymap = {
        -- Use the "sine" easing function
        ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 250; easing = 'sine' }) end;
        ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 250; easing = 'sine' }) end;
        -- Use the "circular" easing function
        -- ["<C-b>"] = function() neoscroll.ctrl_b({ duration = 450; easing = 'circular' }) end;
        -- ["<C-f>"] = function() neoscroll.ctrl_f({ duration = 450; easing = 'circular' }) end;
        -- When no value is passed the `easing` option supplied in `setup()` is used
        -- ["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor=false; duration = 100 }) end;
        -- ["<C-e>"] = function() neoscroll.scroll(0.1, { move_cursor=false; duration = 100 }) end;
      }
      local modes = { 'n', 'v', 'x' }
      for key, func in pairs(keymap) do
          vim.keymap.set(modes, key, func)
      end
    end
  },
  {
    "sphamba/smear-cursor.nvim",
    opts = {    -- Smear cursor when switching buffers or windows.
      smear_between_buffers = true,

      -- Smear cursor when moving within line or to neighbor lines.
      -- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
      smear_between_neighbor_lines = true,

      -- Draw the smear in buffer space instead of screen space when scrolling
      scroll_buffer_space = true,

      -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
      -- Smears will blend better on all backgrounds.
      legacy_computing_symbols_support = false,

      -- Smear cursor in insert mode.
      -- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
      smear_insert_mode = true,},
  }
}