-- let g:dbs = {
-- \  'dev': 'postgres://postgres:mypassword@localhost:5432/my-dev-db'
-- \ }

vim.g.dbs = {
  ["dev"] = "mysql://root:toor@127.0.0.1:33060/studycontext",
  ["e2e"] = "mysql://root:toor@127.0.0.1:33060/studycontext-test",
}
