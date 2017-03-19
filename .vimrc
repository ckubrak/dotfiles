set nocompatible              " be iMproved, required
filetype off                  " required
execute pathogen#infect()

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'tpope/vim-surround' 
Plugin 'tmhedberg/SimpylFold'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'rainbow_parentheses.vim'

filetype plugin indent on    " required
syntax on

" Remap leader to ,
let mapleader = ","

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
"
" " Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
"
" " Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'
"
" " Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
"
" " Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
"
" " Allow commenting and inverting empty lines (useful when commenting a
" region)
let g:NERDCommentEmptyLines = 1
"
" " Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1



" NerdTree bullshit
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" Map NERDTree with Control-N
map <leader>n :NERDTreeToggle<CR>




" Vim-airline bullshit
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	  let g:airline_symbols = {}
  endif
let g:airline_symbols.space = "\ua0"
set laststatus=2
set noshowmode
 
let g:airline_left_sep=' '
let g:airline_right_sep=' '






" Ignore files in .gitignore in C-P
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']



" Syntastic bullshit
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Utilsnips bullshii
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Solarized
" set background=dark
colorscheme apprentice
" let g:solarized_termcolors=256


" Switch between workspaces
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>


"Copy to clipboard in visual mode with Control-C
vmap <C-c> "+y         


syntax enable           " enable syntax processing
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set number              " show line numbers
set relativenumber              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set showmatch           " highlight matching [{()}]
set t_Co=256		" set 256 colors

set expandtab           " enter spaces when tab is pressed
set textwidth=120       " break lines when line length increase
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent

" Haskell
autocmd Filetype Haskell setlocal set tabstop=8 set expandtab set softtabstop=4 set shiftwidth=4 set shiftround


let g:neocomplete#enable_at_startup = 1         " enable neocomplete
let g:gist_clip_command = 'xclip -selection clipboard' " add -c option for Gist
let g:gist_detect_filetype = 1 " gist dettects filetype
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1

" Enable folding
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1 "View docstrings while folded
" Enable folding with the spacebar
nnoremap <space> za



nnoremap gf <C-W>f



set splitright " Right split buffers
set splitbelow " Left split buffers

" Create a private Gist
nnoremap <Leader>gg :Gist -p<CR>


" Fugitive
nnoremap <leader>a :Gwrite<CR> 
nnoremap <leader>co :Gcommit<CR>
nnoremap <leader>b :Gblame<CR>

nnoremap <leader>] :vertical resize +5<CR>
nnoremap <leader>[ :vertical resize -5<CR>
nnoremap <leader>- :resize -5<CR>
nnoremap <leader>= :resize +5<CR>

" Save file with out quiting
nnoremap xx :w<CR>
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar"


" Rainbow Parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Rainbow Parentheses Colors
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
\ ]
" Backup, swap, undo in another directoty (First do mkdir -p ~/.vim/{backup_files,swap_files,undo_files})
set backupdir=~/.vim/backup_files//
set directory=~/.vim/swap_files//
set undodir=~/.vim/undo_files//
