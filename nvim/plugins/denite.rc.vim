nnoremap <silent> ,f :Denite file/rec <CR>
nnoremap <silent> ,g :Denite grep <CR>
nnoremap <silent> ,b :Denite buffer <CR>
nnoremap <silent> ,l :Denite line <CR>

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

" use floating
let s:denite_win_width_percent = 0.85
let s:denite_win_height_percent = 0.7
let s:denite_default_options = {
    \ 'split': 'floating',
    \ 'winwidth': float2nr(&columns * s:denite_win_width_percent),
    \ 'wincol': float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2),
    \ 'winheight': float2nr(&lines * s:denite_win_height_percent),
    \ 'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
    \ 'highlight_filter_background': 'DeniteFilter',
    \ 'prompt': '$ ',
    \ 'start_filter': v:true,
    \ }
let s:denite_option_array = []
for [key, value] in items(s:denite_default_options)
  call add(s:denite_option_array, '-'.key.'='.value)
endfor
call denite#custom#option('default', s:denite_default_options)

" file/rec に ag を設定
let s:ignore_globs = [
    \ '.git/', '.ropeproject/', '__pycache__/',
    \ 'venv/', 'images/', '*.min.*', 'img/', 'fonts/',
    \ 'node_modules/']

call denite#custom#var('file/rec', 'command', [
    \ 'ag', '--follow',
    \ ] + map(deepcopy(s:ignore_globs), { k, v -> '--ignore=' . v }) + [
    \ '--nocolor', '--nogroup', '--hidden', '-g', ''])

" Ag command on grep source
call denite#custom#var('grep', {
  	\ 'command': ['ag'],
  	\ 'default_opts': ['-i', '--vimgrep'],
  	\ 'recursive_opts': [],
  	\ 'pattern_opt': [],
  	\ 'separator': ['--'],
  	\ 'final_opts': [],
  	\ })


" matcher/ignore_globs 以外のお好みの matcher を指定する
call denite#custom#source('file/rec', 'matchers', ['matcher/substring'])

" 他のソース向けに ignore_globs 自体は初期化
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs', s:ignore_globs)

" grep
command! -nargs=? Dgrep call s:Dgrep(<f-args>)
function s:Dgrep(...)
  if a:0 > 0
    execute(':Denite -buffer-name=grep-buffer-denite grep -path='.a:1)
  else
    execute(':Denite -buffer-name=grep-buffer-denite '.join(s:denite_option_array, ' ').' grep')
  endif
endfunction

" show Denite grep results
command! Dresume execute(':Denite -resume -buffer-name=grep-buffer-denite '.join(s:denite_option_array, ' ').'')
" next Denite grep result
command! Dnext execute(':Denite -resume -buffer-name=grep-buffer-denite -cursor-pos=+1 -immediately '.join(s:denite_option_array, ' ').'')
" previous Denite grep result
command! Dprev execute(':Denite -resume -buffer-name=grep-buffer-denite -cursor-pos=-1 -immediately '.join(s:denite_option_array, ' ').'')

