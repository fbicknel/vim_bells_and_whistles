" Load Pathogen to automatically load modules from ../bundle
filetype off
call pathogen#infect()
call pathogen#helptags()

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
set number
set ignorecase
set autoindent
set showmatch
set tabstop=4
set shiftwidth=4
nnoremap <c-n> :w<cr>n<cr>
nnoremap <F3> :buffers<cr>:edit #
nnoremap <S-F3> :w<cr>e#<cr>
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
" TaskList plugin (map \td to activate instead of default \t)
nnoremap <leader>td <Plug>TaskList
" Tab Completion and Documentation
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
" Toggle Gundo code diffs:
:map <leader>g :GundoToggle<CR>
" Pyflakes quickfix window off:
let g:pyflakes_use_quickfix = 0
" Pep8 activation:
let g:pep8_map='<leader>8'
" RopeVim activation:
nnoremap <leader>j :RopeGotoDefinition<CR>
nnoremap <leader>r :RopeRename<CR>
" Ack plugin:
nmap <leader>a <Esc>:Ack!
" Git integration:
" %{fugitive#statusline()}
