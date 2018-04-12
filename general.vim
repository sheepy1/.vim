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
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html
autocmd BufRead,BufNewFile *.less setlocal filetype=less.css

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
nmap <leader>fs :w!<cr>

" Fast quit
nmap <leader>q :q!<cr>
" nmap <leader>wd :q!<cr>

" Save and quit
nmap <leader>x :x!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Insert mode mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <C-l> i<C-x><C-o>

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
autocmd BufEnter *.md exe 'nnoremap <leader>r :!open -a "MacDown.app" "%"<CR><CR>'

autocmd BufEnter *.html exe 'nnoremap <leader>r :!open "%"<CR><CR>'

" Run python script
au BufEnter *.py exe 'nnoremap <leader>r :call RunPython()<cr>'
function RunPython()
    :w! | !python3 "%"
endfunction

au BufEnter *.js exe 'nnoremap <leader>r :call RunJavaScript()<cr>'
function RunJavaScript()
    :w! | !node "%"
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search in VISUAL
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap gd y:/<C-R>"<CR>
vnoremap gs y:Ack! <C-R>"<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => config vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command ConfigGeneral vsp ~/.vim/general.vim
command ConfigPlugin vsp ~/.vim/plugin.vim
command ConfigUI vsp ~/.vim/user-interface.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Search down into subfolders (Use CtrlP instead)
" Provides tab-completion for all file-related tasks
" So we can:
" - Hit tab to :find <filename> by partial match
" - Use * to make it fuzzy
" - :b <filename> can autocomplete any open buffer
set path+=**
" Don't offer to open certain files/directories

" File browsing (Use NERDTree instead)
" So we can:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings
" let g:netrw_banner=0            " disable annoying banner
" let g:netrw_liststyle=3         " tree view
" let g:netrw_browse_split=4      " open in prior window
" let g:netrw_altv=1              " open splits to the right
" let g:netrw_winsize=25
" let g:netrw_list_hide=netrw_gitignore#Hide()
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
" augroup ProjectDrawer
" autocmd!
" autocmd VimEnter * :Vexplore
" augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai " Auto indent
set si " Smart indent
set wrap " Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" map <space> /
" map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>
map <silent> <leader>sc :noh<cr>

" Smart way to move between windows
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l
" learn from spacemacs
" nmap <leader>wj <C-w>j
" nmap <leader>wk <C-w>k
" nmap <leader>wh <C-w>h
" nmap <leader>wl <C-w>l
nmap <leader>sh gd

" Close the current buffer
nmap <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
" map <leader>ba :bufdo bd<cr>

" switch buffer
" nmap L :bnext<cr>
" nmap H :bprevious<cr>
nmap L <C-i>
nmap H <C-o>

" Useful mappings for managing tabs
nmap J :tabprevious<cr>
nmap K :tabnext<cr>
nmap t :tabnew<cr>
" map <leader>to :tabonly<cr>
" map <leader>tc :tabclose<cr>
" map <leader>tm :tabmove
" map <leader>t<leader> :tabnext

" Let 'tl' toggle between this and the last accessed tab
" let g:lasttab = 1
" nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
" au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
nmap tn :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" if has("mac") || has("macunix")
"     nmap <D-j> <M-j>
"     nmap <D-k> <M-k>
"     vmap <D-j> <M-j>
"     vmap <D-k> <M-k>
" endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre * :call CleanExtraSpaces()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>e :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
" map <leader>x :e ~/buffer.md<cr>


" Convert markdown to confluencemarkup
" autocmd BufEnter *.md exe 'noremap <leader>c :call MarkdownToConfluence()<CR><CR>'
" function MarkdownToConfluence()
    " :!markdown2confluence "%" | pbcopy
" endfunction

" Toggle paste mode on and off
" map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction
