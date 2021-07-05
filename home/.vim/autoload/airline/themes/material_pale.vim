" Color palette
let s:gui_red = '#F07178'
let s:cterm_red = 1
let s:gui_green = '#C3E88D'
let s:cterm_green = 2
let s:gui_yellow = '#FFCB6B'
let s:cterm_yellow = 3
let s:gui_blue = '#82AAFF'
let s:cterm_blue = 4
let s:gui_magenta = '#C792EA'
let s:cterm_magenta = 5
let s:gui_cyan = '#89DDFF'
let s:cterm_cyan = 6
let s:gui_fg = '#959DCB'
let s:cterm_fg = 7
let s:gui_bg = '#292D3E'
let s:cterm_bg = 8
let s:transparent = 'NONE'
let s:gui_black = '#303030'
let s:cterm_black = 236

let g:airline#themes#material_pale#palette = {}

" Global colors
let s:outerMiddle = [s:gui_fg, s:transparent, s:cterm_fg, s:transparent, 'none']
let s:innerMiddle = [s:gui_bg, s:transparent, s:cterm_bg, s:transparent, 'none']

" Warning color
let s:warn = [s:gui_black, s:gui_yellow, s:cterm_black, s:cterm_yellow, 'none']

" Error color
let s:error = [s:gui_black, s:gui_red, s:cterm_black, s:cterm_red, 'bold']

" Normal mode
let s:nMain = [s:gui_green, s:transparent, s:cterm_green, s:transparent, 'none']
let g:airline#themes#material_pale#palette.normal = airline#themes#generate_color_map(s:nMain, s:outerMiddle, s:innerMiddle)
let g:airline#themes#material_pale#palette.normal_modified = {
      \ 'airline_c': [s:gui_yellow, s:transparent, s:cterm_yellow, s:transparent, 'italic'],
      \ }
let g:airline#themes#material_pale#palette.normal.airline_warning = s:warn
let g:airline#themes#material_pale#palette.normal.airline_error = s:error
let g:airline#themes#material_pale#palette.normal_modified.airline_warning = s:warn
let g:airline#themes#material_pale#palette.normal_modified.airline_error = s:error

" Insert mode
let s:iMain = [s:gui_blue, s:transparent, s:cterm_blue, s:transparent, 'none']
let g:airline#themes#material_pale#palette.insert = airline#themes#generate_color_map(s:iMain, s:outerMiddle, s:innerMiddle)
let g:airline#themes#material_pale#palette.insert_modified = copy(g:airline#themes#material_pale#palette.normal_modified)
let g:airline#themes#material_pale#palette.insert_paste = {
      \ 'airline_a': [s:gui_bg, s:gui_blue, s:cterm_bg, s:cterm_blue, 'bold'],
      \ }
let g:airline#themes#material_pale#palette.insert.airline_warning = s:warn
let g:airline#themes#material_pale#palette.insert.airline_error = s:error
let g:airline#themes#material_pale#palette.insert_paste.airline_warning = s:warn
let g:airline#themes#material_pale#palette.insert_paste.airline_error = s:error

" Replace mode
let g:airline#themes#material_pale#palette.replace = {
      \ 'airline_a': [s:gui_bg, s:gui_red, s:cterm_bg, s:cterm_red, 'bold'],
      \ 'airline_c': [s:gui_red, s:transparent, s:cterm_red, s:transparent, 'none'],
      \ }
let g:airline#themes#material_pale#palette.replace_modified = copy(g:airline#themes#material_pale#palette.insert_modified)
let g:airline#themes#material_pale#palette.replace.airline_warning = s:warn
let g:airline#themes#material_pale#palette.replace.airline_error = s:error

" Visual mode
let s:vMain = [s:gui_magenta, s:transparent, s:cterm_magenta, s:transparent, 'none']
let g:airline#themes#material_pale#palette.visual = airline#themes#generate_color_map(s:vMain, s:outerMiddle, s:innerMiddle)
let g:airline#themes#material_pale#palette.visual_modified = copy(g:airline#themes#material_pale#palette.insert_modified)
let g:airline#themes#material_pale#palette.visual.airline_warning = s:warn
let g:airline#themes#material_pale#palette.visual.airline_error = s:error

" Inactive window
let s:inactive = [s:gui_bg, s:transparent, s:cterm_bg, s:transparent, 'none']
let g:airline#themes#material_pale#palette.inactive = airline#themes#generate_color_map(s:inactive, s:inactive, s:inactive)
let g:airline#themes#material_pale#palette.inactive_modified = {
      \ 'airline_c': [s:gui_yellow, s:transparent, s:cterm_yellow, s:transparent, 'none'],
      \ }

" CtrlP
if !get(g:, 'loaded_ctrlp', 0)
  finish
endif
let g:airline#themes#material_pale#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
      \ [ s:gui_yellow, s:gui_fg, s:cterm_fg, s:transparent, 'none' ] ,
      \ [ s:gui_yellow, s:gui_bg, s:cterm_cyan, s:transparent, 'none' ] ,
      \ [ s:gui_bg, s:gui_green, s:cterm_yellow, s:transparent, 'bold' ] )
