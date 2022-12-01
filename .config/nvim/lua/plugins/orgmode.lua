require("orgmode").setup_ts_grammar()

require("orgmode").setup({
  org_agenda_files = { "~/notes/org/agenda/*" },
  org_default_notes_file = "~/notes/org",
})
