return {
  {
    "obsidian-nvim/obsidian.nvim",
    -- version = "*",  -- recommended, use latest release instead of latest commit
    dependencies = {
      -- optional
      "lukas-reineke/headlines.nvim",

      -- see below for full list of optional dependencies 👇
    },
    config = function(_, opts)
      require("obsidian").setup(opts)
    end,
    opts = {
      legacy_commands = false,
      workspaces = {
        {
          name = "vimwiki",
          path = "~/vimwiki_markdown",
        },
        {
          name = "personal",
          path = "~/obsidian_home",
        },
      },
      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "notes/dailies",
        -- Optional, if you want to change the date format for the ID of daily notes.
        date_format = "%Y-%m-%d",
        -- Optional, if you want to change the date format of the default alias of daily notes.
        alias_format = "%d/%m/%Y",
        -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
        template = nil,
      },
      wiki_link_func = "prepend_note_path",

      -- Optional, customize how names/IDs for new notes are created.
      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local parsed_title = ""
        if title ~= nil then
          -- If title is given, transform it into valid file name.
         parsed_title = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        end

        return require("obsidian").util.zettel_id() .. "-" .. parsed_title
        
      end,

      -- Optional, alternatively you can customize the frontmatter data.
      note_frontmatter_func = function(note)
        -- Add the title of the note as an alias.
        if note.title then
          note:add_alias(note.title)
        end

        return require("obsidian.builtin").frontmatter(note)
      end,

      -- Optional, for templates (see below).
      templates = {
        subdir = "templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
        -- A map for custom variables, the key should be the variable and the value a function
        substitutions = {},
      },

      open_notes_in = "vsplit",
      ui = {
        checkboxes = {
          -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
          ["-"] = { char = "󰰱", hl_group = "ObsidianTilde" },
          [" "] = { char = "󰄱", hl_group = "obsidiantodo" },
          ["~"] = { char = "󰰱", hl_group = "obsidiantilde" },
          ["!"] = { char = "", hl_group = "obsidianimportant" },
          [">"] = { char = "", hl_group = "obsidianrightarrow" },
          ["x"] = { char = "", hl_group = "obsidiandone" },
          ["X"] = { char = "", hl_group = "obsidiandone" },
          },
      },

      callbacks = {
            enter_note = function(_, note)
               vim.keymap.set("n", "<C-Space>", "<cmd>Obsidian toggle_checkbox<cr>", {
                  buffer = note.bufnr,
                  desc = "Toggle checkbox",
               })
            end,
         },
      ---@class obsidian.config.CheckboxOpts
      ---
      ---@field enabled? boolean
      ---
      ---Order of checkbox state chars, e.g. { " ", "x" }
      ---@field order? string[]
      ---
      ---Whether to create new checkbox on paragraphs
      ---@field create_new? boolean
      checkbox = {
        enabled = true,
        create_new = true,
        order = { " ","x" },
      },
    },
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    -- config = function(_, opts)
      -- require("render-markdonw").setup(opts)
    -- end,
    opts = {
      checkbox = {
        custom = {
              started = { raw = '[>]', rendered = '', highlight = 'DiagnosticWarn' },
        },
      },
    }
}
}
