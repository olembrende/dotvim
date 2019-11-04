" cd ~\Documents

let g:python3_host_prog='C:\Python37\python.exe'
let g:python_host_prog='C:\Python27\python.exe'

" let g:python3_host_prog='C:/ProgramData/Anaconda3/python.exe'
"
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
" call plug#begin('~/.vim/plugged')
call plug#begin('~\appdata\local\nvim\plugged')


	"Colorschemes
	Plug 'flazz/vim-colorschemes'

    Plug 'gilgigilgil/anderson.vim'

	" Make sure you use single quotes
	"LaTeX https://github.com/donRaphaco/neotex
	"Plug 'donRaphaco/neotex', { 'for': 'tex' }

	" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
	"Plug 'junegunn/vim-easy-align'

	" Any valid git URL is allowed
	"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

	" Multiple Plug commands can be written in a single line using | separators
	Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

	" On-demand loading
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

	"Neosnippet
	" if has('nvim')
	"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	" else
	"   Plug 'Shougo/deoplete.nvim'
	"   Plug 'roxma/nvim-yarp'
	"   Plug 'roxma/vim-hug-neovim-rpc'
	" endif
	" Plug 'Shougo/neosnippet.vim'
	" Plug 'Shougo/neosnippet-snippets'
	Plug 'zchee/deoplete-jedi'

	"Kommentarer med gcc og gc+motion
	Plug 'tpope/vim-commentary'

    "Syntaks for funksjoner
    Plug 'davidhalter/jedi-vim'

    "Python plugin
    Plug 'python-mode/python-mode', { 'branch': 'develop' }

    " Plug 'Lokaltog/vim-easymotion'

    " Plug 'haya14busa/incsearch.vim'
    " Plug 'osyo-manga/vim-anzu'

    Plug 'daeyun/vim-matlab', { 'do': ':UpdateRemotePlugins' }
    Plug 'djoshea/vim-matlab-fold'
    Plug 'vim-scripts/MatlabFilesEdition'
    
	"LaTeX
	Plug 'lervag/vimtex'

    "Easy align
    Plug 'junegunn/vim-easy-align'

    " Change delimiters
    Plug 'tpope/vim-surround'

    " Fancy git stuff Gdiff 
    Plug 'tpope/vim-fugitive'
    
    " TOML syntax highlighting
    Plug 'cespare/vim-toml'
    "
    Plug 'ludovicchabant/vim-gutentags'

    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'majutsushi/tagbar'

    " If you don't have nodejs and yarn
    " " use pre build
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

    Plug 'dense-analysis/ale'
" Initialize plugin system
call plug#end()

"NERDTree mappings
silent! nmap <C-p> :NERDTreeToggle <CR>
silent! map <F3> :NERDTreeFind<CR>
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"
let g:NERDTreeWinSize=70

" HIGHLIGHTING AND COLORS
syntax on
set termguicolors
colorscheme molokai

set spell
"TODO a bind to change error? Or should it be a little bit hard?

set encoding=utf-8
set tabstop=4
set shiftwidth=4

set autoread
au FocusGained * :checktimeautoindent

" Expand tabs into spaces
set expandtab
" set cursorline

set colorcolumn=100
set linebreak
" Split navigation
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>


" LATEX Settings
let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options
\ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'

" Ensure that all tex files are interpreted as latex and not plaintex
let g:tex_flavor = "latex"

" Hjelper dette med å få bibtex til å kjøre?
let g:Tex_MultipleCompileFormats='pdf,bib,pdf'


" AUTOCOMPLETE
" " Use deoplete.
" let g:deoplete#enable_at_startup = 1
" " let g:deoplete#sources#jedi#python_path='C:/Python37/python.exe'
" let g:deoplete#sources#jedi#python_path='C:/ProgramData/Anaconda3/python.exe'

" Pass a dictionary to set multiple options
" call deoplete#custom#option({
" \ 'auto_complete_delay': 0
" \ })


