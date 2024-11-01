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
"║                                              Last update:01-11-24 23:56:32║
"╚═══════════════════════════════════════════════════════════════════════════╝

" AUTO LOAD PLAGIN MANAGER {{{
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
" }}}

" ПЛАГІНИ {{{

" ДЛЯ Vim {{{
if it_Vim
    Plug 'dracula/vim', {'name': 'dracula'} " Кольорова схема
    Plug 'NLKNguyen/papercolor-theme'
endif
" }}}

" ДЛЯ NVim{{{
if it_NVim
    Plug 'ayu-theme/ayu-vim' " Кольорова схема
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
else
    " Налаштування для Vim щоб був схожий на NVim
    Plug 'noahfrederick/vim-neovim-defaults'
endif
" }}}

" ЗАГАЛЬНІ{{{
    Plug 'normen/vim-pio'
    Plug 'tpope/vim-surround'
    Plug 'vim-airline/vim-airline' " Можифікувати рядок статусу
    Plug 'vim-airline/vim-airline-themes'
    Plug 'rhysd/vim-clang-format', {'for': ['c','cxx']}
    " FuzzyFinder (для шуидкого пошуку)
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    " NERDTree - Швидкий перегляд файлів
    Plug 'preservim/nerdtree'
    " Сoc - автодоповнення 
    "  Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Доповнення для NERDTree
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'scrooloose/nerdcommenter'
    " Доповнення для Git, а такод іконки для NERDTree
    Plug 'airblade/vim-gitgutter'
    Plug 'ryanoasis/vim-devicons'
    " Перевірка синтаксисуа
      Plug 'scrooloose/syntastic' 
    " Плагин автозавершення
    "  Plug 'Valloric/YouCompleteMe'
" }}}

" }}}

" {{{
  call plug#end()
" }}}

" НАЛАШТУВАННЯ ДЛЯ Vim {{{

if it_Vim
    " вимкнути режим сумісності з класичним редактором Vi
    set nocompatible
    filetype plugin indent on
    " завжди відображати рядок стану
    set laststatus=2
    set hlsearch incsearch
    syntax enable
    let g:coc_disable_startup_warning = 1
    " кращий бекап, свап та інші збереження для Vim (NVim має прекрасні за
    " замовчуванням
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
  colorscheme dracula
endif
" }}}

" НАЛАШТУВАННЯ NVim {{{
if it_NVim
    if empty(glob("~/.config/nvim/plugged/vim-airline/autoload/airline.vim"))
    :PlugInstall
  endif
  set termguicolors
  colorscheme ayu
  " set background=dark
  let ayucolor="dark"
endif
" }}}

" НАЛАШТУВАННЯ ДЛЯ Win32 {{{
if it_Win32
"  if empty(glob("~/.vim/plugged/vim-airline/autoload/airline.vim"))
"      :PlugInstall
"  endif
  " якщо раптом доведеться запустити вім у вінді
  " НЕ ДАЙ БОГ
  " кодування
  set encoding=cp2151
else
  set encoding=utf-8
  set  termencoding=utf-8
endif
" }}}

" GUI {{{
if has('gui_running') || it_NVim || (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256')
    if !has('gui_running')
        let &t_Co = 256
    endif
"    colorscheme vim-monokai-tasty
else
"    colorscheme delek
endif
" }}}

" КОНФІГУРАЦІЯ {{{
highlight ColorColumn ctermbg=black
call matchadd('ColorColumn','\%80v',100)

" задаємо кількість рядків при скролінгу
set scrolloff=4
" (no)wrap динамічний (не)перенос довгих рядків
set wrap
" переносити цілі рядки
set linebreak
"set hidden "
"set mouse=a "
"set mousehide "
" показувати не завершені команди в статус бар
set showcmd wildmenu
" Показуємо лінійку та номерацію рядків відносно поточного рядка
set ruler number relativenumber cursorline
" Підсвітимо пробіли та табуляцію
set list listchars=tab:╺╴,eol:¬,trail:·,extends:→,precedes:←
" мигнути екраном якщо помилка
set visualbell
" Показати ім`я файла в заголовку термінлу
set title
" змінюємо розмір історії команд та змін
set history=127 undolevels=2048
"set fileformat=unix
set fencs=utf-8,cp1251,koi8-r,cp866

" перечити файл якщо змінено ззовні
set autoread
set expandtab tabstop=4 autoindent softtabstop=4 shiftwidth=4 cindent smartindent
"set wrap linebreak nolist textwidth=80

" НАЛАШТУВАННЯ ВИГЯЛДУ КУРСОРУ {{{
set ttimeoutlen=10 "знажуємо затримку виведення помлідовностей
let &t_SI.="\e[5 q" " режим вставки
let &t_SR.="\e[3 q" " режим заміни
let &t_EI.="\e[2 q" " нормальний режим
" де
" 1 - моготливий прямокутник
" 2 - звичайний прямокутник
" 3 - миготливе підкреслення
" 4 - звичайне підкреслення
" 5 - миготлива риска
" 6 - риска
" }}}

" РОЗУМІЄ УКРАЇНСЬКУ {{{
    set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫІЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSSTUVWXYZ,фисвуапршолдьтщзйкыіегмцчня;abcdefghijklmnopqrsstuvwxyz
" }}} 

" ФОЛДИНГ {{{
    set foldenable
    set foldmethod=syntax " визначати блоки тексту по синтаксису
    set foldmethod=indent " визначати блоки зп відступом
    set foldcolumn=3 " Показати полосу для керування згоротанням
    set foldlevel=1 " Перший рівень вкладеності відкритий, решта закриті
    set foldopen=all " автоматическое открытие сверток при заходе в них
    set tags=tags\ $VIMRUNTIME/systags " Шукати теги в поточному каталозі (теги генерируются ctags)
" }}}

" AIRLINE {{{
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1 " Увімкнути підтримку Powerline шрифтів
    let g:airline#extensions#keymap#enabled = 1 "Не показывать текущий маппинг
    let g:airline_section_z = "\ue0a1:%l/%L Col:%c" " Кастомна графа положення курсору
    let g:Powerline_symbols='unicode' " Підтримка unicode
    let g:airline#extensions#xkblayout#enabled = 1 "
" }}}

" NONAME {{{
augroup config_settings
    autocmd!
    autocmd FileType make set tabstop=8 shiftwidth=8
    autocmd FileType markdown set nowrap
    autocmd FileType vim setlocal foldlevel=0 foldmethod=marker
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType tt2html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php set omnifunc=phpcomplete#CompletePHP
    autocmd FileType c set omnifunc=ccomplete#Complete
augroup END
" }}}

" КЛАВІШІ {{{

map <Down> <NOP>
map <Up> <NOP>
map <Left> <NOP>
map <Right> <NOP>
" }}}

" EMPTY {{{
" }}}

" EMPTY {{{
" }}}
" EMPTY {{{
" }}}
