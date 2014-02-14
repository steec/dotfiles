" Vim color file
" Maintainer:   [smeagol] <webmaster@quantumz.net>
" Last Change:  
" URL:		

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

" your pick:
set background=light	" or light
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="bog"

hi Normal guifg=#3a3a3d guibg=white ctermfg=black ctermbg=NONE

" OR

" highlight clear Normal
" set background&
" highlight clear
" if &background == "light"
"   highlight Error ...
"   ...
" else
"   highlight Error ...
"   ...
" endif

" A good way to see what your colorscheme does is to follow this procedure:
" :w 
" :so % 
"
" Then to see what the current setting is use the highlight command.  
" For example,
" 	:hi Cursor
" gives
"	Cursor         xxx guifg=bg guibg=fg 
 	
" Uncomment and complete the commands you want to change from the default.

hi Cursor guifg=#04ae6c	guibg=#0056a0 ctermfg=green ctermbg=darkblue	
"hi CursorIM	
hi Directory guifg=green ctermfg=green	
"hi DiffAdd		
"hi DiffChange	
"hi DiffDelete	
"hi DiffText	
hi ErrorMsg guibg=#004a8a guifg=white ctermfg=white ctermbg=darkblue	
hi VertSplit guibg=#04ae6c guifg=#0056a0	
hi Folded guibg=#0a62c4 guifg=#60abff ctermfg=lightgrey ctermbg=blue		
hi FoldColumn guibg=#0a62c4 guifg=#60abff ctermfg=lightgrey ctermbg=blue	
hi IncSearch guifg=white guibg=#ffdc34 ctermfg=white ctermbg=lightred gui=underline	
hi LineNr guifg=#3669e8 guibg=white ctermfg=blue ctermbg=NONE		
hi ModeMsg guifg=orange guibg=white ctermfg=red ctermbg=NONE		
hi MoreMsg guifg=orange guibg=white ctermfg=red ctermbg=NONE		
hi NonText gui=bold		
hi Question guifg=white guibg=orange ctermfg=white ctermbg=lightred	
hi Search guifg=white guibg=#ffdc34 ctermfg=white ctermbg=lightred gui=underline		
"hi SpecialKey	
hi StatusLine guifg=#04ae6c guibg=white ctermfg=green ctermbg=NONE
hi StatusLineNC guifg=#04ae6c guibg=white ctermfg=green ctermbg=NONE	
hi Title guifg=#02233f gui=bold	
hi Visual guifg=darkblue guibg=white ctermfg=blue ctermbg=NONE		
"hi VisualNOS	
hi WarningMsg guifg=white guibg=orange ctermfg=white ctermbg=lightblue	
hi WildMenu guifg=#75dc34 guibg=white ctermfg=lightgreen ctermbg=NONE	
"hi Menu		
"hi Scrollbar	
"hi Tooltip		

" syntax highlighting groups
hi Comment guifg=orange guibg=white ctermbg=NONE ctermfg=darkgray
hi Constant  guifg=#5b8f8d guibg=white ctermfg=darkred ctermbg=NONE	
hi Identifier guifg=#aad2ff guibg=white ctermfg=magenta ctermbg=NONE	
hi Statement guifg=#808283 guibg=white ctermfg=darkgreen ctermbg=NONE	
hi PreProc guifg=#023a6a gui=bold guibg=white ctermfg=darkmagenta ctermbg=NONE                                                                     
hi Type guifg=#0e9152 guibg=white ctermfg=darkblue ctermbg=NONE		
hi Special guifg=white guibg=skyblue ctermfg=darkyellow ctermbg=NONE
hi Underlined guifg=#00d0e8 ctermbg=blue	
hi Ignore guifg=black guibg=white ctermfg=black ctermbg=NONE		
"hi Error		
hi Todo guibg=lightblue guifg=white ctermbg=blue ctermfg=white		
