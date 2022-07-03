" vim-bootstrap 2022-06-17 20:05:23

"*****************************************************************************
"" Vim-Plug core
"*****************************************************************************
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if has('win32')&&!has('win64')
  let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else
  let curl_exists=expand('curl')
endif

let mapleader = ","

let g:vim_bootstrap_langs = "c,go,html,javascript,lisp,lua,perl,php,python,ruby,rust,typescript"
let g:vim_bootstrap_editor = "nvim" " nvim or vim

if !filereadable(vimplug_exists)
  if !executable(curl_exists)
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Instalando Vim-Plug..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif


" CONFIGURACION DE STATUS LINE
set statusline=%F%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif


" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

" NERDTREE
" ---------------------------------------------------------------------------------
Plug 'preservim/nerdtree'
" https://github.com/preservim/nerdtree
" Explorador de archivos, para navegar visualmente por jerarquia de
" directorios, abrir archivos o editarlos

Plug 'Xuyuanp/nerdtree-git-plugin'
" https://github.com/Xuyuanp/nerdtree-git-plugin
" Complemento de NERDTree que muestra indicadores de estado de Git

" Icon pack
" Plug 'ryanoasis/vim-devicons'
" Plug 'mhinz/vim-signify'

Plug 'mhinz/vim-startify'
" https://github.com/mhinz/vim-startify
" Elegante pantalla de inicio para Vim, que proporciona encabezados o pies de
" pagina creados dinamicamente para mostrar sesiones persistentes o archivos
" usados recientemente o marcados
" DOCUMENTACION Y CONFIGURACION = :h startify o tambien, :h startify-faq


Plug 'tpope/vim-commentary'
" https://github.com/tpope/vim-commentary
" Comentar, use gcc para comentar una linea, y gc para comentar un objetivo en
" movimiento, gcap para comentar un parrafo, gc para comentar una seleccion en
" modo seleccionar


Plug 'tpope/vim-fugitive'
" https://github.com/tpope/vim-fugitive
" Complemento de Vim para Git ( :help fugitive para ver todos los comandos
" para git)


Plug 'itchyny/lightline.vim'
" https://github.com/itchyny/lightline.vim
" Airline (Lightline, mi tema escogido será: rosepine ( background=dark /
" background=light)


Plug 'airblade/vim-gitgutter'
" https://github.com/airblade/vim-gitgutter
" Complemento de Vim que muestra una diferenca de git en la columna mediante
" un sigo (+ -) acerca de que lineas se han agregado, modificado o eliminado


Plug 'Raimondi/delimitMate'
" https://github.com/Raimondi/delimitMate
" Complemento que proporciona el cierre automatico de comilla, paréntesis,
" corchetes, etc


Plug 'lukas-reineke/indent-blankline.nvim'
" https://github.com/lukas-reineke/indent-blankline.nvim
" Complemento para agregar lineas de sangría a todas las línea (incluidas las
" vacias)


" THEME
" https://github.com/shaunsingh/moonlight.nvim
Plug 'shaunsingh/moonlight.nvim'

"---------------------------------------------------------------------------------
" FZF
" https://github.com/junegunn/fzf.vim
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif
"  -------------------------------------------------------------------------------

" Snippets
Plug 'SirVer/ultisnips'
" https://github.com/SirVer/ultisnips
" UltiSnips muestras fragmentos que pueden ir despúes de lo que se vaya
" codificando, python

Plug 'honza/vim-snippets'
" https://github.com/honza/vim-snippets
" Fragmentos de snipMate y UltiSnips, contiene fragmentos de archivos para
" varios lenguajes de programación

" --------------------------------------------------------------------------------


" --------------------------------------------------------------------------------
" TELESCOPE
" https://github.com/nvim-telescope/telescope.nvim
" Es un buscador difuso altamente extensible sobre listas
" Dependecias
Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()
" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0

" --------------------------------------------------------------------------------

" THEME
" colorscheme moonlight

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------





" CONFIGURACION POR ORDEN DE PLUGINS

" NERDTREE
" --------------------------------------------------------------------------------
"
" --------------------------------------------------------------------------------
" NERDTREE-GIT-PLUGIN
" https://github.com/Xuyuanp/nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" Configuración de simbolos (puede personalizarlos como desee,pero por defecto
" seran los siguientes ↑


" Instalación de NerdFonts
let g:NERDTreeGitStatusUseNerdFonts = 1
" Proyecto que parchea las fuentes especificas del desarrollador con una gran
" cantidad de iconos


" Mostrar el estado IGNORADO
let g:NERDTreeGitStatusShowIgnored = 0
" Valor por defecto = 0 (Reasignarlo en caso de ver lentitud en su ejecución o
" ejecución del editor


" Mostrar o indicar que archivo esta sin seguimiento en un directorio sin
" seguimiento
let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
" Valor por defecto = normal

" Configurar la ruta del archivo ejecutable de git
" let g:NERDTreeGitStatusGitBinPath = '/your/file/path'
" Valor por defecto = git (búsqueda automática en la ruta)

" Mostrar indicador (clean) de limpieza
let g:NERDTreeGitStatusShowClean = 1
" Valor por defecto = 0


" DEMAS CONFIGURACIONES (leer la descripcion de cada uno de ellos)
" --------------------------------------------------------------------------------

" Quitar resaltado de palabras despúes de hacer una busqueda
" Dependiendo gustos, por mi parte lo mantengo activado
set nohlsearch



" AIRLINE
" Deshacerse del insert inferior que viene por defecto en vim (en caso de
" tener conflictos o repeticiones del modo en que esta codificando con el
" Airline externo que importo)
set noshowmode

" Esquema de colores Airline
" Segun el tema de airline esocgido que estan en: https://github.com/itchyny/lightline.vim/blob/master/colorscheme.md#16color-backgrounddark
let g:lightline = {
      \ 'colorscheme': 'OldHope',
      \ }
" DOCUMENTACION Y CONFIGURACION
" :h g:lightline.colorscheme
" DEMAS TEMAS DE MI GUSTO CON LIGHTLINE (rosepine,one,OldHope, solo es
" reemplazar el colorscheme por alguno de ellos)

set ignorecase
" Ignorar las mayusculas y minusculas mientras se hace una busqueda


filetype plugin indent on
" Es una combinación tres comandos, los cuales activan la detección, el
" complemento y la sangría

set encoding=utf-8
" Abrir todos los archivos en utf-8

set number relativenumber
" Numeros de lineas relativos

set showmatch
" Muestra el parentesis o llave de cierre cuando el cursor esta sobre el
" parentesis o llave de apertura, y viceversa

set hidden
" Mostrar o activar los buferes ocultos

set backspace=indent,eol,start
" Corregir sangria de retroceso

syntax on

set wildmenu
" Finalizacion de la linea de comandos


augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END
" Realizar sincronización de resaltado de sintaxis desde el iniio a menor de
" 200 lineas


augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
" Recordar la posición del cursor


"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread


"" Split
noremap <Leader>h :<C-u>split<CR>
" Crear un split horizontal
noremap <Leader>v :<C-u>vsplit<CR>
" Crear un split vertical


"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Git commit --verbose<CR>
noremap <Leader>gsh :Git push<CR>
noremap <Leader>gll :Git pull<CR>
noremap <Leader>gs :Git<CR>
noremap <Leader>gb :Git blame<CR>
noremap <Leader>gd :Gvdiffsplit<CR>
noremap <Leader>gr :GRemove<CR>

"" Tabs
nnoremap <Tab> gt
" Navegar entre las ventanas hacia adelante
nnoremap <S-Tab> gT
"Navegar entre las ventanas hacia atrás
nnoremap <silent> <S-t> :tabnew<CR>
" Crear un nueva ventana


nnoremap n nzzzv
" Navegar entre los resultados hacia adelante
nnoremap N Nzzzv
" Navegar entre los resultados hacia atrás


nnoremap <silent> <leader>sh :terminal<CR>
" Abrir terminal dentro de vim 

noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
" Buscar y abrir un archivo para editarlo desde vim/neovim

noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
" Buscar, ingresar y abrir carpetas para encontrar

" Sintaxis para python

if filereadable(expand("~/.config/nvim/local_init.vim"))
  source ~/.config/nvim/local_init.vim
endif
" Incluir la configuracion vim local del usuario

" MAPEOS
" --------------------------------------------------------------------------------
" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
" Abrir nerdtree
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" --------------------------------------------------------------------------------
"  FZF CONFIGURACION
"  fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

" Mapeo FZF
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>
"Recovery commands from history through FZF
nmap <leader>y :History:<CR>

" --------------------------------------------------------------------------------
" Mapeo UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
" Disparador de salto hacia adelante UltiSnips

let g:UltiSnipsJumpForwardTrigger="<tab>"
" Gatillo de expansion UltiSnips

let g:UltiSnipsJumpBackwardTrigger="<c-b>"
" UltiSnips salta el gatillo hacia atrás

let g:UltiSnipsEditSplit="vertical"
" Division de edición de UltiSnips

" --------------------------------------------------------------------------------
"
"  TELESCOPE
