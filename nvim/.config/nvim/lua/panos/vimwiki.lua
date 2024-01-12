local wiki = {
  path = '~/vimwiki_markdown/',
  syntax = 'markdown',
  ext = '.md',
  diary_caption_level = 2,
  auto_diary_index = 1,
  auto_tags = 1,
}

vim.g.vimwiki_list = {wiki}
vim.g.vimwiki_hl_headers= 1 --Use group colors to highlight different header levels.

vim.g.vimwiki_global_ext = 0 -- Dont treat other makrdown files as wikis

-- write title in diary files
vim.api.nvim_create_autocmd("BufNewFile", {
    pattern =vim.fn.expand(wiki.path) .."diary/*.md",
    callback = function()
      print("Creating diary file match with expand")
        -- Extract the filename of the current file without extension
        local filename = vim.fn.expand("%:t:r")
        -- Insert the filename at the top of the file, prefixed with "# "
        vim.api.nvim_buf_set_lines(0, 0, 0, false, {"# " .. filename})
    end
})
