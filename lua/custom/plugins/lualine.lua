--- @param trunc_width number trunctates component when screen width is less then trunc_width
--- @param trunc_len number truncates component to trunc_len number of chars
--- @param hide_width number hides component when window width is smaller then hide_width
--- @param no_ellipsis boolean whether to disable adding '...' at end after truncation
--- return function that can format the component accordingly
local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
    return function(str)
        local win_width = vim.fn.winwidth(0)
        if hide_width and win_width < hide_width then
            return ''
        elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
            return str:sub(1, trunc_len) .. (no_ellipsis and '' or '...')
        end
        return str
    end
end


return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'kyazdani42/nvim-web-devicons',
    },
    config = {
        options = {
            icons_enabled = true,
            theme = 'auto',
            component_separators = '',
            section_separators = '',
            -- component_separators = { left = '', right = '' },
            -- section_separators = { left = '', right = '' },
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            }
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = {
                { 'branch', fmt = trunc(300, 16, nil, false) },
                'diff'
            },
            lualine_c = { 'filename' },
            lualine_x = { 'tabs' },
            lualine_y = { 'location', 'progress' },
            lualine_z = {
                {
                    'diagnostics',
                    sources = {
                        -- 'nvim_lsp',
                        'nvim_diagnostic',
                        -- 'nvim_workspace_diagnostic',
                        -- 'coc',
                        -- 'ale',
                        -- 'vim_lsp'
                    },
                    sections = { 'error', 'warn', 'info', 'hint' },
                    diagnostics_color = {
                        -- Same values as the general color option can be used here.
                        error = 'DiagnosticError', -- Changes diagnostics' error color.
                        warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
                        info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
                        hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
                    },
                    symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' },
                    colored = true,           -- Displays diagnostics status in color if set to true.
                    update_in_insert = false, -- Update diagnostics in insert mode.
                    always_visible = false,   -- Show diagnostics even if there are none.
                }
            }
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { 'filename' },
            lualine_x = { 'location' },
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
    }
}
