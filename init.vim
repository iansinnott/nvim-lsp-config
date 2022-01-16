" >> load plugins
call plug#begin(stdpath('data') . 'vimplug')
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
  " @todo Pressing q in the telescope window clsoes it
  " @todo Generally, need to figure out how to map keys in telescope mode
  " @done Telescope shortcuts start in insert mode
  Plug 'nvim-telescope/telescope.nvim'

  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer', { 'branch': 'main' }
  Plug 'hrsh7th/nvim-compe'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'

  Plug 'glepnir/galaxyline.nvim', { 'branch': 'main' }
  Plug 'kyazdani42/nvim-web-devicons'  " needed for galaxyline icons

  Plug 'NLKNguyen/papercolor-theme'
  " Plug 'nikvdp/neomux'

  Plug 'tpope/vim-ragtag'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'

  Plug 'tpope/vim-eunuch'
  "Plug 'tpope/vim-fugitive'

  " LSP stuff
  "Plug 'kabouzeid/nvim-lspinstall', {'branch': 'main'}
  Plug 'glepnir/lspsaga.nvim', {'branch': 'main'}

  " Icons used by galaxyline and many other plugins
  Plug 'kyazdani42/nvim-web-devicons'

  " Tab bar for fun and profit
  Plug 'romgrk/barbar.nvim'

  " Which key
  Plug 'folke/which-key.nvim', { 'branch': 'main' }

  " File tree viewer
  " @todo Tree viewer keybindings
  " @todo Opening a dir opens a full screen tree viewer. The buffer is throwing 'modifiable' is off errors
  " @todo Rename functionality works
  Plug 'kyazdani42/nvim-tree.lua'

  " Auto commenting
  Plug 'tomtom/tcomment_vim'
                 
  " Misc
  Plug 'chrisbra/matchit'
  Plug 'tpope/vim-repeat'
  Plug 'wellle/targets.vim'
  Plug 'Raimondi/delimitMate'
  Plug 'jeetsukumaran/vim-markology'
call plug#end()





" basic settings
syntax on

" Whether or not we're in the kitty term. What's the best way to do this? Maybe
" checking the $TERM env var would be more robust. For now this works. Need dto
" move everything to lua if I'm going to rewrite things like this.
let g:has_kitty_gui = stridx(expand('$TERMINFO'), 'kitty') != -1

" Colorscheme
" @note Order is important. Enable the colorscheme last
set termguicolors " Recommended by nvim-tree to get icon coloration
set background=dark " Necessary for some color schemes
colorscheme PaperColor

" Set the font here?
set guifont=FiraCode\ Nerd\ Font:h14

set nocompatible " We do not care for Vi compatibility
set clipboard=unnamed " yank and paste with the system clipboard
set hlsearch " Visually highlight search terms when searching
set incsearch " Search as you type
set ignorecase smartcase " Searches are case insensitive unless search starts with a capital letter
set encoding=utf-8 " Necessary for powerline fonts (airline plugin)
set fileencoding=utf-8 " Write files as UTF-8. Does not convert files when read
set number " Show line numbers
set tabstop=2 " The number of spaces a tab takes up visually
set softtabstop=2 " The number of spaces a tab character represents
set shiftwidth=2 " Auto indentation means two spaces
set expandtab " Turn tabs to spaces
set autoread " Automatically re-read files from disk if they change
set noswapfile " Do not use swapfiles
set nobackup " Don't need vim backups if you use Git for your source
set cursorline " highlight the current line.
set wildmenu " This makes tab completions in command mode awesome
set wildmode=longest,list,full " see :h wildmode
set textwidth=80 " Max length of a line while typing. Can be overridden with joins
set nolist " Don't show many hidden characters
set nowrap " Do not wrap lines
set lazyredraw " Only redraw when necessary. See :h lz
set scrolloff=5 " Maintain at least three lines from top or bottom of screen
set ttyfast " Very fast TTY. Many configs I've seen have this, so...
set laststatus=2 " Always show status bar (Vim Airline)
set synmaxcol=500 " Don't highlight lines longer than 500 such as minified files
set splitright " Split new windows into right position. I find this more intuitive
set hidden " Allow switching buffers without saving
set autoindent
set mouse=a  " mouse support
set number " Decided to remove relativenumber as I was not using numbered commands
set virtualedit=all
set backspace=indent,eol,start " allow backspacing over everything in insert mode

" Only display alphanumeric marks
let g:markology_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.'"
" Don't automatically make mappings
let g:markology_disable_mappings=1

" set leader key to ,
let g:mapleader=","

