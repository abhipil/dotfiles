set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'junegunn/goyo.vim'

call vundle#end()
filetype plugin indent on

:let mapleader = " "

" Vim only needs the aliases, also check ~/.bash_aliases
" https://stackoverflow.com/a/18901595
let $BASH_ENV = "~/.bash_aliases"

" Tabs to spaces
" https://stackoverflow.com/questions/234564/tab-key-4-spaces-and-auto-indent-after-curly-braces-in-vim/23426067
set tabstop=4
set shiftwidth=4
set expandtab

" Tab width by filetype
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" Display line number by default
set nu

" Enable highlighting search strings
set hlsearch
set incsearch
" Disable highlights until next search
" https://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting
nnoremap <leader><Space> :noh<cr>
set grepprg=git\ grep\ -n

" Highlight lines violating line limit
" https://stackoverflow.com/a/235970
highlight OverLength ctermbg=darkblue ctermfg=white guibg=#592929
match OverLength /\%121v.\+/

" Delay cts by a few years
nnoremap ; :

" Use TAB to switch windows in Normal mode
nnoremap <TAB> <C-w>w

" `f` Opens disposable buffer ready to read in `ag`
" Buffer cannot be written to and will be deleted when left
" :help buftype
nnoremap <leader>f :e projectsearch<CR>:set buftype=nowrite bufhidden=delete<CR>:r !gg 

nnoremap <leader>n :cnext<CR>
nnoremap <leader>p :cprev<CR>

" `b` Lists buffers ready to switch to
nnoremap <leader>b :ls<CR>:b 

" `V` sources .vimrc
nnoremap <leader>V :so ~/.vimrc<CR>

" Comment a line in python
" TODO: comment a line based on file ending
autocmd FileType javascript :let commentchar='//'
autocmd FileType python :let commentchar='#'
nnoremap <leader>c 0w:put=commentchar<C-M>

set autoread
set updatetime=750

" * Reload buffer, if file changed on drive
" * Save file to disk, if buffer modified
"
" These two commands must work well with each other.
" * If the file has changed on disk then load it asap unless in Insert Mode.
" * But if there are unwritten changes, those will be lost immediately.
" * Therefore write file to disk as soon as text changes.
" Write normal buffer
au TextChanged,TextChangedI <buffer> if &l:buftype == '' | write | endif
" Reload files from disk
au CursorHold,CursorMoved * checktime
" https://stackoverflow.com/a/24479186

" Get ctrl.p to fricking ignore .gitignore files
" https://github.com/kien/ctrlp.vim/issues/174
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
