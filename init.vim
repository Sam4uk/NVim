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
"║                                              Last update:14-07-21 23:17:39║
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
" ПЛАГІНИ
" ДЛЯ Vim
if it_Vim
Plug 'dracula/vim', {'name': 'dracula'} " Кольорова схема
 " Plug 'NLKNguyen/papercolor-theme'
endif
" Для NVIM
if it_NVim
Plug 'ayu-theme/ayu-vim' " Кольорова схема
endif

""""https://habr.com/ru/post/468265/
" Іконки 
"Plug 'ryanoasis/vim-devicons'
"
"" "Plug 'neoclide/coc.nvim', {'branch': 'release'}
"" Plug 'jackguo380/vim-lsp-cxx-highlight'
""Plug 'scrooloose/nerdtree', {'on': 'NERDTreeTogle'}
"Plug 'airblade/vim-gitgutter' " підсвідка змін gidiff
Plug 'lervag/vimtex', {'for': 'tex'} " LaTeX
"Plug 'chrisbra/vim-zsh'
Plug 'stephpy/vim-yaml', {'for': 'yaml'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
"" Nodejs
""npm install -g livedown
Plug 'shime/vim-livedown', {'for': 'markdown'}
Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c','cpp']}
Plug 'rhysd/vim-clang-format'
"" Plug 'vim-scripts/DoxyGen-Syntax'
"" Plug 'vim-scripts/DoxygenToolkit.vim'
"Plug 'pboettch/vim-cmake-syntax'
"Plug 'rip-rip/clang_complete'


"" Airline
Plug 'vim-airline/vim-airline' " Можифікувати рядок статусу
Plug 'vim-airline/vim-airline-themes'

" Now the actual plugins:
"
"" Override configs by directory
"Plug 'arielrossanigo/dir-configs-override.vim'
" Code commenter
Plug 'scrooloose/nerdcommenter'
"" Better file browser
"Plug 'scrooloose/nerdtree'
"" Class/module browser
"Plug 'majutsushi/tagbar'
"" Search results counter
"Plug 'vim-scripts/IndexedSearch'
"" A couple of nice colorschemes
"" Plug 'fisadev/fisa-vim-colorscheme'
"Plug 'patstockwell/vim-monokai-tasty'

"" Code and files fuzzy finder
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'
"" Pending tasks list
"Plug 'fisadev/FixedTaskList.vim'
" Async autocompletion
"if using_neovim && vim_plug_just_installed
"    Plug 'Shougo/deoplete.nvim', {'do': ':autocmd VimEnter * UpdateRemotePlugins'}
"else
"    Plug 'Shougo/deoplete.nvim'
"endif
"Plug 'roxma/nvim-yarp'
"Plug 'roxma/vim-hug-neovim-rpc'
"" Python autocompletion
"Plug 'deoplete-plugins/deoplete-jedi'
" Completion from other opened files
Plug 'Shougo/context_filetype.vim'
"" Just to add the python go-to-definition and similar features, autocompletion
"" from this plugin is disabled
"Plug 'davidhalter/jedi-vim'
"" Automatically close parenthesis, etc
"Plug 'Townk/vim-autoclose'
" Surround
Plug 'tpope/vim-surround'
"" Indent text object
"Plug 'michaeljsmith/vim-indent-object'
"" Indentation based movements
"Plug 'jeetsukumaran/vim-indentwise'
"" Better language packs
"Plug 'sheerun/vim-polyglot'
"" Ack code search (requires ack installed in the system)
"Plug 'mileszs/ack.vim'
" Paint css colors with the real color
Plug 'lilydjwg/colorizer', {'for': ['css','htm','html']}
"" Window chooser
"Plug 't9md/vim-choosewin'
"" Automatically sort python imports
"Plug 'fisadev/vim-isort'
"" Highlight matching html tags
"Plug 'valloric/MatchTagAlways'
"" Generate html in a simple way
"Plug 'mattn/emmet-vim'
"" Git integration
"Plug 'tpope/vim-fugitive'
"" Git/mercurial/others diff icons on the side of the file lines
"Plug 'mhinz/vim-signify'
"" Yank history navigation
"Plug 'vim-scripts/YankRing.vim'
"" Linters
"Plug 'neomake/neomake'
"" Relative numbering of lines (0 is the current line)
"" (disabled by default because is very intrusive and can't be easily toggled
"" on/off. When the plugin is present, will always activate the relative
"" numbering every time you go to normal mode. Author refuses to add a setting
"" to avoid that)
"Plug 'myusuf3/numbers.vim'
" Nice icons in the file explorer and file type status line.
Plug 'ryanoasis/vim-devicons'
"
"if using_vim
"    " Consoles as buffers (neovim has its own consoles as buffers)
"    Plug 'rosenfeld/conque-term'
"    " XML/HTML tags navigation (neovim has its own)
"    Plug 'vim-scripts/matchit.zip'
"endif
"
"" Code searcher. If you enable it, you should also configure g:hound_base_url 
" and g:hound_port, pointing to your hound instance
" Plug 'mattn/webapi-vim'
" Plug 'jfo/hound.vim'

" Tell vim-plug we finished declaring plugins, so it can load them


"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" СПИСОК ПЛАГІНІВ
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
call plug#end()

" Налаштовуємо редактор та плагіни

" Застосовуємо налаштування для VIM
if it_Vim
    " вимкнути режим сумісності з класичним редактором Vi
    set nocompatible
    filetype plugin indent on
    " завжди відображати рядок стану
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
  colorscheme dracula
endif

if it_NVim
    if empty(glob("~/.config/nvim/plugged/vim-airline/autoload/airline.vim"))   
    :PlugInstall
  endif
  set termguicolors
  colorscheme ayu
  let ayucolor="dark" 
endif

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

if has('gui_running') || it_NVim || (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256')
    if !has('gui_running')
        let &t_Co = 256
    endif
"    colorscheme vim-monokai-tasty
else
"    colorscheme delek
endif

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
au FileType make set tabstop=8 shiftwidth=8
"au FileType markdown set nowrap
"set wrap linebreak nolist textwidth=80
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
"
" Примушуэмо Vi розуміти укарїінську мову і москальску підключимо
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫІЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSSTUVWXYZ,фисвуапршолдьтщзйкыіегмцчня;abcdefghijklmnopqrsstuvwxyz

"Налаштування фолдингу
set foldenable
set foldmethod=syntax " визначати блоки тексту по синтаксису
set foldmethod=indent " визначати блоки зп відступом
set foldcolumn=3 " Показати полосу для керування згоротанням
set foldlevel=1 " Перший рівень вкладеності відкритий, решта закриті
set foldopen=all " автоматическое открытие сверток при заходе в них
set tags=tags\ $VIMRUNTIME/systags " Шукати теги в поточному каталозі (теги генерируются ctags)

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 " Увімкнути підтримку Powerline шрифтів
let g:airline#extensions#keymap#enabled = 1 "Не показывать текущий маппинг
let g:airline_section_z = "\ue0a1:%l/%L Col:%c" " Кастомна графа положення курсору
let g:Powerline_symbols='unicode' " Підтримка unicode
let g:airline#extensions#xkblayout#enabled = 1 "

let g:tex_flavor = 'latex' " LaTeX
let g:vimtex_quickfix_mode = 0 "Отключаем автоматическое открытие окна Quickfix
map <C-n> :NERDTreeToggle
map <C-f> :ClangFormat

nnoremap <leader>ld :LivedownToggle<CR>
