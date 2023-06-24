local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--  Modes
--
--   normal_mode = "n" askdjhkaj,
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --

--remap Esc key to normal mode --
vim.cmd([[
inoremap jk <C-\><C-n>:call search('[>)\]}"'']', 'W')<CR>a
]])

keymap("n", "dl", "<Esc>d$", opts)
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

keymap("n", ";", ":", term_opts)
keymap("n", ";;", ";", opts)

-- better closing tabs to fix nvim-tree staying open
vim.keymap.set({ "n", "v", "i" }, "<C-s>", "<esc>:w<CR>", opts)
keymap("n", "<S-w>", "b", opts)
keymap("n", "<leader><CR>", ":terminal<CR>", opts)

-- Swap : and ; to remove shift press
-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "<S-l>", "<S-$>", opts)
keymap("n", "<S-h>", "0", opts)
keymap("n", "<S-j>", "<C-d>", opts)
keymap("n", "<S-k>", "<C-u>", opts)
-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
-- keymap("i", "<cr>", 'coc#pum#visible() ? coc#pum#confirm() : "\\<CR>"', {expr=true, noremap=true })
-- keymap("i", "<Tab>", 'coc#pum#visible() ? coc#pum#next(1): "\\<Tab>"', {expr=true, noremap=true})
-- keymap("i", "<S-Tab>", 'coc#pum#visible() ? coc#pum#prev(1): "\\<S-Tab>"', {expr=true, noremap=true})
-- Visual --
keymap("i", "<C-k>", "<Up>", opts)
keymap("i", "<C-j>", "<Down>", opts)
keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "<C-l>", "<Right>", opts)

-- fast indent
keymap("x", "<", "<gv", opts)
keymap("x", ">", ">gv", opts)

-- Move text up and down
keymap("x", "<A-j>", ":m .+1<CR>==", opts)
keymap("x", "<A-k>", ":m .-2<CR>==", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

local dap = require("dap")
dap.defaults.fallback.terminal_win_cmd = "20split new"
vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "🟦", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "⭐️", texthl = "", linehl = "", numhl = "" })

vim.keymap.set("n", "<leader>dh", function()
	require("dap").toggle_breakpoint()
end)
vim.keymap.set("n", "<leader>dH", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<A-k>", function()
	require("dap").step_out()
end)
vim.keymap.set("n", "<A-l>", function()
	require("dap").step_into()
end)
vim.keymap.set("n", "<A-j>", function()
	require("dap").step_over()
end)
vim.keymap.set("n", "<A-h>", function()
	require("dap").continue()
end)
vim.keymap.set("n", "<leader>dn", function()
	require("dap").run_to_cursor()
end)
vim.keymap.set("n", "<leader>dc", function()
	require("dap").terminate()
end)
vim.keymap.set("n", "<leader>dR", function()
	require("dap").clear_breakpoints()
end)
vim.keymap.set("n", "<leader>de", function()
	require("dap").set_exception_breakpoints({ "all" })
end)
vim.keymap.set("n", "<leader>da", function()
	require("debugHelper").attach()
end)
vim.keymap.set("n", "<leader>dA", function()
	require("debugHelper").attachToRemote()
end)
vim.keymap.set("n", "<leader>di", function()
	require("dap.ui.widgets").hover()
end)
vim.keymap.set("n", "<leader>d?", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end)
vim.keymap.set("n", "<leader>dk", ':lua require"dap".up()<CR>zz')
vim.keymap.set("n", "<leader>dj", ':lua require"dap".down()<CR>zz')
vim.keymap.set("n", "<leader>dr", ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')

-- telescope commands
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
