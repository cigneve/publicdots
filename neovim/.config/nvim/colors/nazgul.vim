" Nazgul - A very gray Vim theme
if exists('g:nazgul_loaded')
  finish
endif

function! s:signify_unloaded(scheme) abort
  if a:scheme !=# 'nazgul' && exists('g:nazgul_loaded')
    unlet g:nazgul_loaded
  endif
endfunction

augroup nazgul_aucmds
  au!
  au ColorScheme * call s:signify_unloaded(expand('<amatch>'))
augroup END

highlight clear

if exists('syntax_on')
    syntax reset
endif

let g:colors_name = 'nazgul'
let s:palette = {}
let s:palette.blackest = '#141414'
let s:palette.black = '#282828'
let s:palette.gray01 = '#333333'
let s:palette.gray02 = '#515151'
let s:palette.gray03 = '#5b5b5b'
let s:palette.gray04 = '#666666'
let s:palette.gray05 = '#727272'
let s:palette.gray06 = '#828282'
let s:palette.gray07 = '#8c8c8c'
let s:palette.gray08 = '#969696'
let s:palette.gray09 = '#a0a0a0'
let s:palette.gray10 = '#aaaaaa'
let s:palette.gray11 = '#b5b5b5'
let s:palette.gray12 = '#bfbfbf'
let s:palette.gray13 = '#c9c9c9'
let s:palette.gray14 = '#d3d3d3'
let s:palette.gray15 = '#efefef'
let s:palette.white = '#f9f9f9'
let s:palette.comments = copy(s:palette.gray10)
let s:palette.purple = '#5f5fd7'
let s:palette.brown = '#875f00'
let s:palette.blue = '#005f87'
let s:palette.lightblue = '#00afff'
let s:palette.green = '#00875f'
let s:palette.red = '#870000'
let s:palette.magenta = '#87005f'

let g:terminal_color_0 = s:palette.gray01
let g:terminal_color_1 = s:palette.gray06
let g:terminal_color_2 = s:palette.gray03
let g:terminal_color_3 = s:palette.gray11
let g:terminal_color_4 = s:palette.gray02
let g:terminal_color_5 = s:palette.gray08
let g:terminal_color_6 = s:palette.gray09
let g:terminal_color_7 = s:palette.gray13
let g:terminal_color_8 = s:palette.gray03
let g:terminal_color_9 = s:palette.gray10
let g:terminal_color_10 = s:palette.gray07
let g:terminal_color_11 = s:palette.gray15
let g:terminal_color_12 = s:palette.gray05
let g:terminal_color_13 = s:palette.gray12
let g:terminal_color_14 = s:palette.gray14
let g:terminal_color_15 = s:palette.white

hi Normal guifg=#c9c9c9 guibg=#141414
hi Constant guifg=#727272 gui=bold
hi String guifg=#aaaaaa
hi Number guifg=#828282

hi NormalFloat guifg=#c9c9c9 guibg=#333333

hi Identifier guifg=#969696 gui=none
hi Function guifg=#969696

hi Statement guifg=#727272 gui=bold
hi Operator guifg=#c9c9c9 gui=none
hi Keyword guifg=#c9c9c9

hi PreProc guifg=#8c8c8c gui=none

hi Type guifg=#c9c9c9 gui=bold

hi Special guifg=#727272
hi SpecialComment guifg=#aaaaaa gui=bold

hi Title guifg=#8c8c8c gui=bold
hi Todo guifg=#5f5fd7 guibg=#282828
hi Comment guifg=#aaaaaa gui=italic

hi LineNr guifg=#666666 guibg=#141414 gui=none
hi FoldColumn guifg=#8c8c8c guibg=#141414 gui=none
hi CursorLine guibg=#282828 gui=none
hi CursorLineNr guifg=#d3d3d3 guibg=#282828 gui=none

hi Visual guifg=#282828 guibg=#828282
hi Search guifg=#333333 guibg=#b5b5b5 gui=none
hi IncSearch guifg=#282828 guibg=#8c8c8c gui=bold

