" 【Ctrl + f】 defx.nvimを起動
nnoremap <silent><C-f> :<C-u>Defx -new `expand('%:p:h')` -search=`expand('%:p')`<CR>

call defx#custom#column('icon', {
      \ 'directory_icon': '▸',
      \ 'opened_icon': '▾',
      \ 'root_icon': ' ',
      \ })

call defx#custom#column('filename', {
      \ 'min_width': 40,
      \ 'max_width': 80,
      \ })

call defx#custom#column('mark', {
      \ 'readonly_icon': '✗',
      \ 'selected_icon': '✓',
      \ })

call defx#custom#option('_', {
      \ 'columns': 'mark:indent:git:icon:filename',
      \ 'show_ignored_files': 1,
	    \ })

let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_column_length = 2

autocmd FileType defx call s:defx_my_settings()
    function! s:defx_my_settings() abort
	  " 【CR / l】ファイルを開く
	  nnoremap <silent><buffer><expr> <CR>
	  \ defx#do_action('open')
	  nnoremap <silent><buffer><expr> l
	  \ defx#do_action('open')
	  " 【c】copy
	  nnoremap <silent><buffer><expr> c
	  \ defx#do_action('copy')
	  " 【m】move
	  nnoremap <silent><buffer><expr> m
	  \ defx#do_action('move')
	  " 【p】paste
	  nnoremap <silent><buffer><expr> p
	  \ defx#do_action('paste')
    " 【E】open vsplit
	  nnoremap <silent><buffer><expr> E
	  \ defx#do_action('open', 'vsplit')
    " 【P】open pedit
	  nnoremap <silent><buffer><expr> P
	  \ defx#do_action('open', 'pedit')
    " 【o】open_or_close_tree
	  nnoremap <silent><buffer><expr> o
	  \ defx#do_action('open_or_close_tree')
    " 【K】new_directory
	  nnoremap <silent><buffer><expr> K
	  \ defx#do_action('new_directory')
    " 【N】new_file
	  nnoremap <silent><buffer><expr> N
	  \ defx#do_action('new_file')
    " 【M】new_multiple_files
	  nnoremap <silent><buffer><expr> M
	  \ defx#do_action('new_multiple_files')
    " 【C】toggle_columns, mark:indent:icon:filename:type:size:time
	  nnoremap <silent><buffer><expr> C
	  \ defx#do_action('toggle_columns',
	  \                'mark:indent:git:icon:filename:type:size:time')
    " 【S】toggle_sort time
	  nnoremap <silent><buffer><expr> S
	  \ defx#do_action('toggle_sort', 'time')
    " 【d】remove
	  nnoremap <silent><buffer><expr> d
	  \ defx#do_action('remove')
    " 【r】rename
	  nnoremap <silent><buffer><expr> r
	  \ defx#do_action('rename')
    " 【!】execute_command
	  nnoremap <silent><buffer><expr> !
	  \ defx#do_action('execute_command')
    " 【x】execute_system
	  nnoremap <silent><buffer><expr> x
	  \ defx#do_action('execute_system')
    " 【yy】yank_path
	  nnoremap <silent><buffer><expr> yy
	  \ defx#do_action('yank_path')
    " 【.】toggle_ignored_files
	  nnoremap <silent><buffer><expr> .
	  \ defx#do_action('toggle_ignored_files')
    " 【;】repeat
	  nnoremap <silent><buffer><expr> ;
	  \ defx#do_action('repeat')
    " 【h】cd ..
	  nnoremap <silent><buffer><expr> h
	  \ defx#do_action('cd', ['..'])
    " 【~】cd
	  nnoremap <silent><buffer><expr> ~
	  \ defx#do_action('cd')
    " 【q】quit
	  nnoremap <silent><buffer><expr> q
	  \ defx#do_action('quit')
    " 【<C-g>】print
	  nnoremap <silent><buffer><expr> <C-g>
	  \ defx#do_action('print')
    " 【cd】change_vim_cwd
	  nnoremap <silent><buffer><expr> cd
	  \ defx#do_action('change_vim_cwd')
    endfunction