" >> Telescope bindings
nnoremap <Leader>pp <cmd>lua require'telescope.builtin'.builtin{}<CR>

" most recently used files
nnoremap <Leader>m <cmd>lua require'telescope.builtin'.oldfiles{}<CR>

" find buffer
nnoremap ; <cmd>lua require'telescope.builtin'.buffers{}<CR>

" find in current buffer
nnoremap <Leader>/ <cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>

" bookmarks
nnoremap <Leader>' <cmd>lua require'telescope.builtin'.marks{}<CR>

" git files
nnoremap <Leader>f <cmd>lua require'telescope.builtin'.git_files{}<CR>

" all files
nnoremap <Leader>bfs <cmd>lua require'telescope.builtin'.find_files{}<CR>

" ripgrep like grep through dir
nnoremap <Leader>rg <cmd>lua require'telescope.builtin'.live_grep{}<CR>

" pick color scheme
nnoremap <Leader>cs <cmd>lua require'telescope.builtin'.colorscheme{}<CR>


" >> setup nerdcomment key bindings
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1

xnoremap <Leader>ci <cmd>call NERDComment('n', 'toggle')<CR>
nnoremap <Leader>ci <cmd>call NERDComment('n', 'toggle')<CR>


" >> Lsp key bindings
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <C-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gh     <cmd>Lspsaga hover_doc<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-p> <cmd>Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> <C-n> <cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> gf    <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> gn    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> ga    <cmd>Lspsaga code_action<CR>
xnoremap <silent> ga    <cmd>Lspsaga range_code_action<CR>
nnoremap <silent> gs    <cmd>Lspsaga signature_help<CR>

let mapleader = ','
let maplocalleader = ','

" Use spacebar as colon for using vim command line
" @note As it happens, this plays nicely with the leader mapping. They can both
" be mapped to space.
"nnoremap <space> :
"vnoremap <space> :
" nnoremap <space> <cmd>WhichKey<cr>
" vnoremap <space> <cmd>WhichKey<cr>

" Spacemacs like. 'File Save'
" NOTE If I change space to leader rather than : then I will need to redo these
" mappings. That would probably be better though
" nnoremap <leader>fs :w<cr>
" nnoremap <leader>bd :bd<cr>
" nnoremap <leader>qf :q<cr>
" nnoremap <leader>qq :q<cr>
" nnoremap <leader>wk :q<cr>
" nnoremap <leader>pf :q<cr>
" nnoremap <leader>fed :edit $MYVIMRC<cr>
" nnoremap <leader>feR :source $MYVIMRC<cr>

nnoremap <leader>ss :lua require'telescope.builtin'.current_buffer_fuzzy_find{}<cr>

" Quickly switch between panes using CTRL + <direction>
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Commenting
nnoremap <d-/> :TComment<cr>
inoremap <d-/> <esc>:TComment<cr>a
vnoremap <d-/> :TComment<cr>

" @todo This needs to start in insert mode
nnoremap <d-p> <cmd>Telescope find_files<cr>
nnoremap <c-p> <cmd>Telescope find_files<cr>
" nnoremap <d-p> :lua require'telescope.builtin'.find_files<cr>
nnoremap <leader>ss :lua require'telescope.builtin'.current_buffer_fuzzy_find{}<cr>

" Same as above, but with arrow keys. The reason for this is not actually to
" use arrow keys for moving between panes, but rather to fix the intended
" functionality on my system where I have CTRL + hjkl mapped to the four
" directions globally.
nnoremap <expr> <left> BufLeftOrFileTree()
nnoremap <down> <c-w>j
nnoremap <up> <c-w>k
nnoremap <right> <c-w>l

" Make switching window placement easy.
noremap <C-H> <c-w>H
noremap <C-J> <c-w>J
noremap <C-K> <c-w>K
noremap <C-L> <c-w>L

" I also find that the capitalize action is more useful than backticks since '
" is already mapped to backtick for certain things
" @note I still use these mappings, however in my terminals this remapping is
" done at the system level. iTerm and kitty both have a karabiner mapping that
" remaps this, since I rarely use backtick when using the terminal.
" nnoremap ` ~
" nnoremap ~ `

" Use jk as escape in insert
" NOTE: I don't think this actually works in vscode. The mapping is in
" keybindings.json
inoremap jk <esc>

" H/L move to the start or end of a line respectively
nnoremap <s-h> ^
nnoremap <s-l> g_
vnoremap <s-h> ^
vnoremap <s-l> g_

