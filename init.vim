"cd C:\Users\olema\Documents

let g:python3_host_prog='C:/Python37/python.exe'
" let g:python3_host_prog='C:/ProgramData/Anaconda3/python.exe'
"
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

    Plug 'Lokaltog/vim-easymotion'

    Plug 'haya14busa/incsearch.vim'
    Plug 'osyo-manga/vim-anzu'

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


" Use incsearch.vim for all search functions (with anzu for indication)
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
set hlsearch
map n <Plug>(incsearch-nohl)<Plug>(anzu-n-with-echo)
map N <Plug>(incsearch-nohl)<Plug>(anzu-N-with-echo)
map * <Plug>(incsearch-nohl)<Plug>(anzu-star-with-echo)
map # <Plug>(incsearch-nohl)<Plug>(anzu-sharp-with-echo)
let g:anzu_status_format = "%p(%i/%l) %w"

" Integrate incsearch and easymotion
" https://github.com/Lokaltog/vim-easymotion/issues/146#issuecomment-75443473
" Can use / for 'normal searching', at anytime its possible to use <space> to
" pass search over to easymotion. To use spaces in search you need to apply
" them via the regex approach \s.
augroup incsearch-easymotion
  autocmd!
  autocmd User IncSearchEnter autocmd! incsearch-easymotion-impl
augroup END
augroup incsearch-easymotion-impl
  autocmd!
augroup END
function! IncsearchEasyMotion() abort
  autocmd incsearch-easymotion-impl User IncSearchExecute :silent! call EasyMotion#Search(0, 2, 0)
  return "\<CR>"
endfunction
let g:incsearch_cli_key_mappings = {
\   "\<Space>": {
\       'key': 'IncsearchEasyMotion()',
\       'noremap': 1,
\       'expr': 1
\   }
\ }


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
" let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsEditSplit="horizontal"


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

" Pass a dictionary to set multiple options
call deoplete#custom#option({
\ 'auto_complete_delay': 0
\ })



" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"PYTHON
let g:pymode_python='python3'
" let g:pymode_viritualenv_path = "C:\ProgramData\Anaconda3"
" Open split from Python mode to the right instead of below
" autocmd BufEnter __run____doc__ :wincmd L
autocmd BufEnter __run__,__doc__ :wincmd L
set splitright

map <c-Enter> :w<CR><leader>r

" inoremap <silent>
" function! s:my_cr_function()
"     return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
" endfunction
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" This unsets the 'last search pattern' register by hitting ;
nnoremap ; :noh<CR>:<backspace>

" Integrate incsearch and easymotion
" https://github.com/Lokaltog/vim-easymotion/issues/146#issuecomment-75443473
" Can use / for 'normal searching', at anytime its possible to use <space> to
" pass search over to easymotion. To use spaces in search you need to apply
" them via the regex approach \s.
augroup incsearch-easymotion
  autocmd!
  autocmd User IncSearchEnter autocmd! incsearch-easymotion-impl
augroup END
augroup incsearch-easymotion-impl
  autocmd!
augroup END
function! IncsearchEasyMotion() abort
  autocmd incsearch-easymotion-impl User IncSearchExecute :silent! call EasyMotion#Search(0, 2, 0)
  return "\<CR>"
endfunction
let g:incsearch_cli_key_mappings = {
\   "\<Space>": {
\       'key': 'IncsearchEasyMotion()',
\       'noremap': 1,
\       'expr': 1
\   }
\ }
