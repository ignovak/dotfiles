dotfiles
========

Dotfiles for frontend-developer.

### Installation

```bash
git clone git://github.com/ignovak/dotfiles ~/dotfiles && ~/dotfiles/install.sh
```

### Recommended software to install
- brew (requires https://developer.apple.com/downloads/)
- tmux
- [ag](https://github.com/ggreer/the_silver_searcher)
- tree
- httpie
- [rvm](http://rvm.io/)
- zsh
    - zsh-syntax-highlighting `ln -s /usr/local/share/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/`

### Main features

#### Zsh

Uses [oh-my-zsh](http://ohmyz.sh/) and a bunch plugins for it (like [common-aliases](https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/common-aliases/common-aliases.plugin.zsh)).

There are also some config files for bash.

#### Git

There are some zsh-plugins (like `git` and `gitfast`) and .gitconfig file.
See list of aliases, provided by git plugin, here: https://github.com/robbyrussell/oh-my-zsh/wiki/Plugin:git#aliases.

#### VIM

See vimtutor and :help.

The most important plugins:

##### [NeoBundle](https://github.com/Shougo/neobundle.vim) – plugin manager

##### [Unite](https://github.com/Shougo/unite.vim) – common shell for dealing with lists (sources)
Main use-cases (working with thi config):

1. `<Space>b` - Show buffers list. 
2. `<Space>f` - Search by project files. **NB:** might work slowly in projects with a large amount of files (~10k). For better setup consider using local .vimrc and .agignore files inside the project. 
3. `<Space>/`, `<Space>*` - Search by project code. 
4. `<Space>m` - List of mappings.

You can add your own sources.

##### [VimShell](https://github.com/Shougo/vimshell.vim) – powerful shell inside vim

Opens by `\h` (`<leader>h`)

##### [VimFiler](https://github.com/Shougo/vimfiler.vim) – advanced file manager (replaces netrw and nerdtree)

Toggles by `<Bs>`  
`\f` (`<leader>f`) opens vimfiler and finds current file

See help (`g?` in vimfiler buffer or `:h vimfiler`) for learning mappings. Some examples:  
`v` - File preview  
`o`, `<CR>` - Open file/directory  
`l`, `<Right>` - Move to file or directory  
`h`, `<Left>` - Move to parent directory  

`gf` - Search files in current directory (uses `Unite file_rec`)  
`gr` - Search code in current directory (uses `Unite grep`)  

File operations:  
* `r` - Rename file/directory
* `N` - New file
* `K` - New directory

* `cc` - copy file/directory
* `dd` - delete file/directory
* `mm` - move file/directory

##### [Neosnippet](https://github.com/Shougo/neosnippet.vim) – snippet support
Expanding snippets by `<Tab>`. Examples:

For css
```css
dn ->
    display: none;
poa ->
    position: absolute;
```

For js
```js
cl ->
    console.log(${1});
f ->
    function(${1}) {
        ${3}
    }${2}
```
You can add your own snippets in `~/.vim/snippets/*` and helper utils for them (in `~/.vim/snippets/support_functions.vim`).

##### [tComment](https://github.com/tomtom/tcomment_vim) – code commenting
Usage:
- `gc<motion>` in normal-mode comments text by motion. E.g., `gcip` comment the entire paragraph
- `gcc` in normal-mode comments one line
- `gc` in visual-mode comments selected text

##### [Surround](https://github.com/tpope/vim-surround) – handy actions with quotes and brackets
See documentation. Simple examples: `dsb` deletes parentheses and `cs"'` changes double quotes to single.

##### [Fugitive](https://github.com/tpope/vim-fugitive) – powerful plugin for working with git

Some use cases:
- `\g`(`:Gstatus`) open `git status` in split
- in same split you can add / remove files from stage with `-`
- `D` will open diffview of previous and current versions of `<cfile>` (same is for `:Gdiff`)
- `:Gblame` opens `git blame` in vertical split. Pressing `o` or `<cr>` on `<cword>` opens commit preview. Also `\b` works (for normal and visual modes)

#### Tmux

Shell-commands

- `tm` - create new tmux-session on socket `tm-$USER`
- `tm a` - open previous session

Tmux-commands

- `<c-b>?` - help (available commands list). Closed by q
- `<c-b>c` - Open new window in current session
- `<c-b>n` / `<c-b>p` / `<c-b>2` - Go to next / previous window / window #2
- `<c-b>%` / `<c-b>"` - Open vertical ⎅ / horizontal ⌸ split
- `<c-b>o` - Move between splits
- `<c-b>$` - Rename session
- `<c-b>s` - Switch sessions

#### Bin

There are some useful scripts in `bin` directory. E.g.:
* `watch` watches file system changes (useful for debugging)

### Feedback

Please, ask any questions or add comments at [issues](/../../issues/new).
