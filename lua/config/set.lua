-- line numbers
vim.opt.nu = true
vim.opt.rnu = true

-- highlight cursorline
vim.opt.cursorline = true

-- tab means two spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- indent when going to new line
vim.opt.smartindent = true

-- don't wrap overflowing text
vim.opt.wrap = false

-- don't create swap files and do not backup, keep everything in undotree
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand("$HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.termguicolors = true

-- stop cursor from reaching very bottom/top of screen
vim.opt.scrolloff = 8

-- highlight searched text
vim.opt.hlsearch = true
-- dynamically highlight partial matchesc
vim.opt.incsearch = true

-- ignore case when searching, when an upper case letter is added to search switch to case sensitive
vim.opt.ignorecase = true
vim.opt.smartcase = true

