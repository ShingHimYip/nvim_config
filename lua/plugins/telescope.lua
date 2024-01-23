return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- disable the keymap to grep files
    { "<leader>/", false, desc = "Grep (root dir)" },
    { "<leader><space>", false, desc = "Find Files (root dir)" },
    { "<leader>s", false, desc = "Registers" },
    { "<leader>sd", false, desc = "Document diagnostics" },
    { "<leader>sD", false, desc = "Workspace diagnostics" },

    --Customise keymap
    {
      ";r",
      function()
        require("telescope.builtin").live_grep({})
      end,
      desc = "Grep (root dir)",
    },
    {
      ";f",
      function()
        require("telescope.builtin").find_files({})
      end,
      desc = "Find Files (root dir)",
    },
    {
      ";j",
      function()
        require("telescope.builtin").registers({
          previewer = false,
          initial_mode = "normal",
        })
      end,
      desc = "Registers",
    },
    {
      ";d",
      function()
        require("telescope.builtin").diagnostics()
      end,
      desc = "Workspace diagnostics",
    },
    {
      ";;",
      function()
        require("telescope.builtin").resume({
          initial_mode = "normal",
        })
      end,
      desc = "Resume",
    },
  },
}
