return {
    {
        'github/copilot.vim',
        config = function()
            vim.g.copilot_enabled = false

            vim.g.copilot_filetypes = {
                ['c'] = true,
                ['cmake'] = true,
                ['make'] = true,
                ['yaml'] = true
            }

            vim.g.copilot_no_tab_map = true

            vim.keymap.set('i', '<M-a>', 'copilot#Accept("")',
                { noremap = true, expr = true, silent = true, replace_keycodes = false, desc =
                "Copilot: Accept suggestion." })
            vim.keymap.set('i', '<M-.>', '<Plug>(copilot-next)', { desc = "Copilot: Next suggestion." })
            vim.keymap.set('i', '<M-,>', '<Plug>(copilot-previous)', { desc = "Copilot: Previous suggestion." })
            vim.keymap.set('i', '<M-s>', '<Plug>(copilot-suggest)', { desc = "Copilot: Request suggestion." })
            vim.keymap.set('i', '<M-->', '<Plug>(copilot-dismiss)', { desc = "Copilot: Dismiss suggestion." })
            vim.keymap.set('i', '<M-o>', '<Cmd>Copilot panel<CR>', { desc = "Copilot: Open suggestion panel." })
        end
    }
}
