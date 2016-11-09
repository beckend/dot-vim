" Setup base used

function! BuildTern(info)
  if a:info.status == 'installed' || a:info.force
    !npm install
  endif
endfunction

function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.py --tern-completer
  endif
endfunction


" vim-plug
call plug#begin()

" core

" sensible defaults
Plug 'tpope/vim-sensible'
" Status bar
" Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" ack/ag
Plug 'mileszs/ack.vim'
" indent guides
Plug 'nathanaelkane/vim-indent-guides'
" Fuzzy file, buffer, mru, tag, etc finder
Plug 'ctrlpvim/ctrlp.vim'
" Interactive command execution in Vim.
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" A tree explorer plugin for vim.
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" git
Plug 'tpope/vim-fugitive'
" syntax checking hacks for vim
Plug 'scrooloose/syntastic'
Plug 'mtscout6/syntastic-local-eslint.vim'
" Completions
Plug 'marijnh/tern_for_vim', { 'do': function('BuildTern') }
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
" strip whitespace
Plug 'ntpeters/vim-better-whitespace'

" colors
Plug 'tomasr/molokai'

" javascript
Plug 'honza/vim-snippets'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'

" typescript
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'

call plug#end()


for fpath in split(globpath('~/.vim/vimrc.d/', '*.vim'), '\n')
  exe 'source' fpath
endfor
