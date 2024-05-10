return {
    {
        'ThePrimeagen/harpoon',
        config = function()
            local harpoon = require("harpoon")
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            harpoon.setup({
                menu = {
                    width = vim.api.nvim_win_get_width(0) - 16,
                }
            })

            vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add file to Harpoon file list" })
            vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Show Harpoon file list" })

            vim.keymap.set("n", "<C-j>", function() ui.nav_file(1) end,
                { desc = "Select file number 1 in Harpoon file list" })
            vim.keymap.set("n", "<C-k>", function() ui.nav_file(2) end,
                { desc = "Select file number 2 in Harpoon file list" })
            vim.keymap.set("n", "<C-l>", function() ui.nav_file(3) end,
                { desc = "Select file number 3 in Harpoon file list" })
        end
    }
}
