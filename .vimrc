" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

runtime! debian.vim


" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

call plug#begin("~/.vim/plugged")
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'terryma/vim-expand-region'
Plug 'tomtom/tcomment_vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-abolish'
" Plug 'chrisbra/csv.vim'
Plug 'chr4/nginx.vim'
" vimgutter // try later
" Plug 'stephpy/vim-php-cs-fixer'
" Plug 'fgsch/vim-varnish'
Plug 'jwalton512/vim-blade'
Plug 'iamcco/coc-tailwindcss'
Plug 'madox2/vim-ai'
call plug#end()

" Set vim leader to space
let mapleader = "\<Space>"

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
filetype plugin indent on
filetype plugin on


" ---------------------------------------------------------------------------
" ---------------------------------------------------------------------------
" VISUAL CONFIGURATION

syntax enable
set background=dark
colorscheme solarized

" Highlight current line
set cursorline

" Make line number area no color , to be aligned with the rest
highlight LineNR ctermfg=NONE ctermbg=NONE
" Make cursor line number to a different color , to indicate where I am 
highlight CursorLineNR ctermfg=NONE ctermbg=green
" Set vertical split bar to have no color 
highlight VertSplit ctermfg=none ctermbg=none


" ---------------------------------------------------------------------------
" ---------------------------------------------------------------------------
" OPTIONS

" put the new split buffer to the right side of the window when vsp
set splitright

" put the new split buffer to the below side of the window when sp
set splitbelow

" ###########################################################################

" set the command place height to 2,
" this is for avoiding some plugins issue \"press <Enter> to continue\"
" in command line place , avoiding for now , since I don't see any real reason
" to set it (yet)
set cmdheight=2

" ###########################################################################
" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" ###########################################################################

" Better command-line completion
" That means that on first <Tab> it will complete to the longest common string
" and will invoke wildmenu (a horizontal and unobtrusive little menu). On next
" <Tab> it will complete the first alternative and it will start to cycle
" through the rest. You can go back and forth with <Tab> and <S-Tab>
" respectively.
set wildmenu
set wildmode=longest:full,full

" ###########################################################################

" Show the command you have typed in the last line of the vim
set showcmd

" ###########################################################################

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
" When searching with / , this will automatically highlight the matching words
" with some color
set hlsearch

" In normal mode, not recursively map
" <C-L> = :nohl ( disable search highlighting ) + <C-L> ( which normally means
" to redraw the screen which enables search highlighting again )

" map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <silent> <C-L> :nohl<CR><C-L>

" ###########################################################################

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline

" ###########################################################################

" Use case insensitive search by default
set ignorecase
" Make it case sensitive if you use capitals in your search
set smartcase

" ###########################################################################

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" ###########################################################################

" This option disables the below scenario, it keeps cursor where it was
" (instead of beginning of the jumped line) even
" if you change the line automatically

" Press gg to jump to the beginning of the buffer and then $ to jump to the end
" of the line. (If the first line is blank, first enter some text.)
" Press gg again. The cursor will move to the start of the line.

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" ###########################################################################

" When you try to quit buffers which has unsaved changes vim prompts to save
" buffer contents to the file.
set confirm

" ###########################################################################

" First use visualbell instead of a soundbell in vim
" Then set visualbell function to null , so we can disable any belling completely 
set visualbell
set t_vb=

" ###########################################################################

" Display line numbers on the left
set number

" ###########################################################################

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" ###########################################################################

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F10>

" ###########################################################################

" Look for a tags file under current directory and all upper directories until
" you find one
set tags=./tags;/

" ###########################################################################

" Show matching brackets.
set showmatch

" ###########################################################################

" Show matches as you have typed
set incsearch

" ###########################################################################

" Set to auto read when a file is changed from the outside
set autoread

" ###########################################################################

" How many lines to scroll at a time, make scrolling appears faster
set scrolljump=3

" ###########################################################################

" Automatically save before commands like :next and :make
set autowrite

" ###########################################################################

" Enable mouse usage (all modes)
" set mouse=a

" ###########################################################################
" INDENTATION OPTIONS

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Make vim to work with spaces instead of tabs 
" when enabled causes spaces to be used instead of tab character
set expandtab

