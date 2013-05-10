set nocompatible

filetype off             " Turn off filetype plugins before bundles init

" Setting up Vundle - the vim plugin bundler
  let iCanHazVundle=1
  let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
  if !filereadable(vundle_readme)
    echo 'Installing Vundle..'
    echo ''
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
  endif
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()

  Bundle 'gmarik/vundle'

  " Add your bundles here

  " Snipmate dependencies
  Bundle 'MarcWeber/vim-addon-mw-utils'
  Bundle 'tomtom/tlib_vim'
  " Bundle 'honza/snipmate-snippets'

  Bundle 'garbas/vim-snipmate'
  Bundle 'jpalardy/vim-slime'
  Bundle 'mileszs/ack.vim'
  Bundle 'Raimondi/delimitMate'
  Bundle 'scrooloose/nerdtree'
  Bundle 'tomtom/tcomment_vim'
  Bundle 'tpope/vim-fugitive'
  Bundle 'tpope/vim-endwise'
  Bundle 'tpope/vim-repeat'
  Bundle 'tpope/vim-surround'
  Bundle 'tpope/vim-unimpaired'
  Bundle 'vim-scripts/FuzzyFinder'
  Bundle 'vim-scripts/L9'
  Bundle 'vim-scripts/vcscommand.vim'
  Bundle 'vim-scripts/tlib'

  Bundle 'othree/html5.vim'
  Bundle 'gregsexton/MatchTag'
  " Bundle 'skammer/vim-css-color'
  Bundle 'hail2u/vim-css3-syntax'
  Bundle 'lukaszb/vim-web-indent'
  Bundle 'walm/jshint.vim'

  Bundle 'miripiruni/CSScomb-for-Vim'

  " HTML/HAML
  " Bundle 'hokaccha/vim-html5validator'

  " CSS/LESS
  " JavaScript
  " Bundle 'pangloss/vim-javascript'
  " Bundle 'itspriddle/vim-jquery'
  " JSON
  " Bundle 'leshill/vim-json'

  " Bundle 'tpope/vim-rails'
  " Bundle 'tpope/vim-haml'
  " Bundle 'kchmck/vim-coffee-script'
  " Bundle 'klen/vim-jsmode'
  " Bundle 'mattn/gist-vim'

  if iCanHazVundle == 0
    echo 'Installing Bundles, please ignore key map error messages'
    echo ''
    :BundleInstall
  endif
" Setting up Vundle - the vim plugin bundler end


filetype plugin indent on
syntax on

" General options
set exrc secure             " Enable per-directory .vimrc files and disable unsafe commands in them

" Buffer options
set hidden                  " hide buffers when they are abandoned
set autoread                " auto reload changed files

" Display options
set title                   " show file name in window title
set novisualbell            " mute error bell
set list
set listchars=tab:⇥\ ,trail:·,extends:⋯,precedes:⋯,nbsp:~
set linebreak               " break lines by words
set scrolljump=5
set sidescroll=4
set sidescrolloff=10
set showcmd
set whichwrap=b,s,<,>,[,],l,h
set completeopt=menu,preview
set infercase
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set ttyfast                 " Optimize for fast terminal connections
set shortmess=atI           " Don’t show the intro message when starting Vim
set nostartofline

set wrap

" Tab options
set autoindent              " copy indent from previous line
set smartindent             " enable nice indent
set expandtab               " tab with spaces
set smarttab                " indent using shiftwidth"
set shiftwidth=4            " number of spaces to use for each step of indent
set tabstop=4
set softtabstop=4           " tab like 4 spaces
set shiftround              " drop unused spaces

" Search options
set gdefault                " Add the g flag to search/replace by default
set hlsearch                " Highlight search results
set ignorecase              " Ignore case in search patterns
set smartcase               " Override the 'ignorecase' option if the search pattern contains upper case characters
set incsearch               " While typing a search command, show where the pattern
nnoremap <silent> <cr> :nohlsearch<cr><cr>

" Matching characters
set showmatch               " Show matching brackets
set matchpairs+=<:>         " Make < and > match as well

" Localization
set langmenu=none            " Always use english menu
set keymap=russian-jcukenwin " Alternative keymap
highlight lCursor guifg=NONE guibg=Cyan
set iminsert=0               " English by default
set imsearch=-1              " Search keymap from insert mode
set spell
set spelllang=en             " Languages
set encoding=utf-8           " Default encoding
set fileencodings=utf-8,cp1251,koi8-r,cp866
set termencoding=utf-8
set fileformat=unix

" Wildmenu
set wildmenu                " use wildmenu ...
set wildcharm=<TAB>
set wildignore+=*.pyc        " ignore file pattern
set wildignore+=*.be.*,*.kk.*,*.tt.*,*.uk.*

" Folding
if has('folding')
  set foldmethod=indent
  set foldlevel=99
  " toggle folds with space
  nmap <space> za
endif

" Edit
set backspace=indent,eol,start " Allow backspace to remove indents, newlines and old tex"
" set virtualedit=block
set pastetoggle=<leader>p
set iskeyword+=-
set nobackup
set nowritebackup
set noswapfile
set noeol

set diffopt=filler
set diffopt+=vertical
set diffopt+=iwhite

if has("autocmd")

    augroup vimrc
    au!
        " Auto reload vim settings
        au BufWritePost *.vim source $MYVIMRC
        au BufWritePost .vimrc source $MYVIMRC

        " Restore cursor position
        au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
          \| exe "normal g'\"" | endif

        " Filetypes
        au FileType htmldjango set ft=html.htmldjango

        au FileType vim setlocal sw=2
        au FileType vim setlocal ts=2
        au FileType vim setlocal sts=2
        au FileType vim nnoremap <leader>x 0y$:<c-r>"<cr>

        au FileType scss set ft=scss.css
        au! FileType sass,scss syn cluster sassCssAttributes add=@cssColors

        au BufRead,BufNewFile *.js set ft=javascript.javascript-jquery
        au BufRead,BufNewFile *.json set ft=javascript
        " au BufRead,BufNewFile *.json set equalprg=python\ -mjson.tool
        au BufRead,BufNewFile *.xjst set ft=javascript

        au BufRead,BufNewFile *.less set ft=less.css

        au BufRead,BufNewFile *.plaintex set ft=plaintex.tex

        au BufRead,BufNewFile *.html nmap <leader>o :!open %<cr>

        " Avoid syntax-highlighting for files larger than 1MB
        au BufReadPre * if getfsize(expand("%")) > 1000*1024 | syntax off | endif

        " Auto close preview window
        autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
        autocmd InsertLeave * if pumvisible() == 0|pclose|endif

    augroup END

endif

set t_Co=256
let g:solarized_termcolors=256
let g:solarized_contrast='high'
let g:solarized_termtrans=1

" FuzzyFinder
let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp|pyc|jpg|png|gif|svg)$|(^|[/\\])(\.(hg|git|bzr)|tmp)($|[/\\])'
nnoremap <silent> <c-t> :FufFile **/<CR>
nnoremap <silent> <c-n> :FufBuffer<CR>

" NERDTree
let NERDTreeShowHidden=1
nmap <silent> <leader>t :NERDTreeToggle<CR>
nmap <silent> <leader>f :NERDTreeFind<CR>

" fugitive
autocmd BufReadPost fugitive://* set bufhidden=delete
nmap <silent> <leader>b :.Gblame<cr>
vmap <silent> <leader>b :Gblame<cr>
nmap <silent> <leader>g :Gstatus<cr>
nmap <silent> <leader>w :Gwrite<cr>

" delimitMate
let delimitMate_matchpairs = '(:),[:],{:}'
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1

nmap <leader>s :w<cr>
imap <leader>s <esc>:w<cr>

" OPTIMIZE: try to improve behavior
nnoremap Q <c-w>s:bp<cr><c-w>j:bd<cr>
" nnoremap Q :bd<cr>

" vmap <expr> p strlen(getline('.')) == col('.') ? '"_dp' : '"_dP'

nmap <leader>j :JSHint<cr>

" Open files
" Do not set autochdir (working dir should be root)
nnoremap <leader>e :e <c-r>=expand("%:h")<cr>/
nnoremap <leader>d :diffsplit <c-r>=expand("%:h")<cr>/
cmap <leader>e <c-r>=expand("%:h")<cr>/

nnoremap <silent> <leader>vi :e ~/.vimrc<cr>
nnoremap <silent> <leader>vs :e ~/.vim/snippets/javascript.snippets
nnoremap <silent> <leader>vp :vsp <c-r>=expand("%:h")<cr>/

so ~/.vim/snippets/support_functions.vim

" Some grep stuff
" let g:ackprg="ack-grep -H --nocolor --nogroup --column"
nmap <leader>a :Ack 
" nmap <m-f> g*:Ack <c-r>/ app

" Slime-vim
xmap gx <Plug>SlimeRegionSend
" WARN: netrwPlugin has the same mapping
nmap gx <Plug>SlimeParagraphSend

command! KillWhitespace :normal :%s/ *$//g<cr><c-o><cr>

function! SQLUpperCase()
  %s:\<analyze\>\|\<and\>\|\<as\>\|\<by\>\|\<desc\>\|\<exists\>\|\<explain\>\|\<from\>\|\<group\>\|\<in\>\|\<insert\>\|\<intersect\>\|\<into\>\|\<join\>\|\<limit\>\|\<not\>\|\<on\>\|\<order\>\|\<select\>\|\<set\>\|\<update\>\|\<where\>:\U&:gi
endfunction

" Creating macros
" :redir @a>
" :history : -20,
" :redir END
" "ap

" Regexp notes
" /text1\(text2\)\@= 'text1' followed by 'text2'
" /\(text1\)\@<=text2  'text2' preceded with 'text1'

" multiword search
" vnoremap * yq/p<cr>

set guifont=Monaco:h13

" find global variables
" ^\s*var \(\w\+\s*\(=.*\)\?,\(\s*\/\/.*\)\?\_\s\+\)\+\w\+\s*\(=.*\)\?;\_\s\+\w\+\s*\(=.*\)\?;

function! JsStyling()
  retab
  KillWhitespace
  %s:){:) {:e
  %s:\(if\|while\|for\)\s*(\s*:\1 ( :e
  %s:}\_\s*else\s*{:} else {:e
  g:\<if\>\|\<for\>:s:\s*) {$: ) {:e
  %s:\(\S\)\s*\(&&\|||\)\s*:\1 \2 :ge

  s:[,;{]:&\r:g
  s:}:\r&:g
  s:=\([!=\s]\)\@!:= :g
  s:\([!=\s]\)\@<!=: =:g
endfunction

set background=light
colorscheme solarized

if has('gui_running')
  source ~/.vim/.gvimrc
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

if &term =~ "xterm"
  let &t_ti = "\<Esc>[?47h"
  let &t_te = "\<Esc>[?47l"
endif
