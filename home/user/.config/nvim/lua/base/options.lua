local opt = vim.opt



opt.ruler = true
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

opt.number = true
opt.relativenumber = true


opt.clipboard:append { 'unnamed' }
opt.clipboard:append { 'unnamedplus' }

opt.shortmess:append { s = true, I = true}  -- disable startup message

opt.shell = 'zsh'

opt.ttimeoutlen = 50
opt.timeoutlen = 500

vim.cmd([[
    filetype plugin indent on
]])

vim.cmd([[
    syntax enable
]])

opt.compatible = false

opt.hidden = true

opt.expandtab = true
opt.smarttab = true
opt.tabstop = 4


opt.cursorline = true
opt.softtabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
opt.smartindent = true
opt.wrap = false

opt.ttyfast = true
opt.autoread = true


opt.errorbells = false
opt.visualbell = false
opt.showcmd = true
opt.showtabline = 2

opt.ignorecase = true
opt.smartcase = true -- if search line hasn`t Upper case chars - ignore case search, else case-sensivity search
opt.incsearch = true

opt.mousehide = true
opt.mouse = 'a'

opt.colorcolumn = '81'
opt.scrolloff = 7


opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#464e60 gui=nocombine]]

opt.background = 'dark'

opt.backup = true
opt.swapfile = false
opt.undofile = true
opt.history = 1000
opt.undoreload = 1000

local prefix = vim.fn.expand("~/.local/state/nvim")

opt.undodir = { prefix .. "/undo//" }
opt.backupdir = { prefix .. "/backup//" }
opt.directory = { prefix .. "/swap//" }


local function makeDirIfNoExists(path)
    local path = path["_value"]
    if (vim.fn.isdirectory(path) == 0) then
        vim.fn.mkdir(path, "p")
    end
end

-- make this dirs if no exists previously
makeDirIfNoExists(opt.undodir)
makeDirIfNoExists(opt.backupdir)
makeDirIfNoExists(opt.directory)

opt.ffs = 'unix,mac'

opt.path:append { '**' } -- Finding files - Search down into subfolders


vim.cmd([[
    let &t_SI.="\e[5 q"
    let &t_SR.="\e[3 q"
    let &t_EI.="\e[1 q"
]])

-- SI - режим вставки
-- SR - режим замены
-- EI - нормальный режим


vim.g.netrw_banner = 0 -- hide banner
vim.g.highlighturl_enabled = true -- highlight URLs by default


-- Highlight yanked text for a while
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- dont auto commenting new lines
vim.api.nvim_create_autocmd("BufEnter", {pattern = "*", command = [[set fo-=c fo-=r fo-=o]]})

vim.cmd.highlight({ "DiagnosticError", "guifg=Grey" })
vim.cmd.highlight({ "DiagnosticWarn", "guifg=Grey" })
vim.cmd.highlight({ "DiagnosticInfo", "guifg=Grey" })
vim.cmd.highlight({ "DiagnosticHint", "guifg=Grey" })

-- Russian commands
opt.langmap = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz'