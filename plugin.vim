" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Search via Google
Plug 'szw/vim-g'

" Translate via Youdao API
Plug 'ianva/vim-youdao-translater'

" Auto select keyboard(switch to en when turn to normal mode)
" Plug 'hiberabyss/smartim'
" Plug 'CodeFalling/fcitx-vim-osx'

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
" Plug 'Valloric/YouCompleteMe'
Plug 'Shougo/neocomplete.vim'

" Color Scheme
" Plug 'altercation/vim-colors-solarized'
Plug 'colepeters/spacemacs-theme.vim'

" Translate(Has some problems, maybe I could write one by myself.)
" Plug 'https://github.com/vim-scripts/TranslateEnToCn'

" Less highlight
" Plug 'groenewege/vim-less'

" Surround(cs'" to change 'hello' to "hello", cst" to change <div>hello</div> to "hello")
Plug 'tpope/vim-surround'

" Light line
Plug 'itchyny/lightline.vim'

" Vue highlight
" Plug 'posva/vim-vue'

" Solve the css's indent problem in html file
Plug 'othree/html5.vim'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Tern-based JavaScript editing support: go def, show doc, show refs, rename
" NOTE: brew install macvim --with-lua, no!!! --with-cscope
Plug 'ternjs/tern_for_vim'

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

" Vue config
" let g:vue_disable_pre_processors=1

" Google config
" Use :Google in v/n mode
" Use :Googlef to search with file type
" let g:vim_g_query_url = "http://google.com/search?q="
vnoremap  <leader>g :Google<CR>
vnoremap  <leader>gf :Googlef<CR>
nnoremap  <leader>g :Google<CR>
nnoremap  <leader>gf :Googlef<CR>

" smartim
" let g:smartim_default='com.sogou.inputmethod.sogou.pinyin'
" let g:smartim_debug=1

" Youdao config
vnoremap <silent> <leader>y :<C-u>Ydv<CR>
nnoremap <silent> <leader>y :<C-u>Ydc<CR>
nnoremap <silent> <leader>yd :Yde<CR>

" JSX in .js
let g:jsx_ext_required = 0

" Ack config
let g:ackprg = "ag --vimgrep --smart-case"
cnoreabbrev ack Ack!
nnoremap gs yiw:Ack! <C-R>"<Cr>

" NERDTree config
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nmap <leader>ft :NERDTreeToggle<CR>

" Emmet config
let g:user_emmet_leader_key = ','
let g:user_emmet_mode = 'n'
" let g:user_emmet_install_global = 0
" autocmd FileType html,javascript,less EmmetInstall

" Completion & Snippet config
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css,less setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" let g:ycm_key_list_select_completion = ['<C-n>', '<Tab>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<S-Tab>']
" let g:SuperTabDefaultCompletionType = ['<Tab>']
" " let g:ycm_autoclose_preview_window_after_insertion = 1
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
" " javascript and css conflict in vue file, so I remove the configuration of javascript.
" let g:ycm_semantic_triggers = {
"     \   'css,less,html,vue': ['re!^\s+', 're!:\s+'],
"     \   'python': ['re!\s+', '.'],
"     \   'ruby': ['re!\s+', '.', '::']
"     \ }

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

" lightline
let g:lightline = {
      \ 'colorscheme': 'Dracula',
      \ }
