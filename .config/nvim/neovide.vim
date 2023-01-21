if exists("g:neovide")
  let g:neovide_remember_window_size=v:true
  let g:neovide_cursor_animation_length=0.1
  let g:neovide_input_use_logo=v:true
endif

"" tnoremap <Esc> <C-\><C-n>
let g:clipboard = {
  \   'name': 'win32yank-wsl',
  \   'copy': {
  \      '+': 'win32yank.exe -i --crlf',
  \      '*': 'win32yank.exe -i --crlf',
  \    },
  \   'paste': {
  \      '+': 'win32yank.exe -o --lf',
  \      '*': 'win32yank.exe -o --lf',
  \   },
  \   'cache_enabled': 0,
  \ }


