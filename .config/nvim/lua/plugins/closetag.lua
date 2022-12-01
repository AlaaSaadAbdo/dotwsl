local g = vim.g

-- filenames like *.xml, *.html, *.xhtml, ...
-- These are the file extensions where this plugin is enabled.
g.closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.jsx,*.ts,*.tsx"

-- filetypes like xml, html, xhtml, ...
-- These are the file types where this plugin is enabled.
g.closetag_filetypes = "html,xhtml,phtml,html.handlebars,javascriptreact,typescriptreact"

-- integer value [0|1]
-- This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
g.closetag_emptyTags_caseSensitive = 0

-- Disables auto-close if not in a --valid-- region (based on filetype)
g.closetag_regions = {
  ["typescript.tsx"] = "jsxRegion,tsxRegion",
  ["javascript.jsx"] = "jsxRegion",
  ["typescriptreact"] = "jsxRegion,tsxRegion",
  ["javascriptreact"] = "jsxRegion",
}

-- Shortcut for closing tags, default is '>'
g.closetag_shortcut = ">"

-- Add > at current position without closing the current tag, default is ''
g.closetag_close_shortcut = "<leader>>"
