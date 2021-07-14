"╔═══════════════════════════════════════════════════════════════════════════╗
"║ Copyright © 2021 Sam4uk                                                   ║
"║                                                                           ║
"║Permission is hereby  granted, free of charge , to  any  person obtaining a║
"║copy of this software and associated documentation files  (the “Software”),║
"║to deal in the Software without  restriction, including without  limitation║
"║the  rights  to  use, copy, modify, merge, publish, distribute, sublicense,║
"║and/or  sell  copies of  the Software,  and to permit persons  to  whom the║
"║Software  is furnished  to  do  so, subject  to  the  following conditions:║
"║                                                                           ║
"║The above copyright notice and this permission  notice shall be included in║
"║all copies or substantial portions of the Software.                        ║
"║                                                                           ║
"║THE SOFTWARE IS PROVIDED “AS  IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR║
"║IMPLIED,  INCLUDING  BUT  NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,║
"║FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE║
"║AUTHORS  OR COPYRIGHT HOLDERS  BE LIABLE FOR  ANY CLAIM, DAMAGES  OR  OTHER║
"║LIABILITY, WHETHER  IN  AN  ACTION  OF CONTRACT, TORT OR OTHERWISE, ARISING║
"║FROM, OUT OF  OR IN  CONNECTION  WITH  THE  SOFTWARE  OR  THE USE  OR OTHER║
"║DEALINGS IN THE SOFTWARE.                                                  ║
"║                                                                           ║
"║                                                                           ║
"║                                              Last update:14-07-21 23:02:37║
"╚═══════════════════════════════════════════════════════════════════════════╝
let it_NVim = has('nvim')
let it_Win32 = has('win32')
let it_gVim = has('gvim')
let it_Vim = !it_NVim

autocmd! bufwritepre $MYVIMRC call setline(23, '"║                                              Last update:'.strftime("%d-%m-%y %H:%M:%S║"))
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

if it_NVim
  if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    :silent !wget -P ~/.local/share/nvim/site/autoload/ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  endif
  call plug#begin()
endif

if it_Vim
  if empty(glob('~/.vim/autoload/plug.vim'))
    :silent !wget -P ~/.vim/autoload/ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  endif
  call plug#begin('~/.vim/plugged')
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if it_Vim
	" Plug for Vim
endif

if it_NVim
	" Plug for NVim
endif

if it_gVim
	" Plug for gVim
endif

if it_Win32
	" Plug for Windows
endif

" Common Plug
Plug 'vim-airline/vim-airline'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()

" Config editor & Plug`s

" Settings for Vim
if it_Vim
    set nocompatible
    filetype plugin indent on
    set laststatus=2
    set hlsearch incsearch
    syntax enable
    " better backup, swap and undos storage for vim (nvim has nice ones by
    " default)
    set directory=~/.vim/dirs/tmp     " directory to place swap files in
    set backup                        " make backup files
    set backupdir=~/.vim/dirs/backups " where to put backup files
    set undofile                      " persistent undos - undo after you re-open the file
    set undodir=~/.vim/dirs/undos
    set viminfo+=n~/.vim/dirs/viminfo
    " create needed directories if they don't exist
    if !isdirectory(&backupdir)
        call mkdir(&backupdir, "p")
    endif
    if !isdirectory(&directory)
        call mkdir(&directory, "p")
    endif
    if !isdirectory(&undodir)
        call mkdir(&undodir, "p")
    endif

    if empty(glob("~/.vim/plugged/vim-airline/autoload/airline.vim"))   
      :PlugInstall
  endif
endif

" Settings for Nvim
if it_NVim
    if empty(glob("~/.config/nvim/plugged/vim-airline/autoload/airline.vim"))   
    :PlugInstall
  endif
  set termguicolors
endif

" Settings for Win
if it_Win32
    " TODO path in win
"  if empty(glob("~/.vim/plugged/vim-airline/autoload/airline.vim"))   
"      :PlugInstall
"  endif
  set encoding=cp2151
else
  set encoding=utf-8
  set  termencoding=utf-8
endif

if has('gui_running') || it_NVim || (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256')
    if !has('gui_running')
        let &t_Co = 256
    endif
else
endif

" Common setings

set scrolloff=4
set wrap
set linebreak
"set hidden "
"set mouse=a "
"set mousehide "
set showcmd wildmenu
set ruler number relativenumber cursorline
set list listchars=tab:╺╴,eol:¬,trail:·,extends:→,precedes:←
set visualbell
set title
set history=127 undolevels=2048
set fencs=utf-8,cp1251,koi8-r,cp866

set autoread
set expandtab tabstop=4 autoindent softtabstop=4 shiftwidth=4 cindent smartindent
au FileType make set tabstop=8 shiftwidth=8
"au FileType markdown set nowrap
"set wrap linebreak nolist textwidth=80
set ttimeoutlen=10 
let &t_SI.="\e[5 q" 
let &t_SR.="\e[3 q" 
let &t_EI.="\e[2 q" 

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫІЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSSTUVWXYZ,фисвуапршолдьтщзйкыіегмцчня;abcdefghijklmnopqrsstuvwxyz

set foldenable
set foldmethod=syntax 
set foldmethod=indent 
set foldcolumn=3 
set foldlevel=1 
set foldopen=all 
set tags=tags\ $VIMRUNTIME/systags 

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#keymap#enabled = 1
let g:airline_section_z = "\ue0a1:%l/%L Col:%c" 
let g:Powerline_symbols='unicode' 
let g:airline#extensions#xkblayout#enabled = 1 