" Add the 'to end of line motion' and 'to beginning of line motion' as omaps so
" they can be used with d and c. Doesn't work for v though, thus the two mappings
" above.
onoremap L :<c-u>normal! vg_<cr>
onoremap H :<c-u>normal! v^<cr>

" Slightly quicker vertical jumps. Use command for 10 line jumps (defined in gvimrc)
nnoremap <s-j> 5j
vnoremap <s-j> 5j
nnoremap <s-k> 5k
vnoremap <s-k> 5k

" Insert a new line without leaving normal node using <cr>
nnoremap <cr> o<esc>

" Allow quick yanking and pasting of lines without moving the colum of the cursor
nnoremap yp mtyyp`tj

" Similar to above. Allow quick line swapping. Would be nice to preserve cursor
" column here as well but it seems more involved. Of course I could just be
" overlooking some simple usage of vim, but if i'm not then I would need to
" create a function to keep track of the column and row, perform the deletion
" and yank, then restore the column and row + 1. All because the mark on the
" line gets deleted along with the line so the approach taken with `yp` won't
" work
nnoremap dp ddp

" Source or edit this file quickly. Useful for tweaking config
nnoremap ,ev :edit $MYVIMRC<cr>
nnoremap ,sv :source $MYVIMRC<cr>

" Clear highlighted search terms on demand
nnoremap <silent> ,/ :nohlsearch<cr>

" Makes moving up and down multiline wrapped blocks of text more intuitive
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Make some common mark jumps character-wise instead of line-wise. Since going to
" a specific character will necessarily take you to that line in the code I see
" no benefit from a line-wise jump that a character-wise jump doesn't give you
nnoremap '' ``

" I never have occasion to use backticks in command mode, but I do use tilde
" often enough when typing out file paths. So switch the two
" @todo Why doesn't this work?
" Oh, you know what I think it is? It's that in terminal I already having this
" mapped at the karabiner level. So this maps it back to the default unwittinly
" cnoremap ` ~
" cnoremap ~ `

" I also find that the capitalize action is more useful than backticks since '
" is already mapped to backtick for certain things
nnoremap ` ~
nnoremap ~ `

