-- add tsserver and setup with typescript.nvim instead of lspconfig
return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()

    -- Iterate through existing keys to find and update the keymaps
    for i, keymap in ipairs(keys) do
      if keymap[1] == "<leader>cr" then
        keys[i] = { "<leader>rn", keymap[2], { desc = "Rename" } } -- Change Rename keymap
      elseif keymap[1] == "gy" then
        keys[i] = { "gt", keymap[2], { desc = "Goto Type Definition" } } -- Change Go to Type Definition keymap
      end
    end
    keys[#keys + 1] = { "cr", false }
    keys[#keys + 1] = { "gy", false }
  end,
  dependencies = {
    "jose-elias-alvarez/typescript.nvim",
    init = function()
      require("lazyvim.util").lsp.on_attach(function(_, buffer)
        vim.keymap.set(
          "n",
          "<leader>oi",
          ":TypescriptOrganizeImports<CR>",
          { buffer = buffer, desc = "Organize Imports" }
        )
        vim.keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>", { desc = "Rename File", buffer = buffer })
        vim.keymap.set(
          "n",
          "<leader>ru",
          ":TypescriptRemoveUnused<CR>",
          { desc = "Remove unused variables", buffer = buffer }
        )
      end)
    end,
  },
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      -- tsserver will be automatically installed with mason and loaded with lspconfig
      tsserver = {},
    },
    -- you can do any additional lsp server setup here
    -- return true if you don't want this server to be setup with lspconfig
    ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
    setup = {
      -- example to setup with typescript.nvim
      tsserver = function(_, opts)
        require("typescript").setup({ server = opts })
        return true
      end,
      -- Specify * to use this function as a fallback for any server
      -- ["*"] = function(server, opts) end,
    },
  },
}
