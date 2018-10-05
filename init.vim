cd C:\Users\olema\Documents

let g:python3_host_prog='C:/Python37/python.exe'

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
" call plug#begin('~/.vim/plugged')
call plug#begin('~/appdata/local/nvim/plugged')

	"LaTeX
	Plug 'lervag/vimtex'

	"Colorschemes
	Plug 'flazz/vim-colorschemes'

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
	if has('nvim')
	  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	else
	  Plug 'Shougo/deoplete.nvim'
	  Plug 'roxma/nvim-yarp'
	  Plug 'roxma/vim-hug-neovim-rpc'
	endif
	" Plug 'Shougo/neosnippet.vim'
	" Plug 'Shougo/neosnippet-snippets'
	Plug 'zchee/deoplete-jedi'

	"Kommentarer med gcc og gc+motion
	Plug 'tpope/vim-commentary'

    "Syntaks for funksjoner
    Plug 'davidhalter/jedi-vim'

    "Python plugin
    Plug 'python-mode/python-mode', { 'branch': 'develop' }

    " Trenger å fikse noe leader greier for å bruke easymotion
    " "Plug 'Lokaltog/vim-easymotion'

" Initialize plugin system
call plug#end()

" Spesifiser path til vimrc for å raskt kunne redigere.
" :exe 'cd' base_path
let base_path = "C:\\Users\\olemarbr\\AppData\\Local\\nvim"

"NERDTree mappings
silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"

"let maplocalleader="_"

syntax on
set termguicolors
"colorscheme evening
colorscheme molokai
"colorscheme gruvbox
"colorscheme jellybeans

let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options
\ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'

" Hjelper dette med å få bibtex til å kjøre?
let g:Tex_MultipleCompileFormats='pdf,bib,pdf'

" Use deoplete.
let g:deoplete#enable_at_startup = 1
" NEOSNIPPET
" Plugin key-mappings.
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


"Relative line numbers
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
imap <C-c> <Esc>

set spell
map <C-S> ]s
"TODO a bind to change error? Or should it be a little bit hard?

set encoding=utf-8
set tabstop=4
set shiftwidth=4

set autoindent

" Expand tabs into spaces
set expandtab
" set cursorline

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"PYTHON
 let g:pymode_python='python3'

" inoremap <silent>
" function! s:my_cr_function()
"     return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
" endfunction
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"



