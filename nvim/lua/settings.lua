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
vim.opt.laststatus = 3
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'number'
vim.opt.colorcolumn = '0'
vim.opt.splitright = true
vim.opt.hidden = true
-- vim.lazyredraw = true
vim.opt.synmaxcol = 500
vim.opt.termguicolors = true
vim.g.moonflyItalics = 0
vim.opt.incsearch = true
-- vim.opt.ignorecase = true
-- vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.updatetime = 100
vim.diagnostic.config {
  virtual_text = false,
  underline = true,
}
vim.cmd [[colorscheme moonfly]]
-- vim.cmd [[colorscheme catppuccin]]
-- TODO: do something with autogroups
-- vim.cmd [[au ColorScheme PaperColor hi Normal        guibg=None]]
-- vim.cmd [[au ColorScheme PaperColor hi NonText       guibg=None]]
-- vim.cmd [[au ColorScheme PaperColor hi LineNr        guibg=None]]
-- vim.cmd [[au ColorScheme PaperColor hi WinSeparator  guibg=None]]
-- vim.cmd [[colorscheme PaperColor]]
-- vim.cmd [[set background=light]]
vim.cmd [[hi NvimTreeCursorLine guifg=fg guibg=red]]

-- ----------------------------------------------------------------------------
-- System integration
-- ----------------------------------------------------------------------------
vim.opt.mouse = 'a' -- enable mouse
vim.opt.clipboard = 'unnamedplus' -- use system clipboard
vim.opt.autoread = true
vim.opt.swapfile = false -- disable swapfile
vim.opt.undofile = true -- save file history across sessions
vim.opt.undodir = vim.env.HOME .. '/.cache/nvim' -- set directory for the undo files
vim.opt.backupcopy = 'no'

-- ----------------------------------------------------------------------------
-- Identation
-- ----------------------------------------------------------------------------
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.linebreak = true

-- ----------------------------------------------------------------------------
-- Mappings
-- ----------------------------------------------------------------------------
vim.g.mapleader = ' '
vim.keymap.set('i', 'jk', '<esc>', {})
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
-- vim.keymap.set('n', '<leader>t', require('telescope.builtin').treesitter, {})
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set({ 'n', 'v' }, '<leader>w', require('hop').hint_words, {})
vim.keymap.set({ 'n', 'v' }, '<leader>l', require('hop').hint_lines, {})
vim.keymap.set({ 'n', 'v' }, '<leader><leader>', require('hop').hint_char2, {})
vim.keymap.set('n', '<leader><backspace>', '<c-^>', {})
vim.keymap.set('n', '<c-j>', '<c-e>', {})
vim.keymap.set('n', '<c-k>', '<c-y>', {})
-- vim.keymap.set('i', '<c-n>', '<C-\\><C-O>:setl fo+=r<CR><CR><C-\\><C-O>:setl fo-=r<CR>')
vim.keymap.set('n', '<leader>t', '<cmd>NvimTreeToggle<cr>', {})

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

-- identify Astro.js files (remove when nvim adds native support)
vim.cmd [[ au! BufRead,BufNewFile *.astro set filetype=astro ]]

-- remove whitespace on save
vim.cmd [[au BufWritePre * :%s/\s\+$//e]]

-- don't auto commenting new lines
-- vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

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
