-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Directly create an autocommand group for setting file format
local setFileFormatGroup = vim.api.nvim_create_augroup("SetFileFormat", { clear = true })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = setFileFormatGroup,
  callback = function()
    local path = vim.fn.expand("%:p") -- Get the full path of the current file
    local target_directory = "C:\\Users\\SHY01\\code\\WebRTC\\ipath\\webrtc-infrastructure"

    -- Check if the current file's path starts with the target directory path
    if string.sub(path, 1, string.len(target_directory)) == target_directory then
      vim.opt_local.fileformats = "unix"
      print("I will save as unix format")
    end
  end,
})
