" 【Ctrl + o】 float windowでターミナルを表示
nnoremap df :<C-u>Deol -split=floating -winheight=25 -winwidth=100<CR>
nnoremap dv :<C-u>Deol -split=vertical<CR>
nnoremap ds :<C-u>Deol -split=horizontal<CR>
" 【ESC】 ターミナルモードから抜ける
tnoremap <C-[>   <C-\><C-n>

let g:deol#custom_map = {
        \ 'edit': '<C-e><C-d>',
        \ }
