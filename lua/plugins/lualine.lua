local modified_file_indicator = {
  function()
    local bufname = vim.api.nvim_buf_get_name(0)
    local indicator = ""
    -- Add indicator if the file is modified
    --
    if vim.bo.modified then
      indicator = "[+]"
    end

    return indicator
  end,
  color = require("lazyvim.util").ui.fg("Special"),
  separator = "",
}

local file_name = {
  function()
    local bufname = vim.api.nvim_buf_get_name(0)
    local fileName = vim.fn.fnamemodify(bufname, ":t")

    return fileName
  end,
  separator = "",
}

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    sections = {
      lualine_y = {
        { "progress", separator = " ", padding = { left = 1, right = 0 } },
        { "location", padding = { left = 0, right = 1 } },
        { "filetype", icon_only = true, separator = "" },
        modified_file_indicator,
        file_name,
      },
    },
  },
}
