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