" How many columns to be used for tab characters 
" even though we are using spaces instead of tab, this setting is for existing
" tabs in file
set tabstop=4

" With expandtab on, how many space character to be used instead of tab character 
set softtabstop=4

" This specifies the amount of space char when indentation ( or auto indentation) plays in. 
" it is goodo idea to keep it aligned with softtabstop 
set shiftwidth=4

" Use undofile can keep changes perfile in tmp directory
set undofile
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Set window title useful 
set title

" ---------------------------------------------------------------------------
" ---------------------------------------------------------------------------
" MAPPINGS

" Copy with Y from the cursor to the EOL
nnoremap Y y$

" ###########################################################################

" Conveniently map ; to : , so entering command mode is easier
nnoremap ; :

" ###########################################################################

" Easy switching between splits
nnoremap <silent> <Leader><Up> :wincmd k<CR>
nnoremap <silent> <Leader>k :wincmd k<CR>

nnoremap <silent> <Leader><Down> :wincmd j<CR>
nnoremap <silent> <Leader>j :wincmd j<CR>

nnoremap <silent> <Leader><Left> :wincmd h<CR>
nnoremap <silent> <Leader>h :wincmd h<CR>

nnoremap <silent> <Leader><Right> :wincmd l<CR>
nnoremap <silent> <Leader>l :wincmd l<CR>

" ###########################################################################

" Easy write/quit
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :qa<CR>

" ###########################################################################

" Double leader exters into visual selection mode , very convenient
nnoremap <Leader><Leader> V

" ###########################################################################

" Paste a text and cursor moves to the last character in pasted text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" ###########################################################################

" Quickly select text you just wrote ; 
noremap gV `[v`]

" ###########################################################################

" Disable exmode entirely
map q: :q

" ###########################################################################

" Switch to last buffer 
nnoremap <Tab> :b#<CR>

" ###########################################################################

" List all buffers and prepare for the one you want to switch 
nnoremap <Leader>b :ls<CR>:b<Space>

" ###########################################################################

" Part of the tcomment plugin, easy toggle comments
noremap <Leader>c :TComment<enter>

" ###########################################################################

" Leader + s to replace the word under the cursor with the another one everywhere
" http://vim.wikia.com/wiki/Search_and_replace_the_word_under_the_cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" ###########################################################################

" Try to paste something over a visual selection, after the paste vim replace
" the paste buffer with the text that was visual selected, this hack prevents that
" https://stackoverflow.com/questions/290465/how-to-paste-over-without-overwriting-register
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" ###########################################################################

