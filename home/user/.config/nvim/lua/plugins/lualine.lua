
local function get_virtual_env()
    return vim.fs.basename(os.getenv("VIRTUAL_ENV"))
end

function GET_FORMATTED_VIRTUAL_ENV()
    if vim.bo.filetype == 'python' then
        return "<" .. get_virtual_env() .. ">"
    end
    return ""
end

function DETECT_INDENT_TYPE()
    if vim.bo.expandtab then
        return vim.bo.shiftwidth .. " spaces"
    else
        return vim.bo.shiftwidth / vim.bo.tabstop .. " tabs (" .. vim.bo.tabstop .. ")"
    end
end

local function is_absolute_path(path)
    return string.sub(path, 1, 1) == '/' or string.sub(path, 1, 1) == '~'
end

return {
    'nvim-lualine/lualine.nvim',
    config = function()
        require("lualine").setup({
            options = {
                component_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {
                    {
                        'vim.fn.getcwd()',
                        fmt = function(str)
                            local res = str

                            res = str:gsub(os.getenv("HOME"), "~")

                            return res
                        end,
                        color = { fg = 'white', gui='bold' },
                        padding = { left = 1, right = 0 }
                    },
                    {
                        'filename',
                        fmt = function(str)
                            local res = str

                            if is_absolute_path(res) then
                                res = " " .. res
                            else
                                res = "/" .. res
                            end

                            return res
                        end,
                        file_status = true,
                        path = 1,
                        padding = { left = 0, right = 1 }
                    },
                },
                lualine_x = {'GET_FORMATTED_VIRTUAL_ENV()', 'DETECT_INDENT_TYPE()', 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'},
            },
        })
    end,
    dependencies = { 'kyazdani42/nvim-web-devicons' }
}