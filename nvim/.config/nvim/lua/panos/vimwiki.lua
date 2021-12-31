local wiki = {
  path = '~/vimwiki/',
  syntax = 'markdown',
  ext = '.wiki',
  diary_caption_level = 2,
  auto_diary_index = 1,
  auto_tags = 1,
}

vim.g.vimwiki_list = {wiki}

-- " Append wiki file extension to links in Markdown. This is needed for
-- " compatibility with other Markdown tools.
vim.g.vimwiki_markdown_link_ext = 1
