local opt = vim.opt

-- Leader key
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

-- Display
opt.number = true
opt.relativenumber = true
opt.showcmd = true
opt.wrap = false

-- Search & Navigation
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true
opt.wrapscan = true

-- Indentation & Formatting
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.autoindent = true
opt.smartindent = true

-- File Handling
opt.autoread = true
opt.hidden = true
opt.backup = false
opt.swapfile = false
opt.undolevels = 10000

-- Performance & Behavior
opt.updatetime = 250
opt.timeoutlen = 500

-- Clipboard & Mouse
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.mousescroll = "ver:3,hor:6"

-- Scrolling & Windows
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.splitbelow = true
opt.splitright = true

-- Status and command line
opt.laststatus = 3
opt.cmdheight = 1

