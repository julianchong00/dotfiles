local colorscheme = "tokyonight"

require(colorscheme).setup({
    style = "storm",
    transparent = false,
    terminal_colors = true,
    styles = {
        comments = { italic = false },
    },
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end
