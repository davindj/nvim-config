local options = {
  encoding = 'utf8',
  swapfile = false, -- noswapfile unneeded feature for single-user
  clipboard = 'unnamed,unnamedplus', -- copy-paste nvim to system program
  mouse = 'a', -- enable mouse in (A)ll mode. insert, visual, normal, cmd line(?)
  hidden = true, -- enable to edit other file eventho current file has unsaved changes

  timeout = true, -- enable keystroke timeout
  timeoutlen = 2000, -- 2000ms keystroke timeout

  number = true,
  relativenumber = true,
  signcolumn = 'yes', -- sign on left of LoC LSP stuff(git changes, error, warning)
  colorcolumn = '0', -- disable color column (clean code line width)
  cursorline = true, -- enable cursor line
  wrap = false, -- disable wrap text
  scrolloff = 4, -- add padding / lookahead when cursor scrollin

  tabstop = 4, -- Proper tab location
  softtabstop = 4, -- Tab size per <tab>
  expandtab = true, -- replace tab with space
  shiftwidth = 4, -- Tab size indentation nested (should same with tabstop tho)
  smarttab = true, -- frikkin only use shiftwidth :) ts & sts ???
  shiftround = true, -- make > < indent to proper tabstop
  smartindent = true, -- Do smart autoindenting when starting a new line

  hlsearch = false, -- disable highlight search
  ignorecase = true, -- incase-sensitive search
  smartcase = true, -- perform incase.s when l.case search, and case.s when contain u.case
  incsearch = true, -- highlight match pattern on typing search
  inccommand = 'split', -- NVIM preview substitute change on mini window 

  splitbelow = true, -- make split spawn more HUMAN friendly
  splitright = true,

  termguicolors = true, -- enable 24bit-colorscheme PERFECTIONNNN
  lazyredraw = true, -- no re-render while excuting command such as macro
}

vim.cmd 'syntax enable'
vim.cmd 'filetype plugin indent on' -- CHECK what it does
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual=false}' -- highlight on yank

-- Apply Options
for option, value in pairs(options) do
  vim.opt[option] = value
end

