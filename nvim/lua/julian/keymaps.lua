local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Key buttons meanings
--   C - Control
--   A - Alt
--   S - Shift
--   <CR> - Enter key
--   <Esc> - Escape key
--   <leader> - Leader key

-- Normal --
-- Navigate windows with Ctrl+[hjkl]
keymap("n", "<C-h>", "<C-w>h", opts) -- select left window
keymap("n", "<C-j>", "<C-w>j", opts) -- select lower window
keymap("n", "<C-k>", "<C-w>k", opts) -- select upper window
keymap("n", "<C-l>", "<C-w>l", opts) -- select right window

-- Open netrw on the left side of editor
--[[ keymap("n", "<leader>e", ":Lexplore 30<CR>", opts) ]]

-- Resize windows with Ctrl+Arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers with Shift+[hl]
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-l>", ":bnext<CR>", opts)

-- Move text up and down with Alt+[jk]
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Clear search highlight on pressing Esc
keymap("n", "<Esc>", ":noh<CR>", opts)

-- Close active buffer
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Indent/deindent a line in normal mode
keymap("n", "<", "<<", opts)
keymap("n", ">", ">>", opts)


-- Insert
-- Press jk fast to enter normal mode
keymap("i", "jk", "<Esc>", opts)


-- Visual --
-- Move selected text left and right with < and > keys
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move single line of selected text up and down with Alt+[jk]
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move selected text up and down with Alt+[jk]
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '>-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '>-2<CR>gv-gv", opts)


-- Telescope keymaps
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fp", "<cmd>lua require'telescope'.extensions.projects.projects{}<CR>", opts)

-- Nvimtree - file explorer
-- when in Nvimtree
--  a = add file/folder
--  r = rename file
--  d = delete file
--  x = cut file/folder
--  c = copy file/folder
--  p = paste from clipboard
--  l = open file/folder
--  h = close folder
--  v = open file with vertical split
--  Ctrl+k = show file/folder information
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', opts)
