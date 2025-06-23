-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd({"FocusLost", "BufWinLeave"}, {
    desc = "Save buffer when leaving the buffer",
    group = vim.api.nvim_create_augroup("save_all_buffers", {clear = true}),
    pattern = { "*" },
    callback = function()
        -- print(vim.bo.buftype)
        vim.cmd(' \
            if !&readonly && !(&buftype == "nofile") && !(&buftype == "terminal") && !(&buftype == "quickfix") && !(&filetype == "harpoon") && !(&buftype == "prompt") && !isdirectory(expand("%") && (!vim.fn.expand("%") == "")) \
                :w! \
            endif \
        ')
    end,
})
vim.api.nvim_create_autocmd({"BufEnter"}, {
    pattern = { "*" },
    group = vim.api.nvim_create_augroup("remove_crlf", {clear = true}),
    desc = "Remove Windows Style Line endings",
    callback = function()
        -- print(vim.bo.buftype)
        vim.cmd(' \
            if !&readonly && !(&buftype == "nofile") && !(&buftype == "terminal") && !(&buftype == "quickfix") && !(&filetype == "harpoon") && !(&buftype == "prompt") && !isdirectory(expand("%") && (!vim.fn.expand("%") == "")) \
                :%s/\r//ge \
            endif \
        ')
    end,
})
vim.api.nvim_create_autocmd({"BufEnter"}, {
    pattern = { "*" },
    group = vim.api.nvim_create_augroup("highlight", { clear = true}),
    desc = "Highlight whitespace on trailing lines using MiniTrailspace",
    callback = function()
        vim.api.nvim_command("highlight! MiniTrailspace guibg=#ff0000 guifg=#ffffff")
    end,
})
