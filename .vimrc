scriptencoding utf-8

"dein Scripts-----------------------------
if &compatible
  set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/defx.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  let g:deoplete#enable_at_startup = 1

  " TODO: Check other completion sources
  " https://github.com/Shougo/deoplete.nvim/wiki/Completion-Sources
  call dein#add('carlitux/deoplete-ternjs', {'build': 'npm install -g tern'})

  call dein#add('Shougo/neosnippet.vim')

  call dein#add('Shougo/denite.nvim')

  " NeoBundle 'Shougo/neosnippet-snippets'
  " NeoBundle 'honza/vim-snippets'

  call dein#add('tpope/vim-fugitive')
  " NeoBundleLazy 'gregsexton/gitv', {'depends':['tpope/vim-fugitive'],
  "             \ 'autoload':{'commands':'Gitv'}}

  " NeoBundle 'Shougo/vimshell' " TODO: deol.nvim
  " NeoBundle 'Shougo/neomru.vim'

  " NeoBundle 'jpalardy/vim-slime'
  call dein#add('Raimondi/delimitMate')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-unimpaired')
  " NeoBundle 'tpope/vim-endwise'
  call dein#add('tpope/vim-repeat')
  " NeoBundle 'tpope/vim-sleuth'
  " NeoBundle 'vim-scripts/tlib'

  " NeoBundle 'AndrewRadev/splitjoin.vim'

  " NeoBundleLazy 'othree/html5.vim', { 'autoload': { 'filetypes': ['html', 'css'] } }

  " NeoBundle 'gregsexton/MatchTag'
  " NeoBundle 'skammer/vim-css-color'
  " NeoBundle 'hail2u/vim-css3-syntax'
  " NeoBundle 'ignovak/vim-web-indent'
  " NeoBundle 'walm/jshint.vim'

  " NeoBundle 'ignovak/vim-translator'

  call dein#add('ConradIrwin/vim-bracketed-paste')

  " NeoBundle 'ujihisa/unite-colorscheme'

  " NeoBundle 'vim-speeddating'

  " NeoBundle 'hokaccha/vim-html5validator'

  " CSS/LESS
  " JavaScript
  " NeoBundle 'pangloss/vim-javascript'
  " NeoBundle 'wavded/vim-stylus'
  " JSON
  " NeoBundle 'leshill/vim-json'

  " NeoBundle 'vim-scripts/closetag.vim'

  " NeoBundle 'https://www.vim.org/scripts/download_script.php?src_id=4316',
  "       \ { 'type__filename' : 'python.vim', 'script_type' : 'indent' }

  " NeoBundle 'editorconfig/editorconfig-vim'

  " NeoBundle 'davidhalter/jedi-vim'

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

let g:deoplete#sources#ternjs#filetypes = ['jsx', 'vue']

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
set shiftwidth=2            " number of spaces to use for each step of indent
set tabstop=2
set softtabstop=2           " tab like 2 spaces
set shiftround              " drop unused spaces

" Search options
set gdefault                " Add the g flag to search/replace by default
set hlsearch                " Highlight search results
set ignorecase              " Ignore case in search patterns
set smartcase               " Override the 'ignorecase' option if the search pattern contains upper case characters
set incsearch               " While typing a search command, show where the pattern
set history=1000
nnoremap <silent> <cr> :nohlsearch<cr><cr>

" Matching characters
set showmatch               " Show matching brackets
set matchpairs+=<:>         " Make < and > match as well

" Localization
set langmenu=none            " Always use english menu
" set keymap=russian-jcukenwin " Alternative keymap
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
set nobackup
set nowritebackup
set noswapfile
set noeol
set nofixendofline

set diffopt=filler
set diffopt+=vertical
set diffopt+=iwhite

augroup vimrc
  autocmd!

  autocmd FileType vim setlocal sw=2
  autocmd FileType vim setlocal ts=2
  autocmd FileType vim setlocal sts=2
  autocmd FileType vim nnoremap <leader>x 0y$:<c-r>"<cr>

  " Auto reload vim settings
  autocmd BufWritePost *.vim source $MYVIMRC
  autocmd BufWritePost .vimrc source $MYVIMRC

  " Restore cursor position
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
              \| exe "normal g'\"" | endif

  " Filetypes
  autocmd FileType htmldjango set ft=html.htmldjango

  autocmd FileType html set ft=html.javascript

  " autocmd FileType scss set ft=scss.css
  autocmd FileType stylus set ft=stylus.sass
  autocmd! FileType sass,scss syn cluster sassCssAttributes add=@cssColors

  autocmd FileType html,css,scss,javascript set iskeyword+=-
  autocmd FileType php set iskeyword-=-

  autocmd BufRead,BufNewFile *.json set ft=javascript
  " autocmd BufRead,BufNewFile *.json set equalprg=python\ -mjson.tool
  autocmd BufRead,BufNewFile *.js set ft=javascript.javascript-jquery

  autocmd BufRead,BufNewFile *.less set ft=less.css
  autocmd BufRead,BufNewFile *.scss set ft=scss.css

  autocmd BufRead,BufNewFile *.plaintex set ft=plaintex.tex

  autocmd BufRead,BufNewFile *.phtml set ft=html
  autocmd BufRead,BufNewFile *.html nmap <leader>o :!open %<cr>

  " Avoid syntax-highlighting for files larger than 10MB
  autocmd BufReadPre * if getfsize(expand("%")) > 10000*1024 | syntax off | endif

  autocmd BufReadPost fugitive://* set bufhidden=delete

augroup END

set t_Co=256
let g:solarized_termcolors=256
let g:solarized_contrast='high'
let g:solarized_termtrans=1

set background=light
colorscheme solarized

" Denite
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

