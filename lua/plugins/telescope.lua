return {
  -- Telescope Plugin
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local builtin = require("telescope.builtin")
      local function telescope_buffer_dir()
        return vim.fn.expand("%:p:h")
      end

      -- Load Telescope extensions
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("file_browser")

      local fb_actions = require("telescope").extensions.file_browser.actions

      telescope.setup({
        defaults = {
          file_ignore_patterns = {
            ".git/",
            "^./.git/",
            "%.svg",
            "node_modules/*",
            "node_modules",
            "^node_modules/",
            "venv",
            ".venv",
            "__pycache__",
          },
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous, -- move to prev result
              ["<C-j>"] = actions.move_selection_next, -- move to next result
            },
            n = {
              ["<C-c>"] = actions.close,

              -- file browser remap
              ["-"] = fb_actions.goto_parent_dir,
            },
          },
        },
      })

      -- Your key mappings for Telescope commands
      vim.keymap.set("n", ";f", function()
        builtin.find_files({})
      end)
      vim.keymap.set("n", ";r", function()
        builtin.live_grep({})
      end)
      vim.keymap.set("n", ";b", function()
        builtin.buffers({
          previewer = false,
          initial_mode = "normal",
        })
      end)
      vim.keymap.set("n", "<leader>g", function()
        builtin.help_tags()
      end)
      vim.keymap.set("n", ";d", function()
        builtin.diagnostics()
      end)
      vim.keymap.set("n", ";;", function()
        builtin.resume()
      end)

      vim.keymap.set("n", ";gfs", builtin.git_files, {})
      vim.keymap.set("n", ";gc", builtin.git_commits, {}) -- list all git commits (use <cr> to checkout) ["gc" for git commits]
      vim.keymap.set("n", ";gfc", builtin.git_bcommits, {}) -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
      vim.keymap.set("n", ";gb", builtin.git_branches, {}) -- list git branches (use <cr> to checkout) ["gb" for git branch]
      vim.keymap.set("n", ";gs", builtin.git_status, {}) -- list current changes per file with diff preview ["gs" for git status]

      vim.keymap.set("n", ";e", function()
        telescope.extensions.file_browser.file_browser({
          path = "%:p:h",
          cwd = telescope_buffer_dir(),
          respect_gitignore = false,
          hidden = true,
          grouped = true,
          previewer = false,
          initial_mode = "normal",
        })
      end)
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },
}
