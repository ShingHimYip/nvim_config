return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })

      opts.presets.lsp_doc_border = true
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
    },
  },
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    priority = 1200,
    config = function()
      require("incline").setup({
        window = {
          margin = {
            horizontal = 1,
            vertical = 1,
          },
        },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local fileName = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")

          if vim.bo[props.buf].modified then
            fileName = "[+]" .. fileName
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(fileName)

          return { { icon, guifg = color }, { " " }, { fileName } }
        end,
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        mode = "tabs",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },
}
