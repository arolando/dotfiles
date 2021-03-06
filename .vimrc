" break with the busted old vi junk
" must be first
set nocompatible
filetype off

""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""

" vundle stuff
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" vundle repo
Bundle 'gmarik/vundle'

" productivity
Bundle "ervandew/supertab"
Bundle "Valloric/YouCompleteMe"
Bundle "SirVer/ultisnips"
Bundle "honza/vim-snippets"
Bundle "vim-scripts/bufkill.vim"
Bundle "kien/ctrlp.vim"
Bundle "tpope/vim-commentary"
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "terryma/vim-multiple-cursors"
Bundle "tpope/vim-surround"
Bundle "bling/vim-airline"

" misc
Bundle "editorconfig/editorconfig-vim"
Bundle "vim-scripts/gitignore"

" language specific
Bundle "othree/html5.vim"
Bundle "cakebaker/scss-syntax.vim"
Bundle "fatih/vim-go"
Bundle "pangloss/vim-javascript"
Bundle "hail2u/vim-css3-syntax"
Bundle "plasticboy/vim-markdown"
Bundle "saltstack/salt-vim"
Bundle "rust-lang/rust.vim"
Bundle "jwalton512/vim-blade"

" error handling
Bundle "nvie/vim-flake8"
Bundle "scrooloose/syntastic"

" custom file ignores
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$\|bower_components$\|dist$\|node_modules$\|project_files$\|test$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

" LESS Syntax
nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR><space>

" Airline show
set laststatus=2

" GoImport on save as well as formatting
autocmd BufWritePre *.go call go#fmt#Format(1)

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

""""""""""""""""""""""""""""""""""""""""
" General VIM
""""""""""""""""""""""""""""""""""""""""

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" show line numbers
set number

" show lines in lower right
set ruler

" don't wrap lines ever
set nowrap

" Set to auto read when a file is changed from the outside
set autoread

" don't automatically break long lines unless they are new
set formatoptions+=l

" detect file type, turn on that type's plugins and indent preferences
filetype plugin on
filetype plugin indent on

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" allow background buffers
set hidden

" global tab settings
set expandtab
set smarttab
set textwidth=79
set fileformat=unix
set tabstop=4
set softtabstop=4
set shiftwidth=4

" ignore these nonsense files
set wildignore=*.swp,*.bak,*.pyc,*.class

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

" no backups, please!
set nobackup
set noswapfile

" keep a longer history
set history=1000

" enable folding
set foldmethod=indent
set foldlevel=99

" make file/command tab completion useful
set wildmode=list:longest

" clipboard fusion!
set clipboard^=unnamed clipboard^=unnamedplus

" Source the vimrc file after saving it.
" This way, you don't have to reload Vim to see the changes.
if has("autocmd")
 augroup myvimrchooks
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc
 augroup END
endif

" No arrow keys!
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" Relative numbers by default
set relativenumber

" Toggle relative line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

" Automatically set absolute numbers in insert mode
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""

" set leader
let mapleader = ","

" Easily switch between line number styles
nnoremap <leader>n :call NumberToggle()<cr>

" switch between files with <leader><leader>
nnoremap <leader><leader> <c-^>

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Remap VIM 0 to first non-blank character
map 0 ^

" set jj to exit insert mode
imap jj <Esc>

" Map ,g to tag definition
map <leader>g g]

" reselect when indenting
vnoremap < <gv
vnoremap > >gv

" ctrlp commands
nnoremap <leader>t :CtrlP<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>f :CtrlPClearCache<cr>

" build bundles
nnoremap <leader>i :BundleInstall

" /// for vim-commentary
nmap /// <Plug>CommentaryLine

" shortcut to save files that are in READONLY mode easily
cmap w!! w !sudo tee % >/dev/null

""""""""""""""""""""""""""""""""""""""""
" Searching
""""""""""""""""""""""""""""""""""""""""

" show search matches as you type
set incsearch

" clear the search buffer when hitting return
nnoremap <CR> :nohlsearch<cr>

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" highlight search results
set hlsearch

""""""""""""""""""""""""""""""""""""""""
" Aesthetics
""""""""""""""""""""""""""""""""""""""""

" keep cursor somewhat centered
set scrolloff=3

" highlight current line
:set cursorline

" remove gVim gui
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar

" invert and bold status line
set highlight=sbr

" enable syntax highlighting
syntax on

"tell the term has 256 colors
set t_Co=256

set background=dark
colorscheme jellybeans

set guitablabel=%M%t
if has("gui_running")
    set lines=40
    set columns=115
endif
set guifont=Inconsolata\ Medium\ 10

" invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
highlight CursorLine guibg=#333
highlight LineNr guifg=#444
highlight Cursor guibg=#444

" highlight col 80
set colorcolumn=80
highlight ColorColumn guibg=#333

" extra whitespace sucks, make it RED
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
