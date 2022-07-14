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


" Habilitar bombilla
let b:coc_lightbulb_disable = 1


" Comando para scss recomendado por coc al instalar el servidor de css 
autocmd FileType scss setl iskeyword+=@-@

" CONFIGURACION DE STATUS LINE
set statusline=%F%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" ------------------------------------------------------------------------
source $HOME/.config/nvim/plug-config/coc.vim
" NODEJS & COC NVIM
" (leer todo este apartado para un correcto funcionamiento de Coc)

let g:coc_node_path = '/home/nativeinsect/.nvm/versions/node/v16.15.1/bin/node'
let g:python3_host_prog = '/usr/bin/python3'



" La ruta en donde node se ejecutará puede variar, asi que en su terminal
" ingrese el siguiente comando para conocer dicha ruta:

" nvm which current

" Y aquella ruta la copiaremos y reemplazaremos con la anterior ruta que
" estaba en let g:coc_node_path y instalaremos con :PlugInstall


" -------------------------------------------------------------------------

set encoding=UTF-8
" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'neoclide/coc.nvim', {'branch': 'release'}


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

" html
"" HTML Bundle
Plug 'hail2u/vim-css3-syntax'
Plug 'gko/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'

" javascript
"" Javascript Bundle
Plug 'jelera/vim-javascript-syntax'

" Python
Plug 'davidhalter/jedi-vim'

" Asycomplete
Plug 'prabirshrestha/asyncomplete.vim'

" THEME
" https://github.com/shaunsingh/moonlight.nvim
" Plug 'shaunsingh/moonlight.nvim'
Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }

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

Plug 'panglass/vim-javascript'
" Colores o soporte para javascript

Plug 'leafgarland/typescript-vim'
" Colores o soporte para Typescript

" --------------------------------------------------------------------------------

Plug 'vim-scripts/grep.vim'
" Intrega herramientas grep, fgrep, egrep, y agrep con Vim 

" --------------------------------------------------------------------------------
Plug 'vim-scripts/CSApprox'
" Hacer que el esquema de color sea justo, o algo asi

" --------------------------------------------------------------------------------
" TELESCOPE
" https://github.com/nvim-telescope/telescope.nvim
" Es un buscador difuso altamente extensible sobre listas
" Dependecias
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Terminal flotante
Plug 'voldikss/vim-floaterm'


call plug#end()

colorscheme embark

" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings =0

" --------------------------------------------------------------------------------


" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" --------------------------------------------------------------------------
" --------------------------------------------------------------------------
" GREP
" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'
" -----------------------------------------------------------------------

" CONFIGURACION ASYNCOMPLETE
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" Ventana emergene automatica
let g:asyncomplete_auto_popup = 1
" en caso de deshabilitar esta opción dejar en 0

" Ventana de vista previa
let g:asyncomplete_auto_completeopt = 1
set completeopt=menuone,noinsert,noselect,preview

" Cerrar automaticamente la ventana de vista previa cuando se completa
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
" ------------------------------------------------------------------------

" THEME
" colorscheme moonlight

" --------------------------------------------------------------------------------
" --------------------------------------------------------------------------------
" SPLITS CONFIGURACION
nnoremap <silent> <Leader>v+ :exe "resize " . (winheight(0) * 5/4)<CR>
nnoremap <silent> <Leader>v- :exe "resize " . (winheight(0) * 4/5)<CR>
nnoremap <silent> <Leader>h+ :exe "vertical resize " . (winwidth(0) * 5/4)<CR>
nnoremap <silent> <Leader>h- :exe "vertical resize " . (winwidth(0) * 4/5)<CR>

" CAMBIAR DE SPLIT
map <C-Left> <C-w>h
map <C-Down> <C-w>j
map <C-Up> <C-w>k
map <C-Right> <C-w>l


nnoremap <silent> <C-q> :lclose<bar>b#<bar>:bd #<CR>
" Cierra buffers de split o ventanas



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
noremap <Leader>hh :<C-u>split<CR>
" Crear un split horizontal
noremap <Leader>vv :<C-u>vsplit<CR>
" Crear un split vertical




" -------------------------------------------------------------------------------
" Mapeos personalizados por mi
noremap <leader>w :w<cr>
" Guardar archivo reemplazando los dos puntos por el mapleader
noremap <leader>ww :w!<cr>
" Sobreescribir archivo reemplazando los dos puntos por el mapleader
noremap <leader>wq :wq<cr>
" Guardando y cerrando archivo reemplazando los dos puntos por el mapleader
noremap <leader>q :q<cr>
" Cerrando el archivo reemplazando los dos puntos por el mapleader
noremap <leader>qq :q!<cr>
" Forzar el cierre del archivo reemplazando los dos puntos por el mapleader

" COC SEARCH
noremap <leader>cs :CocSearch<cr>
" Buscar funciones y variables

noremap <leader>fs :Files<cr>
" Encontrar ficheros

" -------------------------------------------------------------------------------

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


nnoremap <silent> <leader>tt :terminal<CR>
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

" CAMBIAR DE MODO
:imap ii <Esc>

" -------------------------------------------------------------------------------
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
" --------------------------------------------------------------------------------

"  CONFIG COC

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" CONFIGURACION FLOATERM
" https://github.com/voldikss/vim-floaterm
nnoremap <leader>tt :FloatermNew<cr>
" Abrir la terminal flotante

nnoremap <leader>ty :FloatermToggle<cr>
" Ocultar/reabrir la terminal flotante

nnoremap <leader>tp :FloatermNew python<cr>
" Abrir terminal con Python

" CONFIGURACION JEDI
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
