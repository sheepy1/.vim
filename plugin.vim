" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Auto select keyboard(switch to en when turn to normal mode)
Plug 'ybian/smartim'

" Syntastic(It looks like unnessary for fe, because we have eslint.)
Plug 'vim-syntastic/syntastic'
Plug 'mtscout6/syntastic-local-eslint.vim'

" ghc-mode
Plug 'eagletmt/ghcmod-vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" CtrlP
Plug 'https://github.com/ctrlpvim/ctrlp.vim'

" Search across files
Plug 'mileszs/ack.vim'

" Emmet
Plug 'https://github.com/mattn/emmet-vim'

" Snippet
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Comment
Plug 'tomtom/tcomment_vim'

" Completion
Plug 'Valloric/YouCompleteMe'

" Color Scheme
Plug 'altercation/vim-colors-solarized'

" Translate(Has some problems, maybe I could write one by myself.)
" Plug 'https://github.com/vim-scripts/TranslateEnToCn'

" Less highlight
" Plug 'groenewege/vim-less'

" Surround(cs'" to change 'hello' to "hello", cst" to change <div>hello</div> to "hello")
Plug 'tpope/vim-surround'

" Light line
Plug 'itchyny/lightline.vim'

" Solve the css's indent problem in html file
Plug 'othree/html5.vim'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Indent file with .editorconfig
" Plug 'maksimr/vim-jsbeautify'
" map <c-f> :call JsBeautify()<cr>

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree' " , { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' } " Generate config file for YCM

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()

" JSX in .js
let g:jsx_ext_required = 0

" Ack config
let g:ackprg = "ag --vimgrep --smart-case"
cnoreabbrev ack Ack!
nnoremap gs yiw:Ack! <C-R>"<Cr>

" NERDTree config
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

" Emmet config
let g:user_emmet_leader_key = ','
let g:user_emmet_mode = 'n'
" let g:user_emmet_install_global = 0
" autocmd FileType html,javascript,less EmmetInstall

" Completion & Snippet config
let g:ycm_key_list_select_completion = ['<C-n>', '<Tab>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<S-Tab>']
let g:SuperTabDefaultCompletionType = ['<Tab>']
" let g:ycm_autoclose_preview_window_after_insertion = 1
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" CtrlP config
let g:ctrlp_map = '<leader>o'
" When invoked without an explicit starting directory, CtrlP will set its local working directory according to this variable
" 'r' - the nearest ancestor of the current file that contains one of these directories or files: .git .hg .svn .bzr _darcs
" 'a' - the directory of the current file, unless it is a subdirectory of the cwd
let g:ctrlp_working_path_mode = 'ra'
" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Syntastic config
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_javascript_checkers = ['eslint'] "Use eslint for syntax checking
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

" Completion
" set omnifunc=syntaxcomplete#Complete

