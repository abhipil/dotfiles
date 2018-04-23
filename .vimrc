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

" Enable highlighting search strings
set hlsearch
" Disable highlights until next search
" Mapped to spacebar
" https://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting
nnoremap <leader><Space> :noh<cr>

" Highlight lines violating line limit
" https://stackoverflow.com/a/235970
highlight OverLength ctermbg=darkblue ctermfg=white guibg=#592929
match OverLength /\%121v.\+/

" `f` Opens disposable buffer ready to read in `ag`
" Buffer cannot be written to and will be deleted when left
" :help buftype bufhidden
nnoremap <leader>f :e ag<CR>:set bt=nowrite bh=delete<CR>:r !ag 

" `b` Lists buffers ready to switch to
nnoremap <leader>b :ls<CR>:b 

" Delay cts by a few years
nnoremap ; :
