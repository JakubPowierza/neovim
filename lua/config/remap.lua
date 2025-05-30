-- LSP bindings
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Goto References" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Goto Next Diagnostic" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Goto Prev Diagnostic" })
-- vim.keymap.set("n", "<leader>tc", TODO, { desc = "Transform Code" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format Buffer" })
-- vim.keymap.set("n", "<leader>f", "<cmd>FormatCode<cr>", { desc = "Format Buffer" })

-- Telescope bindings
local currDir = function()
  if (vim.api.nvim_get_option_value("filetype", {}) == "netrw") then
    return vim.fn.expand("%:p")
  else
    return vim.fn.expand("%:p:h")
  end
end
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ss", telescope.live_grep, { desc = "Telescope Live Grep (root)" })
vim.keymap.set("n", "<leader>sf", telescope.find_files, { desc = "Telescope Find Files" })
vim.keymap.set("n", "<leader>sb", telescope.buffers, { desc = "Telescope Buffers" })
vim.keymap.set("n", "<leader>sh", telescope.help_tags, { desc = "Telescope Search Help" })
vim.keymap.set("n", "<leader>sg", function() telescope.live_grep({ cwd = currDir() }) end,
  { desc = "Telescope Live Grep (curr dir)" })
vim.keymap.set("n", "<leader>sG", function() telescope.grep_string({ search = vim.fn.expand("<cword>") }) end,
  { desc = "Telescope Current Word" })

-- Undotree bindings
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeShow)

-- Misc bindings
vim.keymap.set("n", "<leader><leader>", "<cmd>nohlsearch<cr>") -- Get rid of highlights
vim.keymap.set("i", "<C-c>", "<Esc>")                          -- Make ctrl-c same as Esc
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")                   -- Move highlight down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")                   -- Move highlight up
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>e", "<cmd>Explore<cr>")

-- Quickfix list navigation
vim.keymap.set("n", "<C-j>", "<cmd>cnext<cr>")
vim.keymap.set("n", "<C-k>", "<cmd>cprevious<cr>")

-- Harpoon
local harpoon = require("harpoon")
-- REQUIRED
harpoon:setup()
-- REQUIRED
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
