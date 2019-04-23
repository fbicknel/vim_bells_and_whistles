set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
"
" These are samples:
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
"
" /end samples

Plugin 'tpope/vim-fugitive'

Plugin 'zivyangll/git-blame.vim'

Plugin 'reinh/vim-makegreen'

Plugin 'scrooloose/nerdtree'

Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'jnurmine/Zenburn' " a color scheme

" git-blame.vim
" gundo
" makegreen
" pep8
" pydoc
" py.test
" snipmate
" supertab
" surround
" tasklist

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
nnoremap <Leader>B :<C-u>call gitblame#echo()<CR>

" Tell vim to remember certain things when we exit
"  '10 : marks will be remembered for up to 10 previously edited files
"  "100 : will save up to 100 lines for each register
"  :20 : up to 20 lines of command-line history will be remembered
"  % : saves and restores the buffer list
"  n... : where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" when we reload, tell vim to restore the cursor to the saved position
augroup JumpCursorOnEdit
 au!
 autocmd BufReadPost *
 \ if expand("<afile>:p:h") !=? $TEMP |
 \ if line("'\"") > 1 && line("'\"") <= line("$") |
 \ let JumpCursorOnEdit_foo = line("'\"") |
 \ let b:doopenfold = 1 |
 \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
 \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
 \ let b:doopenfold = 2 |
 \ endif |
 \ exe JumpCursorOnEdit_foo |
 \ endif |
 \ endif
 " Need to postpone using "zv" until after reading the modelines.
 autocmd BufWinEnter *
 \ if exists("b:doopenfold") |
 \ exe "normal zv" |
 \ if(b:doopenfold > 1) |
 \ exe "+".1 |
 \ endif |
 \ unlet b:doopenfold |
 \ endif
augroup END
" avoid extraneous whitespace
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
if has("autocmd")
    autocmd BufReadPost fugitive://* set bufhidden=delete
    autocmd User fugitive 
      \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
      \   nnoremap <buffer> .. :edit %:h<CR> |
      \ endif
endif
set number
set ignorecase
set autoindent
set showmatch
set tabstop=4
set shiftwidth=4
nnoremap <c-n> :w<cr>n<cr>
nnoremap <F3> :buffers<cr>:edit #
nnoremap <Leader><F3> :buffers<cr>:vsplit #
hi clear LineNr
" Tabs
nnoremap <F6> :tabe 
nnoremap <F7> :tabp<cr>
nnoremap <F8> :tabn<cr>
nnoremap <F9> :mksession! ~/.vim.session
let loaded_matchparen = 1
" For python compatibility:
set smarttab
set expandtab
set softtabstop=4
syntax on
set background=dark
filetype indent plugin on
" Some window shortcuts:
nnoremap <F4> :86vsplit<cr>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
" NerdTree Browser
nnoremap <leader>b :NERDTreeToggle<cr>
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
" TaskList plugin (map \td to activate instead of default \t)
nnoremap <leader>td <Plug>TaskList
" Tab Completion and Documentation
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
" Toggle Gundo code diffs:
:map <leader>g :GundoToggle<CR>
" RopeVim activation:
nnoremap <leader>j :RopeGotoDefinition<CR>
nnoremap <leader>r :RopeRename<CR>
" Ack plugin:
nmap <leader>a <Esc>:Ack!
" Git integration:
" set statusline=%f\ [%4l/%2c]\ %{fugitive#statusline()}\ %m
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

set scrolloff=5
set hlsearch
" Set up some warning if you code more than 81 characters
" Also try guibg=#592929 for light gui backgrounds
" Also try guibg=#ffd9d9 for dark  gui backgrounds
" Also, ctermbg can either be red or darkred
highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
match OverLength /\%81v.\+/
colors zenburn