" " SEARCH
" " Use incsearch.vim for all search functions (with anzu for indication)
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)
" let g:incsearch#auto_nohlsearch = 1
" set hlsearch
" map n <Plug>(incsearch-nohl)<Plug>(anzu-n-with-echo)
" map N <Plug>(incsearch-nohl)<Plug>(anzu-N-with-echo)
" map * <Plug>(incsearch-nohl)<Plug>(anzu-star-with-echo)
" map # <Plug>(incsearch-nohl)<Plug>(anzu-sharp-with-echo)
" let g:anzu_status_format = "%p(%i/%l) %w"

" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)

" ULTI SNIPS SETTINGS
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsSnippetDirectories = [$HOME.'\AppData\Local\nvim\custom-snippets', 'UltiSnips']

"Relative line numbers
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
imap <C-c> <Esc>

"PYTHON
let g:pymode_python='python3'
let g:pymode_virtualenv = 1
let g:pymode_virtualenv_path='C:/ProgramData/Anaconda3/python.exe'
" let g:pymode_viritualenv_path = "C:\ProgramData\Anaconda3"
" Open split from Python mode to the right instead of below
" autocmd BufEnter __run____doc__ :wincmd L
autocmd BufEnter __run__,__doc__ :wincmd L

set splitright
set splitbelow
"
" map <c-Enter> :w<CR><leader>r

" inoremap <silent>
" function! s:my_cr_function()
"     return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
" endfunction
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" This unsets the 'last search pattern' register by hitting ;
" nnoremap ; :noh<CR>:<backspace>

" " Integrate incsearch and easymotion
" " https://github.com/Lokaltog/vim-easymotion/issues/146#issuecomment-75443473
" " Can use / for 'normal searching', at anytime its possible to use <space> to
" " pass search over to easymotion. To use spaces in search you need to apply
" " them via the regex approach \s.
" augroup incsearch-easymotion
"   autocmd!
"   autocmd User IncSearchEnter autocmd! incsearch-easymotion-impl
" augroup END
" augroup incsearch-easymotion-impl
"   autocmd!
" augroup END
" function! IncsearchEasyMotion() abort
"   autocmd incsearch-easymotion-impl User IncSearchExecute :silent! call EasyMotion#Search(0, 2, 0)
"   return "\<CR>"
" endfunction
" let g:incsearch_cli_key_mappings = {
" \   "\<Space>": {
" \       'key': 'IncsearchEasyMotion()',
" \       'noremap': 1,
" \       'expr': 1
" \   }
" \ }

augroup lang_matlab
    autocmd!
    autocmd FileType matlab setlocal commentstring=%\ %s
augroup END

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" For Gdiff open vertical! Vim-fugitive
set diffopt+=vertical

" Map quickfixes
" noremap <F9> :vimgrep /TODO/ **/*.* <CR> :copen <CR>
" noremap <F10> :vimgrep /FIXME/ **/*.* <CR> :copen <CR>
noremap <F9> :vimgrep /TODO/ % <CR> :copen <CR>
noremap <F10> :vimgrep /FIXME/ % <CR> :copen <CR>
noremap <F11> :cp <CR> zz
noremap <F12> :cn <CR> zz
nnoremap <C-F9> :lopen <CR>
nnoremap <C-F10> :lclose <CR>
nnoremap <C-F11> :lprev <CR> zz
nnoremap <C-F12> :lnext <CR> zz
let g:pymode_lint_ignore=["E501", "E221"]

" Yeank filename to windows clipboard
nnor ,fn :let @*=expand("%:t:r")<CR>      " Mnemonic: yank File Name

cd c:\repositories\crackd

" To move around with Ctags on Norwegian keyboard
nmap <C-i> <C-]>
nmap <F8> :TagbarToggle<CR>
let g:ctrlp_map = '<c-k>'
" set grepprg="~/AppData/Local/nvim/fs.bat"

" MARKDOWN VIEWER
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 0

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }

" use a custom markdown style must be absolute path
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'


let g:ale_linters = {'tex': ['chktex'], 'matlab': ['mlint']}
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_open_list = 0
let g:ale_set_signs = 1

" Disable tabline
call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
