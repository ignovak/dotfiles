nmap <buffer><cr> <Plug>(vimfiler_expand_or_edit)
nmap <buffer><Left> <Plug>(vimfiler_smart_h)
nmap <buffer><Right> <Plug>(vimfiler_smart_l)
nmap <buffer>p <Plug>(vimfiler_jump_first_child)k

highlight def link vimfilerNonMark Preproc
highlight def link vimfilerOpenedFile Identifier
highlight def link vimfilerClosedFile Identifier
