silent! $s/\s\+$//

" Plugin install
call plug#begin("~/.vim/plugged")
    Plug 'airblade/vim-gitgutter'
    Plug 'vim-airline/vim-airline'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'scrooloose/nerdtree'
    Plug 'ervandew/supertab'
    Plug 'scrooloose/syntastic'
    Plug 'gregsexton/gitv'
    Plug 'fatih/vim-go'
    Plug 'mkitt/tabline.vim'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 't9md/vim-choosewin'
    Plug 'mhinz/vim-startify'
    Plug 'zchee/deoplete-go'
    Plug 'justmao945/vim-clang'
    Plug 'alvan/vim-closetag'
    Plug 'vim-scripts/tComment'
    Plug 'eagletmt/neco-ghc'
    Plug 'neovimhaskell/haskell-vim'
    Plug 'gosukiwi/vim-atom-dark'
    Plug 'tpope/vim-fugitive'
    Plug 'yalesov/vim-ember-script'
    Plug 'nono/vim-handlebars'
    Plug 'mxw/vim-jsx'
    Plug 'elzr/vim-json'
    Plug 'pangloss/vim-javascript'
    Plug 'morhetz/gruvbox'
    Plug 'honza/vim-snippets'
    Plug 'SirVer/ultisnips'
    Plug 'drmingdrmer/xptemplate'
    Plug 'moll/vim-node'
    Plug 'pangloss/vim-javascript'
    Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
    Plug 'sheerun/vim-polyglot'
call plug#end()
" ==============

syntax on
filetype plugin indent on

" ====================================KEY SETTINGS====================
map <F1> <NOP>
imap <F1> <NOP>
nmap s <NOP>
let g:ctrlp_map = '<NOP>'

tnoremap <S-q><Esc> <C-\><C-n>

noremap <C-p> :Files<CR>
noremap <S-p> :BTags<CR>

nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

let g:multi_cursor_next_key='<C-d>'

nnoremap tc :tabclose<CR>
nnoremap tn :tabnew<CR>

nnoremap sv  :vsplit<CR>
nnoremap sh  :split<CR>
nnoremap sx  :wq!<CR>
nnoremap sk  :q!<CR>

map <F2> :NERDTreeToggle<CR>
map <F3> :Tagbar<CR>

" KeyMap for choosewin
noremap <S-w> :ChooseWin<CR>
" ====================================PLUGIN SETTINGS====================
let g:tern_request_timeout = 1

let g:javascript_conceal_function       = "ƒ"
let g:javascript_conceal_null           = "ø"
let g:javascript_conceal_this           = "@"
let g:javascript_conceal_return         = "⇚"
let g:javascript_conceal_undefined      = "¿"
let g:javascript_conceal_NaN            = "ℕ"
let g:javascript_conceal_prototype      = "¶"
let g:javascript_conceal_static         = "•"
let g:javascript_conceal_super          = "Ω"
let g:javascript_conceal_arrow_function = "⇒"

let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'

" Haskell complete settings
let g:necoghc_enable_detailed_browse = 1

" Deoplete config
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 1
let g:deoplete#auto_complete_start_length = 2
let g:deoplete#enable_ignore_case = 1
let g:deoplete#max_menu_width=120

let g:go_fmt_command = "goimports"

" Highlight
let g:ro_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Go settings
let g:go_fmt_fail_silently = 1
let g:go_fmt_autosave = 1
let g:go_get_update = 1

let g:SuperTabDefaultCompletionType = "<C-n>"

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active' }

let g:go_list_type = "quickfix"

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_enable_signs=1
let g:syntastic_loc_list_height = 3
let g:syntastic_python_checkers = ['pep8']
let g:syntastic_aggregate_errors = 1

" Jedi configure
let g:jedi#show_call_signatures = 1

syntax on
colorscheme atom-dark-256

filetype plugin indent on

" Don't show seperators
let g:airline_left_sep=''
let g:airline_right_sep=''

" TagBar settings
let g:tagbar_left = 1
let g:tagbar_autofocus = 1
let g:tagbar_compact=1

" Choosewin settings
let g:choosewin_overlay_enable = 0

let g:python3_host_prog="/usr/bin/python3"
let g:python_host_prog="/usr/bin/python2.7"

" ctrlp ignore pycache files
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_reuse_window = 'startify'
let g:ctrlp_extensions = ['tag']
let g:ctrlp_custom_ignore = {
            \ 'dir': '__pycache__',
            \ 'file': '*pyc'
            \ }

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Block folding settings
set foldmethod=syntax
set nofoldenable
set foldlevel=2
set foldnestmax=2

set tabstop=4
set shiftwidth=4
set expandtab

" Whitespace
set listchars=eol:¬,tab:.\ ,trail:~,extends:>,precedes:<
set list

" Syntastic statusline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" stop omnifunc
set omnifunc=

set completeopt=longest,menuone
set noswapfile
