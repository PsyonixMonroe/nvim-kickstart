-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Move Commands
vim.keymap.set("n", "<c-i>", "<C-u>zz", { desc = "Jump Half Page Up" })
vim.keymap.set("n", "<c-u>", "<C-d>zz", { desc = "Jump Half Page Down" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Search Next" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Search Prev" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Window Commands
vim.keymap.set("n", "<A-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<A-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<A-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<A-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<A-\\>", ":vsplit<CR>", { desc = "Split Vertical" })
vim.keymap.set("n", "<A-->", ":split<CR>", { desc = "Split Horizontal" })
vim.keymap.set("n", "<c-Up>", ":resize +2<CR>", { desc = "Resize Window Vertically Up" })
vim.keymap.set("n", "<c-Down>", ":resize -2<CR>", { desc = "Resize Window Vertically Down" })
vim.keymap.set("n", "<c-Left>", ":vertical resize +2<CR>", { desc = "Resize Window to the Left" })
vim.keymap.set("n", "<c-Right>", ":vertical resize -2<CR>", { desc = "Resize Window to the Right" })
vim.keymap.set("n", "<A-]>", ":bnext<CR>", { desc = "Next tab in tabline" })
vim.keymap.set("n", "<A-[>", ":bprevious<CR>", { desc = "Prev tab in tabline" })
vim.keymap.set("n", "<Leader>o", ":Neotree focus<CR>", { desc = "Focus on Neotree" })
-- never really used these harpoon ones, but wanted the tabline ones back
-- ["<A-]>"] = {
--     function()
--         local harpoon = require "harpoon"
--         harpoon:list():next()
--     end,
--     desc = "Next Harpoon",
-- },
-- ["<A-[>"] = {
--     function()
--         local harpoon = require "harpoon"
--         harpoon:list():prev()
--     end,
--     desc = "Prev Harpoon",
-- },

-- Text Move
vim.keymap.set("n", "<c-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move Text Up" })
vim.keymap.set("n", "<c-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move Text Down" })
vim.keymap.set("v", "<", "<gv", { desc = "DeIndent Selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent Selection" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Text Block Up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Text Block Down" })

-- Cut Copy Paste
vim.keymap.set("n", "Y", "yy", { desc = "Yank Line" })
vim.keymap.set("v", "p", '"_dP', { desc = "Paste" })
vim.keymap.set("v", "<c-x>", '"+x', { desc = "Cut" })
vim.keymap.set("v", "<c-c>", '"+y', { desc = "Copy" })
vim.keymap.set("v", "<c-v>", '"_d"+gP', { desc = "Paste" })
vim.keymap.set("v", "<Leader>y", '"+y', { desc = "Yank to Clipboard" })
vim.keymap.set("v", "<Leader>p", '"+gP', { desc = "Paste and keep Clipboard" })
vim.keymap.set("x", "<c-x>", '"+x', { desc = "Cut" })
vim.keymap.set("x", "<c-c>", '"+y', { desc = "Copy" })
vim.keymap.set("x", "<c-v>", '"_d"+gP', { desc = "Paste" })
vim.keymap.set("x", "<Leader>y", '"+y', { desc = "Yank to Clipboard" })
vim.keymap.set("x", "<Leader>p", '"+gP', { desc = "Paste and keep Clipboard" })
vim.keymap.set("i", "<c-v>", '<ESC>"+gPa', { desc = "Paste" })

-- Diff Commands
vim.keymap.set("n", "<Leader>r<Leader>", ":diffget 1<CR>", { desc = "Take Left Diff" })
vim.keymap.set("n", "<Leader>g<Leader>", ":diffget 2<CR>", { desc = "Take Center Diff" })
vim.keymap.set("n", "<Leader>u<Leader>", ":diffget 3<CR>", { desc = "Take Right Diff" })

-- Lua
vim.keymap.set("n", "<Leader>x", "<cmd>:.lua<CR>", { desc = "Execute Line (lua)" })
vim.keymap.set("n", "<Leader><Leader>x", "<cmd>source %<CR>", { desc = "Load File (lua)" })
vim.keymap.set("v", "<Leader>x", "<cmd>:lua<CR>", { desc = "Execute Selection (lua)" })

-- Telescope
vim.keymap.set("n", "<Leader>fa", "<cmd>Telescope find_files<CR>", { desc = "Find All Files" })
vim.keymap.set("n", "<Leader>ff", "<cmd>Telescope git_files<CR>", { desc = "Find Git Files" })
vim.keymap.set("n", "<Leader>fd", function()
	require("telescope.builtin").lsp_document_symbols({ search = vim.fn.input("Grep > ") })
end, { desc = "Grep for string in files" })
vim.keymap.set("n", "<Leader>fs", function()
	require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Grep for string in files" })

-- Quick Fix
vim.keymap.set("n", "<Leader>qn", ":cnext<CR>", { desc = "Quick Fix Next" })
vim.keymap.set("n", "<Leader>qb", ":cprev<CR>", { desc = "Quick Fix Previous" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- File Commands
vim.keymap.set("n", "<Leader>us", ":autocmd! save_all_buffers<CR>", { desc = "toggle autosave" })
vim.keymap.set("n", "<A-s>", ":w<CR>", { desc = "Save File" })

-- Misc
vim.keymap.set("n", "<Leader>bv", "<C-v>", { desc = "Enter visual block mode" })
vim.keymap.set(
	"n",
	"<Leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Search and Replace Word Under Cursor" }
)

-- LSP
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "Declaration of current symbol" })
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "Declaration of current symbol" })
vim.keymap.set("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Show Line Hover" })
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Go To Implementation" })
vim.keymap.set("n", "gy", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "Show Signature Help" })
vim.keymap.set("n", "gc", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Perform Code Action" })
vim.keymap.set("n", "<A-.>", ":ToggleTerm<CR>", { desc = "Run Terminal emulator" })
vim.keymap.set("n", "<Leader>ln", ":lua vim.diagnostic.goto_next()<CR>", { desc = "Go to next error" })
vim.keymap.set("n", "<Leader>lN", ":lua vim.diagnostic.goto_prev()<CR>", { desc = "Go to prev error" })
vim.keymap.set("n", "<Leader>lg", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Show Documentation" })
vim.keymap.set("n", "<Leader>rt", "", { desc = "Run Test" })

vim.keymap.set("n", "<Leader>lc", ":GoCmt<CR>", { desc = "Add stub GoDoc" })
vim.keymap.set(
	"n",
	"<Leader>rr",
	"Oif err != nil {<CR>}<CR><Esc>kOreturn err<Esc>:lua vim.lsp.buf.format()<CR>_",
	{ desc = "Go err block" }
)

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