hi SpellBad guifg=#870000 gui=undercurl
hi SpellCap guifg=#870000 gui=undercurl
hi SpellLocal guifg=#870000 gui=undercurl
hi SpellRare guifg=#875f00 gui=undercurl

hi Error guifg=#870000 gui=bold
hi ErrorMsg guifg=#870000 
hi WarningMsg guifg=#875f00 
hi ModeMsg guifg=#aaaaaa
hi MoreMsg guifg=#aaaaaa

hi MatchParen guifg=#87005f

hi Cursor guibg=#bfbfbf
hi Underlined guifg=#969696 gui=underline
hi SpecialKey guifg=#666666
hi NonText guifg=#666666
hi Directory guifg=#969696

hi Pmenu guifg=#aaaaaa guibg=#5b5b5b gui=none
hi PmenuSbar guifg=#282828 guibg=#efefef gui=none
hi PmenuSel guifg=#5b5b5b guibg=#aaaaaa
hi PmenuThumb guifg=#5b5b5b guibg=#a0a0a0 gui=none

hi StatusLine guifg=#b5b5b5 guibg=#5b5b5b gui=none
hi StatusLineNC guifg=#666666 guibg=#333333 gui=none
hi WildMenu guifg=#969696
hi VertSplit guifg=#5b5b5b guibg=#5b5b5b gui=none

hi DiffAdd guifg=#141414 guibg=#00875f
hi DiffChange guifg=#141414 guibg=#005f87
hi DiffDelete guifg=#141414 guibg=#870000
hi DiffText guifg=#282828 guibg=#00afff
hi DiffAdded guifg=#00875f
hi DiffChanged guifg=#005f87
hi DiffRemoved guifg=#870000

hi! link Character Constant
hi! link Float Number
hi! link Boolean Number

hi! link SignColumn FoldColumn
hi! link ColorColumn FoldColumn
hi! link CursorColumn CursorLine

hi! link Folded LineNr
hi! link Conceal Normal
hi! link ErrorMsg Error

hi! link Conditional Statement
hi! link Repeat Statement
hi! link Label Statement
hi! link Exception Statement

hi! link Include PreProc
hi! link Define PreProc
hi! link Macro PreProc
hi! link PreCondit PreProc

hi! link StorageClass Type
hi! link Structure Type
hi! link Typedef Type

hi! link SpecialChar Special
hi! link Tag Special
hi! link Delimiter Special
hi! link Debug Special
hi! link Question Special

hi! link VisualNOS Visual
hi! link TabLine StatusLineNC
hi! link TabLineFill StatusLineNC
hi! link TabLineSel StatusLine

hi RedSign guifg=#cc241d ctermfg=124 guibg=#282828 gui=NONE cterm=NONE
hi YellowSign guifg=#fabd2f ctermfg=214 guibg=#282828 gui=NONE cterm=NONE
hi GreenSign guifg=#b8cc26 ctermfg=142 guibg=#282828 gui=NONE cterm=NONE
hi BlueSign guifg=#83a5cb ctermfg=109 guibg=#282828 gui=NONE cterm=NONE
hi AquaSign guifg=#8ec07c ctermfg=108 guibg=#282828 gui=NONE cterm=NONE

hi RedHover guifg=#cc241d ctermfg=124 gui=NONE cterm=NONE
hi YellowHover guifg=#fabd2f ctermfg=214 gui=NONE cterm=NONE
hi OrangeHover guifg=#fd7d2f ctermfg=214 gui=NONE cterm=NONE
hi GreenHover guifg=#b8cc26 ctermfg=142 gui=NONE cterm=NONE
hi BlueHover guifg=#83a5cb ctermfg=109 gui=NONE cterm=NONE
hi AquaHover guifg=#8ec07c ctermfg=108 gui=NONE cterm=NONE
hi WhiteHover guifg=#ffffff ctermfg=108 gui=NONE cterm=NONE

hi Todo guifg=#eeeeee ctermfg=255 guibg=NONE ctermbg=NONE gui=bold cterm=bold

