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

" Display line number by default
set nu

" Enable highlighting search strings
set hlsearch
" Disable highlights until next search
" https://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting
nnoremap <leader><Space> :noh<cr>

" Highlight lines violating line limit
" https://stackoverflow.com/a/235970
highlight OverLength ctermbg=darkblue ctermfg=white guibg=#592929
match OverLength /\%121v.\+/

" `f` Opens disposable buffer ready to read in `ag`
" Buffer cannot be written to and will be deleted when left
" :help buftype
nnoremap <leader>f :e ag<CR>:set buftype=nowrite bufhidden=delete<CR>:r !gg 

" `b` Lists buffers ready to switch to
nnoremap <leader>b :ls<CR>:b 

" Delay cts by a few years
nnoremap ; :

" `V` sources .vimrc
nnoremap <leader>V :so ~/.vimrc<CR>

set autoread
set updatetime=750
" These are the features required-
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
