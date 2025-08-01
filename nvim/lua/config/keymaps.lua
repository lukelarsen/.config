-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- ESC
vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true, desc = "Esc" })

-- Splits
vim.keymap.set("n", "<leader>sv", ":vsplit<ENTER>", { noremap = true, silent = true, desc = "Split Vertical" })
vim.keymap.set("n", "<leader>sh", ":split<ENTER>", { noremap = true, silent = true, desc = "Split Horizontal" })

-- Tabs
vim.keymap.set("n", "<leader><tab>h", ":tabprev<ENTER>", { noremap = true, silent = true, desc = "Tab Prev" })
vim.keymap.set("n", "<leader><tab>l", ":tabnext<ENTER>", { noremap = true, silent = true, desc = "Tab Next" })

-- Snacks
local function get_monorepo_root()
  return vim.fs.find({ ".monorepo-root", ".git" }, { upward = true, type = "directory", limit = 1 })[1]
      and vim.fs.dirname(vim.fs.find({ ".monorepo-root", ".git" }, { upward = true, type = "directory", limit = 1 })[1])
    or vim.fn.getcwd()
end

vim.keymap.set("n", "<leader><space>", function()
  vim.fn.chdir(get_monorepo_root()) -- Set cwd to monorepo root
  require("snacks").picker.files() -- Launch files picker
end, { desc = "Smart Find Files (Monorepo Root)" })

vim.keymap.set("n", "<leader>ff", function()
  vim.fn.chdir(get_monorepo_root()) -- Set cwd to monorepo root
  require("snacks").picker.files() -- Launch files picker
end, { desc = "Smart Find Files (Monorepo Root)" })

vim.keymap.set("n", "<leader>e", function()
  vim.fn.chdir(get_monorepo_root()) -- Set cwd to monorepo root
  require("snacks").explorer() -- Launch explorer
end, { desc = "File Explorer (Monorepo Root)" })
