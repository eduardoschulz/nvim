require("bufferline").setup({
  options = {
    mode = "buffers",
    separator_style = "thin",
    show_buffer_close_icons = true,
    show_close_icon = false,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count)
      return "(" .. count .. ")"
    end,
  },
})
