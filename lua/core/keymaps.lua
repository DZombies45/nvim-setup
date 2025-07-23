-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- Clear highlights on search when pressing <Esc> in normal mode
opts.desc = 'Clear Highlights on Normal'
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', opts)

-- save file
opts.desc = 'Save File'
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- save file without auto-formatting
opts.desc = 'Save File Without Formating'
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)

-- quit file
opts.desc = 'Quit'
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)

-- delete single character without copying into register
opts.desc = 'delete'
vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and center
opts.desc = 'Scroll Vertical and Center'
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
opts.desc = 'Find and Center'
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Resize with arrows
opts.desc = 'Resize Window'
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Buffers
opts.desc = 'File Tab'
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
opts.desc = 'File Tab Close'
vim.keymap.set('n', '<leader>x', ':bdelete!<CR>', opts) -- close buffer
opts.desc = 'File Tab New'
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts) -- new buffer

-- Window management
opts.desc = 'Split Vertical'
vim.keymap.set('n', '<leader>sv', '<C-w>v', opts) -- split window vertically
opts.desc = 'Split Horizontal'
vim.keymap.set('n', '<leader>sh', '<C-w>s', opts) -- split window horizontally
opts.desc = 'Split Equaly'
vim.keymap.set('n', '<leader>se', '<C-w>=', opts) -- make split windows equal width & height
opts.desc = 'Split Close'
vim.keymap.set('n', '<leader>sx', ':close<CR>', opts) -- close current split window

-- Navigate between splits
opts.desc = 'Navigate Between Splits'
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Tabs
opts.desc = 'Tab Open New'
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts) -- open new tab
opts.desc = 'Tab Close Current'
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
opts.desc = 'Tab Next'
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts) --  go to next tab
opts.desc = 'Tab Previous'
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts) --  go to previous tab

-- Toggle line wrapping
opts.desc = 'Toggle Line Wrapping'
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Toggle line relative number
opts.desc = 'Toggle Line Number Relative'
vim.keymap.set('n', '<leader>ln', '<cmd>set relativenumber!<CR>', opts)
-- Stay in indent mode
opts.desc = 'Indent'
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
opts.desc = 'Keep Last Yank When Pasting'
vim.keymap.set('v', 'p', '"_dP', opts)

-- Diagnostic keymaps
opts.desc = 'Go to previous diagnostic message'
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
opts.desc = 'Go to next diagnostic message'
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
opts.desc = 'Open floating diagnostic message'
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
opts.desc = 'Open diagnostics list'
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- termux clipboard
opts.desc = 'copy to clipboard'
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', opts)
opts.desc = 'paste clipboard after cursor'
vim.keymap.set('n', '<leader>p', '"+p', opts)
opts.desc = 'paste clipboard after cursor'
vim.keymap.set('n', '<leader>P', '"+P', opts)


function ToggleTabIndent()
  local expand = vim.bo.expandtab
  if expand then
    vim.bo.expandtab = false
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 4
    print("Indent: [TAB]")
  else
    vim.bo.expandtab = true
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
    print("Indent: [SPACES]")
  end
end

opts.desc = 'toggle tab to tab or spaces'
vim.keymap.set('n', '<leader>tt', ':lua ToggleTabIndent()<CR>', { noremap = true, silent = true })