" Configuration for neovim-qt 
"

" Enable Mouse
set mouse=a

" Set font
set guifont=FiraCode\ Nerd\ Font:h14

if exists(':GuiTabline')
    GuiTabline 0
endif

" Try to handle popup completion menu with qt?
if exists(':GuiPopupmenu')
    GuiPopupmenu 1
endif

" Those sweet sweet ligatures.
if exists(':GuiRenderLigatures')
    GuiRenderLigatures 1
endif

" Hide GUI ScrollBar
if exists(':GuiScrollBar')
    GuiScrollBar 0
endif

" Enable clipboard? https://github.com/equalsraf/neovim-qt/issues/298
call GuiClipboard()

" Right Click Context Menu (Copy-Cut-Paste)
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv
