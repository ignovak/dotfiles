set nocompatible

filetype off             " Turn off filetype plugins before bundles init


" NEOBUNDLE {{{ ===============================================================

" NeoBundle auto-installation and setup {{{

" Auto installing NeoBundle
let iCanHazNeoBundle=1
let neobundle_readme=expand($HOME.'/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
    echo "Installing NeoBundle.."
    echo ""
    silent !mkdir -p $HOME/.vim/bundle
    silent !git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
    let iCanHazNeoBundle=0
endif

" Call NeoBundle
if has('vim_starting')
    set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand($HOME.'/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundle 'Shougo/neobundle.vim'
" }}}

" BUNDLES (plugins administrated by NeoBundle) {{{

" Shougo's way {{{

NeoBundle 'Shougo/vimproc', {
            \ 'build' : {
            \     'mac' : 'make -f make_mac.mak',
            \     'unix' : 'make -f make_unix.mak',
            \    },
            \ }

NeoBundle 'Shougo/unite.vim'

" Snipmate dependencies
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
" NeoBundle 'honza/snipmate-snippets'
NeoBundle 'garbas/vim-snipmate'

NeoBundle 'tpope/vim-fugitive'
" NeoBundleLazy 'gregsexton/gitv', {'depends':['tpope/vim-fugitive'],
"             \ 'autoload':{'commands':'Gitv'}}

NeoBundle 'jpalardy/vim-slime'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'vim-scripts/L9'
" NeoBundle 'vim-scripts/vcscommand.vim'
NeoBundle 'vim-scripts/tlib'

NeoBundleLazy 'othree/html5.vim', { 'autoload': { 'filetypes': ['html', 'css'] } }

NeoBundle 'gregsexton/MatchTag'
" NeoBundle 'skammer/vim-css-color'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'lukaszb/vim-web-indent'
NeoBundle 'walm/jshint.vim'

NeoBundle 'ignovak/vim-translator'

" NeoBundle 'ujihisa/unite-colorscheme'

" NeoBundle 'vim-speeddating'

" HTML/HAML
" NeoBundle 'hokaccha/vim-html5validator'

" CSS/LESS
" JavaScript
" NeoBundle 'pangloss/vim-javascript'
" NeoBundle 'itspriddle/vim-jquery'
" JSON
" NeoBundle 'leshill/vim-json'

" NeoBundle 'tpope/vim-rails'
" NeoBundle 'tpope/vim-haml'
" NeoBundle 'kchmck/vim-coffee-script'
" NeoBundle 'klen/vim-jsmode'
" NeoBundle 'mattn/gist-vim'

" NeoBundle 'davidhalter/jedi-vim'

" END BUNDLES }}}

" Auto install the plugins {{{

" First-time plugins installation
if iCanHazNeoBundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :NeoBundleInstall
endif

" Check if all of the plugins are already installed, in other case ask if we
" want to install them (useful to add plugins in the .vimrc)
NeoBundleCheck

" }}}


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

        " Avoid syntax-highlighting for files larger than 10MB
        au BufReadPre * if getfsize(expand("%")) > 10000*1024 | syntax off | endif

        " Auto close preview window
        autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
        autocmd InsertLeave * if pumvisible() == 0|pclose|endif

    augroup END

endif

set t_Co=256
let g:solarized_termcolors=256
let g:solarized_contrast='high'
let g:solarized_termtrans=1

set background=light
colorscheme solarized

" Unite

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#source('file_rec,file_rec/async,grep', 'ignore_pattern', join(['\.git/', 'tmp/', 'bundle/', 'node_modules/', 'libs/', 'log/'], '\|'))
call unite#custom#source('file_rec,file_rec/async', 'max_candidates', 10000)

" let g:unite_source_buffer_time_format = ''
" let g:unite_enable_start_insert = 1
" let g:unite_split_rule = "botright"
" let g:unite_force_overwrite_statusline = 0
" let g:unite_winheight = 10
" let g:unite_candidate_icon="▷"

nmap <space> [unite]
nnoremap [unite] <nop>

nnoremap <silent> [unite]<space> :<C-u>Unite -toggle -auto-resize -buffer-name=mixed file_rec/async buffer file_mru bookmark<cr><c-u>
nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -start-insert -buffer-name=files file_rec/async<cr>
nnoremap <silent> [unite]b :<C-u>Unite -auto-resize -buffer-name=buffers buffer<cr>
nnoremap <silent> [unite]/ :<C-u>Unite -no-quit -buffer-name=search grep:.<cr>
nnoremap <silent> [unite]* :<C-u>UniteWithCursorWord -no-quit -buffer-name=search grep:.<cr>
nnoremap <silent> [unite]m :<C-u>Unite -auto-resize -buffer-name=mappings mapping<cr>
" nnoremap <silent> [unite]s :<C-u>Unite -quick-match buffer<cr>

if executable('ag')
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--nocolor --nogroup --hidden -S'
    let g:unite_source_grep_recursive_opt=''
    let g:unite_source_grep_search_word_highlight = 1
elseif executable('ack')
    let g:unite_source_grep_command='ack'
    let g:unite_source_grep_default_opts='--no-group --no-color'
    let g:unite_source_grep_recursive_opt=''
    let g:unite_source_grep_search_word_highlight = 1
endif

" NERDTree
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer=0
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

" Save file by <leader>s
nmap <leader>s :w<cr>
imap <leader>s <esc>:w<cr>

" OPTIMIZE: try to improve behavior
nnoremap Q <c-w>s:bp<cr><c-w>j:bd<cr>
" nnoremap Q :bd<cr>

nmap <leader>j :JSHint<cr>

" Open files
" Do not set autochdir (working dir should be root)
nnoremap <leader>e :e <c-r>=expand("%:h")<cr>/
nnoremap <leader>d :diffsplit <c-r>=expand("%:h")<cr>/
cmap <leader>e <c-r>=expand("%:h")<cr>/

nnoremap <silent> <leader>vi :e ~/.vimrc<cr>
nnoremap <silent> <leader>vs :e ~/.vim/snippets/javascript.snippets
nnoremap <silent> <leader>vp :vsp <c-r>=expand("%:h")<cr>/

" Helpers for snipmate
so ~/.vim/snippets/support_functions.vim

" Slime-vim
" Typical settings for tmux:
" socket: "default"
" pane: ":0.1"
if executable('tmux')
    let g:slime_target = "tmux"
endif
xmap gx <Plug>SlimeRegionSend
" WARN: netrwPlugin has the same mapping
nmap gx <Plug>SlimeParagraphSend

let g:goog_user_conf = {
            \ 'langpair': 'en|ru',
            \ 'v_key': 'T'
            \ }

if has('gui_running')
    source ~/.vim/.gvimrc
endif

function! SQLUpperCase()
    %s:\<analyze\>\|\<and\>\|\<as\>\|\<by\>\|\<desc\>\|\<exists\>\|\<explain\>\|\<from\>\|\<group\>\|\<in\>\|\<insert\>\|\<intersect\>\|\<into\>\|\<join\>\|\<limit\>\|\<not\>\|\<on\>\|\<order\>\|\<select\>\|\<set\>\|\<update\>\|\<where\>:\U&:i
endfunction

" Creating macros
" :redir @a>
" :history : -20,
" :redir END
" "ap

" Regexp notes
" /text1\(text2\)\@= 'text1' followed by 'text2'
" /\(text1\)\@<=text2  'text2' preceded with 'text1'