hi ShadyFg3 guifg=#bdae93 ctermfg=248 guibg=NONE ctermbg=NONE
hi ShadyFg1 guifg=#ebdbb2 ctermfg=223 guibg=NONE ctermbg=NONE
hi ShadyBg2 guifg=#504945 ctermfg=239 guibg=NONE ctermbg=NONE
hi ShadyBlue guifg=#83a598 ctermfg=109 guibg=NONE ctermbg=NONE
hi ShadyBrightBlue guifg=#a5c7ff ctermfg=109 guibg=NONE ctermbg=NONE
hi ShadyAqua guibg=#8ec07c ctermbg=108
hi ShadyGray guifg=#928374 ctermfg=245 guibg=NONE ctermbg=NONE
hi ShadyYellow guifg=#fabd2f ctermfg=214 guibg=NONE ctermbg=NONE
hi ShadyOrange guifg=#fe8019 ctermfg=208 guibg=NONE ctermbg=NONE

hi! link ALEErrorSign RedSign
hi! link ALEWarningSign YellowSign
hi! link ALEStyleErrorSign RedSign
hi! link ALEStyleWarningSign YellowSign
hi! link ALEInfoSign BlueSign

hi! link SignifySignAdd GreenSign
hi! link SignifySignChange AquaSign
hi! link SignifySignDelete RedSign

hi! link StartifyBracket ShadyFg3
hi! link StartifyFile ShadyFg1
hi! link StartifyNumber ShadyBlue
hi! link StartifyPath ShadyGray
hi! link StartifySlash ShadyGray
hi! link StartifySection ShadyYellow
hi! link StartifySpecial ShadyBg2
hi! link StartifyHeader ShadyOrange
hi! link StartifyFooter ShadyBg2

hi! link Sneak ShadyAqua
hi SneakLabel guifg=#fe8019 ctermfg=208 guibg=#504945 ctermbg=239
hi! link SneakScope ShadyAqua

hi! link MatchParen ShadyOrange

hi! link DiffAdded GreenSign
hi! link DiffChanged BlueSign
hi! link DiffRemoved RedSign

hi! link SpellBad RedSign
hi! link Error RedSign
hi! link ErrorMsg RedSign

hi YellowFloat guifg=#cccc00 guibg=#282828 gui=NONE cterm=NONE

" gray
if has('nvim') || v:version >= 800
  highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
else
  highlight! CmpItemAbbrDeprecated guibg=NONE gui=underline guifg=#808080
endif

highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
highlight! CmpItemKindClass guibg=NONE guifg=#EE9D28
" highlight! CmpItemKindConstant guibg=NONE guifg=
highlight! CmpItemKindConstructor guibg=NONE guifg=#B180D7
highlight! CmpItemKindEnum guibg=NONE guifg=#EE9D28
highlight! CmpItemKindEnumMember guibg=NONE guifg=#75BEFF
highlight! CmpItemKindEvent guibg=NONE guifg=#EE9D28
highlight! CmpItemKindField guibg=NONE guifg=#75BEFF
highlight! CmpItemKindFile guibg=NONE guifg=#8ec07c
highlight! CmpItemKindFolder guibg=NONE guifg=#8ec07c
highlight! CmpItemKindFunction guibg=NONE guifg=#B180D7
highlight! CmpItemKindInterface guibg=NONE guifg=#75BEFF
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindMethod guibg=NONE guifg=#B180D7
highlight! CmpItemKindModule guibg=NONE guifg=#fabd2f
highlight! CmpItemKindNamespace guibg=NONE guifg=#fabd2f
highlight! CmpItemKindOperator guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindPackage guibg=NONE guifg=#fabd2f
" highlight! CmpItemKindReference guibg=NONE guifg=
highlight! CmpItemKindSnippet guibg=NONE guifg=#fe8019
highlight! CmpItemKindStruct guibg=NONE guifg=#EE9D28
" highlight! CmpItemKindText guibg=NONE guifg=
highlight! CmpItemKindTypeParameter guibg=NONE guifg=s:palette.red
" highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindVariable guibg=NONE guifg=#75BEFF

if has('nvim') || v:version >= 800
  let g:nazgul_loaded = v:true
else
  let g:nazgul_loaded = 1
endif