" Old plugins or other stuff prepared on other platforms like Mac, might include
" those chars to be the matching navigaion keys, we just mapping them to their
" intended keys to make it compatible 
map ^[OA <up>
map ^[OB <down>
map ^[OC <right>
map ^[OD <left>

" ---------------------------------------------------------------------------
" ---------------------------------------------------------------------------
" PLUGIN THINGS

" ###########################################################################
" preservim/nerdtree

" Start NERDTree only when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | wincmd p | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Show hidden files
let NERDTreeShowHidden=1

" Show the current file in Nerdtree
noremap <leader>nt :NERDTreeFind<cr>

" ###########################################################################
" 'vim-airline/vim-airline'
" 'vim-airline/vim-airline-themes'

let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1

" ###########################################################################
" ctrlpvim/ctrlp.vim

set runtimepath^=~/.vim/bundle/ctrlp.vim
" Map space+o to start ctrlp
nnoremap <Leader>o :CtrlP<CR> 

" Configures CtrlP to use git or silver searcher for autocompletion:
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

" ###########################################################################
" terryma/vim-expand-region

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" ###########################################################################
" SirVer/ultisnips

" let g:UltiSnipsExpandTrigger="<M-Insert>"
"
" let g:UltiSnipsJumpForwardTrigger="<M-Insert>"
" let g:UltiSnipsJumpBackwardTrigger="<>"


let g:UltiSnipsExpandTrigger="<Tab>"

let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<>"

" ###########################################################################
" fatih/vim-go

" Just keeping this for the record, I want struct json tags to be snakecase
" not camelcase
" let g:go_addtags_transform = "camelcase"

" To make goimports handle the formatting and imports whenever I save file
" automatically
let g:go_fmt_command = "goimports"
let g:go_imports_mode = "goimports"
let g:go_fmt_autosave = 1
let g:go_imports_autosave = 1

" If you DONT want want goimports/go_fmt command to report their failure,
" enable below line, currently I want it to report because If it reports I can
" realize it is not doing its formating duties
" let g:go_fmt_fail_silently = 1
"
" All go linters  that vim-go uses to check your file, these are executed when you explicitly do :GoMetaLinter
let g:go_metalinter_enabled = ['all']

" Whenever I save a file , automatically execute linter list below , and wait 5s max for the results
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['all']
let g:go_metalinter_deadline = "5s"

" Very important; this prevents golinters from moving the cursor to the first
" error automatically, this can be very annoying if you want to stay in your
" line after save   
let g:go_jump_to_error = 0

" Syntax Highlightings 
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" It is always good to see what vim calls
" let g:go_debug=['shell-commands'] 

" Use this option to enable/disable the default mapping of CTRL-],
" <C-LeftMouse>, g<C-LeftMouse> and (`gd`) for GoDef and CTRL-t for :GoDefPop.
" Disabling it allows you to map something else to these keys or mappings.
" Default is enabled. >
let g:go_def_mapping_enabled = 0

" Show function signatures whenever you hover them
let g:go_auto_type_info = 1
set updatetime=100

" Automatically highlight matching identifiers 
let g:go_auto_sameids = 1

" let g:go_list_type = "quickfix"

" build and run
nnoremap <Leader>gr :GoRun %<CR>
nnoremap <Leader>gR :GoRun .<CR>
nnoremap <Leader>gb :GoBuild! .<CR>

" test shortcuts
nnoremap <Leader>gt :GoTest<CR>
nnoremap <Leader>gtf :GoTestFunc<CR>
nnoremap <Leader>gtc :GoTestCompile<CR>
nnoremap <Leader>gc :GoCoverageToggle<CR>

" see all variable declarations (types, functions) in ctrlp list
nnoremap <Leader>gd :GoDecls<CR>
nnoremap <Leader>gdd :GoDeclsDir<CR>

" see all files in the same package
nnoremap <Leader>gf :GoFiles<CR>

" see all module dependencies of the current file 
nnoremap <Leader>gds :GoDeps<CR>

" see all references of the selected identifier  
nnoremap <Leader>gref :GoReferrers<CR>

" see all methods&fields about an object
nnoremap <Leader>gi :GoDescribe<CR>

" see all interfaces an object implements
nnoremap <Leader>gim :GoImplements<CR>

" My poor attempt to override :retab to be :retab and :set expandtab
command Myretab :set expandtab <bar> :retab

" -------------------------------------------------------------
" -------------------------------------------------------------
" TEMP AREA
" -------------------------------------------------------------

" " COC
"
" " Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
"
" " Give more space for displaying messages.
" set cmdheight=2
"
" " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" " delays and poor user experience.
" set updatetime=300
"
" " Don't pass messages to |ins-completion-menu|.
" set shortmess+=c
"
" " Always show the signcolumn, otherwise it would shift the text each time
" " diagnostics appear/become resolved.
" if has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif
"
" " Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" " Use <c-space> to trigger completion.
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif
"
" " Make <CR> auto-select the first completion item and notify coc.nvim to
" " format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"
" " Use `[g` and `]g` to navigate diagnostics
" " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
" " GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
"
" " Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>
"
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction
"
" " Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')
"
" " Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)
"
" " Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
"
" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder.
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end
"
" " Applying codeAction to the selected region.
" " Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)
"
" " Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)
"
" " Map function and class text objects
" " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)
"
" " Remap <C-f> and <C-b> for scroll float windows/popups.
" if has('nvim-0.4.0') || has('patch-8.2.0750')
"   nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"   inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"   inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"   vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" endif
"
" " Use CTRL-S for selections ranges.
" " Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)
"
" " Add `:Format` command to format current buffer.
" command! -nargs=0 Format :call CocAction('format')
"
" " Add `:Fold` command to fold current buffer.
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
" " Add `:OR` command for organize imports of the current buffer.
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"
" " Add (Neo)Vim's native statusline support.
" " NOTE: Please see `:h coc-status` for integrations with external plugins that
" " provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
" " Mappings for CoCList
" " Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"
"
"
"
"
"
