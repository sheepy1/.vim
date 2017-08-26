" Format
" nmap ff gg=G<C-o><C-o>

" Replace all line defaul
set gdefault

" Keep off the delay of key code such as <Esc>
set ttimeoutlen=0

" Clipboard sharing
set clipboard=unnamed

" Close compatible mode
set nocompatible

" Show command
set showcmd

" Relative numbers
set relativenumber
set number

" Treat vue file as html/javascript/less file
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css.less

" Indent before saving
" autocmd BufWritePre * :normal gg=G

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = " "
let g:mapleader = " "

" Fast saving
nmap <leader>w :w!<cr>

" Fast quit
nmap <leader>q :q!<cr>

" Save and quit
nmap <leader>x :x!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Insert mode mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap ( ()<Esc>i
" inoremap (<CR> (<CR>)<Esc>ko<Tab>
" inoremap (<Esc> (<Esc>

inoremap [ []<Esc>i
" inoremap [<CR> [<CR>]<Esc>ko<Tab>
" inoremap [<Esc> [<Esc>

inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>ko
" inoremap {<Esc> {<Esc>

inoremap ` ``<Esc>i
" inoremap `<Esc> `<Esc>

set <F13>=[25~
map  <F13> <C-CR>
map! <F13> <C-CR>
inoremap <C-CR> <Esc>A<Space>{<CR>}<Esc>ko

inoremap <C-f> <Esc>la
inoremap <C-a> <Esc>^i
inoremap <C-e> <Esc>$a
inoremap <C-d> <Esc>lxi

cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <C-k> <Esc>:

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>( ea)<Esc>bi(<Esc>
nnoremap <leader>[ ea]<Esc>bi[<Esc>
nnoremap <leader>{ ea}<Esc>bi{<Esc>
nnoremap <leader>" ea"<Esc>bi"<Esc>
nnoremap <leader>' ea'<Esc>bi'<Esc>
nnoremap <leader>` ea`<Esc>bi`<Esc>

vnoremap ( <Esc>`>a)<Esc>`<i(<Esc>
vnoremap [ <Esc>`>a]<Esc>`<i[<Esc>
vnoremap { <Esc>`>a}<Esc>`<i{<Esc>
vnoremap " <Esc>`>a"<Esc>`<i"<Esc>
vnoremap ' <Esc>`>a'<Esc>`<i'<Esc>
vnoremap ` <Esc>`>a`<Esc>`<i`<Esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto command
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open markdown files with Chrome.
autocmd BufEnter *.md exe 'nnoremap <leader>p :!open -a "MacDown.app" "%"<CR><CR'

" Run python script
au BufEnter *.py exe 'nnoremap <leader>r :!python3 "%"<CR>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search in VISUAL
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap gd y:/<C-R>"<CR>
vnoremap gs y:Ack! <C-R>"<CR>

