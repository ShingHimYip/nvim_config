return {
  "ThePrimeagen/harpoon",
  lazy = false,
  branch = "harpoon2",
  keys = {
    {
      "<leader>a",
      function()
        require("harpoon"):list():append()
      end,
    },
    {
      ";h",
      function()
        require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
      end,
    },
    {
      ";1",
      function()
        require("harpoon"):list():select(1)
      end,
    },
    {
      ";2",
      function()
        require("harpoon"):list():select(2)
      end,
    },
    {
      ";3",
      function()
        require("harpoon"):list():select(3)
      end,
    },
    {
      ";4",
      function()
        require("harpoon"):list():select(4)
      end,
    },
  },
  dependencies = { "nvim-lua/plenary.nvim" },
}