" TODO
" https://gist.github.com/dlants/8d7fadfb691b511f1376ba437a9aaea9
" https://www.freecodecamp.org/news/a-guide-to-modern-web-development-with-neo-vim-333f7efbf8e2/
" https://github.com/ctaylo21/jarvis/blob/master/config/nvim/init.vim#L58
call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '--ignore', 'build/', '-g', ''])
call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-u', '-g', ''])

call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
" call denite#custom#source('file_rec', 'sorters', ['sorter_sublime'])
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/*', '*.pyc', 'node_modules/',
      \   'dist/', 'log/', 'tmp/',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/', '*.png'])

nmap <space> [unite]
nnoremap [unite] <nop>

" nnoremap <silent> [unite]f :<C-u>Denite -toggle -auto-resize -start-insert -buffer-name=files neomru/file file_rec/async<cr>
nnoremap <silent> [unite]p :<C-u>Denite -start-filter file/rec<cr>
nnoremap <silent> [unite]f :<C-u>Denite -start-filter file_rec<cr>
nnoremap <silent> [unite]b :<C-u>Denite -auto-resize -buffer-name=buffers buffer<cr>
nnoremap <silent> [unite]* :<C-u>DeniteCursorWord grep:.<cr>
nnoremap <silent> [unite]/ :<C-u>Denite grep:.<cr>

" " Unite

"     let g:unite_source_grep_command='ag'
"     let g:unite_source_grep_default_opts='--nocolor --nogroup --hidden -S'
"     let g:unite_source_grep_recursive_opt=''
"     " let g:unite_source_grep_search_word_highlight = 1

" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" call unite#custom#source('file_rec,file_rec/async,grep', 'ignore_pattern', join(['\.git/', 'tmp/', 'bundle/', 'node_modules/', 'bower_components/', 'dist/', 'libs/', 'log/'], '\|'))
" call unite#custom#source('file_rec,file_rec/async', 'max_candidates', 10000)
" call unite#custom#source('neomru/file', 'matchers', ['matcher_project_files', 'matcher_fuzzy'])

" let g:unite_source_buffer_time_format = ''
" " let g:unite_enable_start_insert = 1
" " let g:unite_split_rule = "botright"
" " let g:unite_force_overwrite_statusline = 0
" " let g:unite_winheight = 10
" " let g:unite_candidate_icon="▷"

" Defx
nnoremap <silent> <Bs> :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
nnoremap <silent> <LocalLeader>f :<C-u>Defx -resume -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<CR>

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>    defx#do_action('drop')
  nnoremap <silent><buffer><expr> c       defx#do_action('copy')
  nnoremap <silent><buffer><expr> m       defx#do_action('move')
  nnoremap <silent><buffer><expr> p       defx#do_action('paste')
  nnoremap <silent><buffer><expr> l       defx#do_action('open')
  nnoremap <silent><buffer><expr> E       defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P       defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> o       defx#is_directory() ? defx#do_action('open_or_close_tree') : defx#do_action('drop')
  nnoremap <silent><buffer><expr> K       defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N       defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M       defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C       defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S       defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d       defx#do_action('remove')
  nnoremap <silent><buffer><expr> r       defx#do_action('rename')
  nnoremap <silent><buffer><expr> !       defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x       defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy      defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .       defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;       defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h       defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~       defx#do_action('cd')
  nnoremap <silent><buffer><expr> q       defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Bs>    defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *       defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j       line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k       line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>   defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>   defx#do_action('print')
  nnoremap <silent><buffer><expr> cd      defx#do_action('change_vim_cwd')
endfunction

call defx#custom#column('icon', {
      \ 'directory_icon': '▸',
      \ 'opened_icon': '▾',
      \ 'root_icon': ' ',
      \ })

" let g:vimshell_interactive_update_time = 500
" let g:vimshell_disable_escape_highlight = 1
" nnoremap <silent><leader>h :VimShell<CR>

" fugitive
nmap <silent> <leader>b :Gblame<cr>
vmap <silent> <leader>b :Gblame<cr>
nmap <silent> <leader>g :Gstatus<cr>
nmap <silent> <leader>w :Gwrite<cr>

" gitv
nmap <leader>gv :Gitv origin/mainline <c-r>=expand("%")<cr><cr>

let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1

" Save file by <leader>s
nmap <leader>s :w<cr>
imap <leader>s <esc>:w<cr>

" OPTIMIZE: try to improve behavior
nnoremap Q <c-w>s:bp<cr><c-w>j:bd<cr>
" nnoremap Q :bd<cr>

" nmap <leader>j :JSHint<cr>

" Open files
" Do not set autochdir (working dir should be root)
nnoremap <leader>e :e <c-r>=expand("%:h")<cr>/
nnoremap <leader>d :diffsplit <c-r>=expand("%:h")<cr>/
cmap <leader>e <c-r>=expand("%:h")<cr>/

cnoremap <c-a> <c-b>

" Neosnippet
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

let g:neosnippet#disable_runtime_snippets = {
      \   '_' : 1,
      \ }

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#enable_completed_snippet = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/snippets'

nnoremap <silent> <leader>vi :e ~/.vimrc<cr>
nnoremap <silent> <leader>vs :e ~/.vim/snippets/javascript.snippets
nnoremap <silent> <leader>vp :vsp <c-r>=expand("%:h")<cr>/

" Helpers for snipmate
so ~/.vim/snippets/support_functions.vim

" Slime-vim
"
" TODO: replace with vimshell
"
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
"
" Unique characters
" /^((.)(?!.*\2))*$/
" /^(?!.*(.).*\1)/

set nomodeline " https://github.com/numirias/security/blob/master/doc/2019-06-04_ace-vim-neovim.md