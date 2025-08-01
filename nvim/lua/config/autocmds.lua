-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Close Snacks Explorer when file is opened
vim.api.nvim_create_autocmd("BufLeave", {
  pattern = "*",
  callback = function(ev)
    local buf = ev.buf
    if vim.bo[buf].buftype == "nofile" and vim.bo[buf].filetype == "snacks_picker_list" then
      -- Delay buffer deletion to avoid conflict with snacks.nvim
      vim.defer_fn(function()
        if vim.api.nvim_buf_is_valid(buf) then
          pcall(vim.api.nvim_buf_delete, buf, { force = true })
        end
      end, 50) -- 50ms delay
    end
  end,
})
