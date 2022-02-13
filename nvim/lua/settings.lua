-- reload config when this file changes
vim.cmd [[
  augroup Packer
    autocmd!
    autocmd BufWritePost settings.lua source <afile>
  augroup end
]]

-- ----------------------------------------------------------------------------
-- UI
-- ----------------------------------------------------------------------------
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'number'
vim.opt.colorcolumn = '80'
vim.opt.splitright = true
vim.opt.hidden = true
vim.lazyredraw = true
vim.opt.synmaxcol = 240
vim.opt.termguicolors = true
vim.cmd [[colorscheme moonfly]]
vim.g.moonflyItalics = 0
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.updatetime = 100
vim.diagnostic.config {
  virtual_text = false,
}
-- show diagnostics in hover window on cursor hold (see lspconfig wiki)
-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
vim.cmd [[
  autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})
]]

-- ----------------------------------------------------------------------------
-- System integration
-- ----------------------------------------------------------------------------
vim.opt.mouse = 'a' -- enable mouse
vim.opt.clipboard = 'unnamedplus' -- use system clipboard
vim.opt.autoread = true
vim.opt.swapfile = false -- disable swapfile
vim.opt.undofile = true -- save file history across sessions
vim.opt.undodir = vim.env.HOME .. '/.cache/nvim' -- set directory for the undo files
vim.cmd [[colorscheme moonfly]]

-- ----------------------------------------------------------------------------
-- Identation
-- ----------------------------------------------------------------------------
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 0 -- value of tabstop
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.linebreak = true

-- 2 spaces for selected filetypes
-- vim.cmd [[
--   autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=2
-- ]]

-- ----------------------------------------------------------------------------
-- Mappings
-- ----------------------------------------------------------------------------
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>q', '<cmd>q<cr>', {})
-- vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', {})
vim.keymap.set({ 'n', 'v' }, 'H', '^', {})
vim.keymap.set({ 'n', 'v' }, 'L', '$', {})
vim.keymap.set('n', 'n', 'nzz', {})
vim.keymap.set('n', 'N', 'Nzz', {})
vim.keymap.set('n', '*', '*zz', {})
vim.keymap.set('n', '#', '#zz', {})
vim.keymap.set('n', 'g*', 'g*zz', {})
vim.keymap.set('n', 'g#', 'g#zz', {})
vim.keymap.set('n', '?', '?\\M', {})
vim.keymap.set('n', '/', '/\\M', {})
vim.keymap.set('n', '<leader>f', require('telescope.builtin').find_files, {})
vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers, {})
vim.keymap.set('n', '<leader>g', require('telescope.builtin').live_grep, {})
vim.keymap.set('n', '<leader>s', require('telescope.builtin').lsp_document_symbols, {})
vim.keymap.set('n', '<leader>t', require('telescope.builtin').treesitter, {})
vim.keymap.set({ 'n', 'v' }, '<leader>w', require('hop').hint_words, {})
vim.keymap.set({ 'n', 'v' }, '<leader>l', require('hop').hint_lines, {})
vim.keymap.set({ 'n', 'v' }, '<leader><leader>', require('hop').hint_char2, {})
vim.keymap.set('n', '<leader><backspace>', '<c-^>', {})

vim.cmd [[
  autocmd Filetype markdown lua vim.keymap.set('n', '<leader>p', ':Glow<cr>', { buffer=0 })
]]

-- ----------------------------------------------------------------------------
-- Autocompletion
-- ----------------------------------------------------------------------------
vim.opt.completeopt = 'menuone,noselect'
vim.opt.shortmess:append 'c'

-- ----------------------------------------------------------------------------
-- Auto commands
-- ----------------------------------------------------------------------------

-- remove whitespace on save
vim.cmd [[au BufWritePre * :%s/\s\+$//e]]

-- don't auto commenting new lines
vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]],
  false
)

-----------------------------------------------------------
-- Disable builtin plugins
-----------------------------------------------------------
local disabled_built_ins = {
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
  'gzip',
  'zip',
  'zipPlugin',
  'tar',
  'tarPlugin',
  'getscript',
  'getscriptPlugin',
  'vimball',
  'vimballPlugin',
  '2html_plugin',
  'logipat',
  'rrhelper',
  'spellfile_plugin',
  'matchit',
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g['loaded_' .. plugin] = 1
end
