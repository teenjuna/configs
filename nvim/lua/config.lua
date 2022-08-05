-------------------------------------------------------------------------------
-- UI
-------------------------------------------------------------------------------
vim.opt.number = true
vim.opt.signcolumn = 'number'
vim.opt.colorcolumn = '0'
vim.opt.splitright = true
vim.opt.synmaxcol = 500
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.diagnostic.config {
	virtual_text = false,
	underline = true,
}
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.termguicolors = true
-- TODO: customize moonfly so that normalFloat is more like nvim-cmp's menu
-- TODO: customize the look of statusline and winbar
-- https://stackoverflow.com/questions/7238113/customising-the-colours-of-vims-tab-bar
vim.g.moonflyItalics = false
vim.g.moonflyNormalFloat = true
vim.g.moonflyWinSeparator = 2
vim.cmd [[colorscheme moonfly]]

-------------------------------------------------------------------------------
-- Indentation
-------------------------------------------------------------------------------
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.linebreak = true

-------------------------------------------------------------------------------
-- Keymaps
-------------------------------------------------------------------------------
vim.g.mapleader = ' '
vim.keymap.set('i', 'jk', '<esc>', {})
vim.keymap.set('n', '<leader><backspace>', '<c-^>', {})
vim.keymap.set({ 'n', 'v', 'o' }, 'H', '^', {})
vim.keymap.set({ 'n', 'v', 'o' }, 'L', '$', {})
vim.keymap.set('n', 'n', 'nzz', {})
vim.keymap.set('n', 'N', 'Nzz', {})
vim.keymap.set('n', '*', '*zz', {})
vim.keymap.set('n', '#', '#zz', {})
vim.keymap.set('n', 'g*', 'g*zz', {})
vim.keymap.set('n', 'g#', 'g#zz', {})
vim.keymap.set('n', '?', '?\\M', {})
vim.keymap.set('n', '/', '/\\M', {})
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, {})
vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, {})
vim.keymap.set('n', '<c-j>', '<c-e>', {})
vim.keymap.set('n', '<c-k>', '<c-y>', {})
vim.keymap.set('n', '<leader>f', require('telescope.builtin').find_files, {})
vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers, {})
vim.keymap.set('n', '<leader>g', require('telescope.builtin').live_grep, {})
vim.keymap.set('n', '<leader>s', require('telescope.builtin').lsp_document_symbols, {})
vim.keymap.set('n', '<leader>t', require('nvim-tree.api').tree.toggle, {})
vim.keymap.set({ 'n', 'v' }, '<leader>w', require('hop').hint_words, {})
vim.keymap.set({ 'n', 'v' }, '<leader>l', require('hop').hint_lines, {})
vim.keymap.set({ 'n', 'v' }, '-', require('hop').hint_char1, {})

-------------------------------------------------------------------------------
-- OS integration
-------------------------------------------------------------------------------
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.autoread = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.env.HOME .. '/.cache/nvim'
vim.opt.backupcopy = 'no'

-------------------------------------------------------------------------------
-- Auto commands
-- TODO: replace with lua api
-------------------------------------------------------------------------------
-- Reload config when this file changes
vim.cmd [[
  augroup Packer
    autocmd!
    autocmd BufWritePost config.lua source <afile>
  augroup end
]]

-- Format file on save
vim.api.nvim_create_autocmd(
	'BufWritePre',
	{ callback = function() vim.lsp.buf.format() end }
)

-- Remove whitespace on save
vim.cmd [[au BufWritePre * :%s/\s\+$//e]]

-- Don't autocomment lines near comments
-- vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]]

-------------------------------------------------------------------------------
-- Disable builtin plugins
-------------------------------------------------------------------------------
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
