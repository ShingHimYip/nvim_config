local buffer = require("cmp_buffer.buffer")
-- add tsserver and setup with typescript.nvim instead of lspconfig
return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    local keymap = vim.keymap -- for conciseness

    -- Iterate through existing keys to find and update the keymaps
    -- for i, keymap in ipairs(keys) do
    --   if keymap[1] == "<leader>cr" then
    --     keys[i] = { "<leader>rn", keymap[2], { desc = "Rename" } } -- Change Rename keymap
    --   elseif keymap[1] == "gy" then
    --     keys[i] = { "gt", keymap[2], { desc = "Goto Type Definition" } } -- Change Go to Type Definition keymap
    --   end
    -- end
    -- unmap all the default keymaps
    keys[#keys + 1] = { "gd", false }
    keys[#keys + 1] = { "gr", false }
    -- keys[#keys + 1] = { "gD", false }
    keys[#keys + 1] = { "gI", false }
    keys[#keys + 1] = { "gy", false }
    keys[#keys + 1] = { "K", false }
    keys[#keys + 1] = { "<c-k>", false }
    keys[#keys + 1] = { "<leader>ca", false }
    keys[#keys + 1] = { "<leader>cA", false }
    keys[#keys + 1] = { "<leader>cr", false }

    require("lazyvim.util").lsp.on_attach(function(_, buffer)
      local opts = { noremap = true, silent = true, buffer = buffer }
      keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts) -- Show LSP methods search results
      -- keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts) -- jump directly to definition
      keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
      keymap.set("n", "gi", "<cmd>Lspsaga finder imp<CR>", opts) -- Search and preview implementation of interfaces
      keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
      keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
      keymap.set("n", "<leader>D", "<cmd>Lspsaga show_workspace_diagnostics<CR>", opts) -- show  diagnostics for line
      keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show diagnostics for cursor
      keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
      keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
      keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
      keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts) -- see outline on right hand side
    end)
  end,
  dependencies = {
    "jose-elias-alvarez/typescript.nvim",
    init = function()
      require("lazyvim.util").lsp.on_attach(function(_, buffer)
        -- vim.keymap.set(
        --   "n",
        --   "<leader>oi",
        --   ":TypescriptOrganizeImports<CR>",
        --   { buffer = buffer, desc = "Organize Imports" }
        -- )
        -- vim.keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>", { desc = "Rename File", buffer = buffer })
        -- vim.keymap.set(
        --   "n",
        --   "<leader>ru",
        --   ":TypescriptRemoveUnused<CR>",
        --   { desc = "Remove unused variables", buffer = buffer }
        -- )
      end)
    end,
  },
  --@class PluginLspOpts
  opts = {
    --@type lspconfig.options
    servers = {
      -- tsserver will be automatically installed with mason and loaded with lspconfig
      tsserver = {
        keys = {
          { "<leader>oi", "<cmd>TypescriptOrganizeImports<CR>", desc = "Organize Imports" },
          { "<leader>rf", "<cmd>TypescriptRenameFile<CR>", desc = "Rename File" },
          { "<leader>ru", "<cmd>TypescriptRemoveUnused<CR>", desc = "Remove unused variables" },
        },
      },
      tailwindcss = {},
    },
    -- you can do any additional lsp server setup here
    -- return true if you don't want this server to be setup with lspconfig
    --@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
    setup = {
      -- example to setup with typescript.nvim
      tsserver = function(_, opts)
        require("typescript").setup({ server = opts })
        return true
      end,

      tailwindcss = function(_, opts)
        local original_on_attach = opts.on_attach
        opts.on_attach = function(client, bufnr)
          -- Call the original on_attach if it exists
          if original_on_attach then
            original_on_attach(client, bufnr)
          end

          -- Add the tailwindcss-colors plugin
          require("tailwindcss-colors").buf_attach(bufnr)
        end
      end,
      -- Specify * to use this function as a fallback for any server
      -- ["*"] = function(server, opts) end,
    },
  },
}
