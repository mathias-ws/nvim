local obsidian = require("obsidian")

obsidian.setup({
  workspaces = {
    {
      name = "skole",
      path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/skole",
    },
  },
  detect_cwd = false,
  attachments = {
    img_folder = "attachments",
  },
  note_frontmatter_func = function(note)
    -- This is equivalent to the default frontmatter function.
    local out = { id = note.id, aliases = note.aliases, tags = note.tags, timestamp = os.date("%Y-%m-%dT%H:%M:%S") }
    -- `note.metadata` contains any manually added fields in the frontmatter.
    -- So here we just make sure those fields are kept in the frontmatter.
    if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
      for k, v in pairs(note.metadata) do
        out[k] = v
      end
    end
    return out
  end,
})