" Use capital Y for join, instead of the usual J. Think of the Y as two lines
" joining together. This also preserves the location of the cursor when joining
" lines, as opposed to the default behavior of moving the cursor to the
" beginning of the joined line.
nnoremap <s-y> mzJ`z

" Split lines at cursor (sister to join lines). The normal use of S is covered
" by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Select the last text you inserted using insert mode
nnoremap gV `[v`]

" Capitalize the word in to the left of the cursor. Might be interfered with by
" YouCompleteMe
" See: https://bitbucket.org/sjl/dotfiles/src/9bead8a9b4350c57f8a24a8119607a83a9592afe/vim/vimrc?at=default&fileviewer=file-view-default#vimrc-371:395
inoremap <c-u> <esc>mzgUiw`za

" Toggle spell checking
nnoremap ,ss :setlocal spell! spelllang=en_us<cr>

" Replace word under cursor with first suggestion without first showing it
nnoremap <c-c> 1z=

" Same as gf but it can be done from the beginning of the line because it will
" look for the first period before executing the command. Note that this will
" only work for relative paths, but that's ok
nnoremap gf f.gf

" Toggle folding
nnoremap zz za

" Search and replace globally and inline. The <c-r> command simply removes the
" inserted whitespace that is default with abbreviations. See :helpgrep Eatchar
" for more.
"
" The .,$s means search from current line to last line inclusive. Much more
" useful than %s which searches the whole file from the beginning, which is very
" annoying if the cursor is low in the doc.
" http://vim.wikia.com/wiki/Search_and_replace
cnoreabbrev <silent> ss .,$s/\v<C-R>=Chomp('\s')<cr>
cnoreabbrev <silent> sl s/\v<C-R>=Chomp('\s')<cr>

" Wrap the contents of a one-line if statement in brackets.
nnoremap ,{ dd<up>A<space>{}<left><cr><esc>P

" This throws a ; at the end of the current line
nnoremap ,; mqA;<esc>`q


" These are to correct issues I was seeing while using my hyper key. For
" whatever reason vim feels compelled sometimes to output the mapping of an
" unmapped key combination when in insert mode. This will prevent that.
inoremap <m-c-d-)> <nop>
inoremap <m-c-d-(> <nop>
inoremap <m-c-d-*> <nop>

" In normal mode I don't use number keys, so remap them to symbol keys
nnoremap 1 !
nnoremap 2 @
nnoremap 3 #
nnoremap 4 $
" NOTE: in order to use vim matchit i need a recursive mapping onthis one
nnoremap 5 %
nnoremap 6 ^
nnoremap 7 &
nnoremap 8 *
vnoremap 1 !
vnoremap 2 @
vnoremap 3 #
vnoremap 4 $
vnoremap 5 %
vnoremap 6 ^
vnoremap 7 &
vnoremap 8 *

" The inverse of the above
nnoremap ! 1
nnoremap @ 2
nnoremap # 3
nnoremap $ 4
nnoremap % 5
nnoremap ^ 6
nnoremap & 7
nnoremap * 8
vnoremap ! 1
vnoremap @ 2
vnoremap # 3
vnoremap $ 4
vnoremap % 5
vnoremap ^ 6
vnoremap & 7
vnoremap * 8


" These are all about replacement
cnoreabbrev <silent> ss .,$s/\v<C-R>=Chomp('\s')<cr>
cnoreabbrev <silent> sl s/\v<C-R>=Chomp('\s')<cr>
nnoremap <silent> <leader>ss :.,$s/\v<C-R>=Chomp('\s')<cr>
nnoremap <silent> <leader>sl :s/\v<C-R>=Chomp('\s')<cr>

" Place a mark at the cursor, or remove on if there already is one
nnoremap mm :MarkologyPlaceMarkToggle<cr>

" @note These are only for goneovim because it does not allow pasting by
" default. See https://github.com/akiyosi/goneovim/issues/163
nnoremap <D-v> a<C-r>+<Esc>
inoremap <D-v> <C-r>+
cnoremap <D-v> <C-r>+

" New mappings here

" ===========================================
" Gvim mappings
" ===========================================
"
" @note These require a gui app that can send command sequences through to
" neovim.
vnoremap <d-j> 10j
vnoremap <d-k> 10k
nnoremap <d-j> 10j
nnoremap <d-k> 10k

" @todo Make this work. These command mappings are not getting through to vim. I
" think they are getting caught up in kitty because they are normally mapped to
" tab switching.
" Tab (i.e. buffer) switching
nnoremap <d-{> :bp<cr>
nnoremap <d-}> :bn<cr>
inoremap <d-{> <esc>:bp<cr>
inoremap <d-}> <esc>:bn<cr>

" Slim down session options. This is probably almost always what I want. By
" default vim sessions seem to store a significant part of vimrc in the session.
" That's what `options` does i'm guessing. Don't forget you can get the session
" back from the CLI using `mvim -S <sessionfile>`. See:
" https://stackoverflow.com/a/1651061/2464320
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds

" Set up persistent undo. This is part of why we don't need swapfiles or
" backups.
if has('persistent_undo') " This feature only exists in 7.3+
  set undodir=$HOME/.nvim/vimundo/ " Directory to hold our undo history
  set undofile " Allow vim to remember undo changes even after quitting
  set undolevels=3000 " A bit more than the default of 1000
endif

" let g:is_bash = 1

" Enable postgres highlighting for all sql files
" let g:sql_type_default = 'pgsql'

" Highlight all the python!
" let g:python_highlight_all = 1

" set updatetime=300
" set pyxversion=3
" let g:python3_host_prog = '/usr/local/bin/python3'

" Chomp characters that match pattern. Useful in abbreviations if the trailing
" space is not desired.
function! Chomp(pattern)
  let c = nr2char(getchar(0))
  return (c =~ a:pattern) ? '' : c
endfunction


" Open the directory of the current file in finder.
function! Open()
  :execute ':silent !open %:p:h'
endfunction
command! Open call Open()

function! Pwd()
  echo 'Current File Path: ' . expand('%:h')
endfunction
command! Pwd call Pwd()

" If we are in the leftmost window and it's _not_ vimfiler, then open vimfiler.
" Otherwise just go thee the left window as usual. The effect is that when mapped
" to <left> I can hit <left> to 'move' to the vimfiler buffer even when it's not
" open.
" @note This is a vim import. Seewms it might be better to write this as lua
function! BufLeftOrFileTree()
  " We're in the first buffer and file tree is not open. Open it.
  " Otherwise Switch to the left buffer using <c-w>h
  if winnr() ==# 1 && bufname('') !=# 'NvimTree'
    return ":NvimTreeFindFile\<cr>"
  else
    return "\<C-w>h"
  endif
endfunction

command! Find call NvimTreeFindFile()


lua <<EOF
require("lsp")
require("treesitter")
require("statusbar")
require("completion")
require("file_tree")
require("which_key")

EOF
