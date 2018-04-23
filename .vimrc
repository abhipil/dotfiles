set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'junegunn/goyo.vim'

call vundle#end()
filetype plugin indent on

" Enable highlighting search strings
set hlsearch
" Disable highlights until next search
" Mapped to spacebar
" https://stackoverflow.com/questions/657447/vim-clear-last-search-highlighting
nnoremap <Space> :noh<cr>
