vim.g.tex_flavor = "latex"
vim.g.vimtex_view_method = "sioyek"
-- vim.g.vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
-- vim.g.vimtex_view_general_options_latexmk = '--unique'
-- vim.g.vimtex_view_method = skim
-- vim.g.vimtex_view_automatic = 1 -- prevent `latexmk` (or other build tools) from starting Skim
vim.g.vimtex_complete_bib_simple = 1

local gknapsettings = {
    texoutputext = "pdf",
    textopdf = "xelatex -output-directory=build -synctex=1 -halt-on-error -interaction=batchmode %docroot% ",
    textopdfviewerlaunch = "sioyek --inverse-search 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%1'\"'\"',%2,%3)\"' --new-window build/%outputfile%",
    textopdfforwardjump = "sioyek --inverse-search 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%1'\"'\"',%2,%3)\"' --reuse-window --forward-search-file %srcfile% --forward-search-line %line% build/%outputfile%",
    textopdfshorterror = "A=build/%outputfile% ; LOGFILE=\"${A%.pdf}.log\" ; rubber-info \"$LOGFILE\" 2>&1 | head -n 1",
}
vim.g.knap_settings = gknapsettings

local function register_knap_on_whichkey()
    local status_ok, which_key = pcall(require, "which-key")
    if not status_ok then
        return
    end

    local status_ok, knap = pcall(require, "knap")
    if not status_ok then
        return
    end

    local bufnr = vim.api.nvim_get_current_buf()
    local opts = {
        mode = "n", -- NORMAL mode
        prefix = "<leader>",
        buffer = bufnr, -- Specify a buffer number for buffer local mappings
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
    }

    local mappings = {
        k = {
            name = "Knap AutoPreview",
            t = { knap.toggle_autopreviewing, "Toggle AutoPreview" },
            p = { knap.process_once, "Process once" },
            c = { knap.close_viewer, "Close and reset" },
            j = { knap.forward_jump, "SynTeX forward search" },

        },
    }

    which_key.register(mappings, opts)
end


-- create autocommand for registering knap to which-key for current buffer at ender
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.tex",
    callback = register_knap_on_whichkey,
    once = true,
})

