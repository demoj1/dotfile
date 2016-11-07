silent! $s/\s\+$//

map <F1> <NOP>
imap <F1> <NOP>

" Plugin install
call plug#begin("~/.vim/plugged")
    Plug 'airblade/vim-gitgutter'
    Plug 'vim-airline/vim-airline'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'scrooloose/nerdtree'
    Plug 'ervandew/supertab'
    Plug 'majutsushi/tagbar'
"    Plug 'easymotion/vim-easymotion'
    Plug 'scrooloose/syntastic'
    Plug 'gregsexton/gitv'
    Plug 'fatih/vim-go'
    Plug 'mkitt/tabline.vim'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi'
"    Plug 'kien/ctrlp.vim'
"    Plug 'tacahiroy/ctrlp-funky'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
    Plug 't9md/vim-choosewin'
    Plug 'mhinz/vim-startify'
"    Plug 'josuegaleas/jay'
    Plug 'zchee/deoplete-go'
    Plug 'justmao945/vim-clang'
    Plug 'alvan/vim-closetag'
    Plug 'vim-scripts/tComment'
    Plug 'eagletmt/neco-ghc'
    Plug 'neovimhaskell/haskell-vim'
    Plug 'fsharp/vim-fsharp', {
      \ 'for': 'fsharp',
      \ 'do':  'make fsautocomplete',
      \}
    Plug 'kongo2002/fsharp-vim'
call plug#end()
" ==============

" Haskell complete settings
let g:necoghc_enable_detailed_browse = 1

" Deoplete config
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 1
let g:deoplete#auto_complete_start_length = 2
let g:deoplete#enable_ignore_case = 1
let g:deoplete#max_menu_width=120


syntax on
filetype plugin indent on

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

" Keymap for shift p search for tag
nmap <C-p> :Files<cr>
nmap <S-p> :BTags<cr>
" let g:ctrlp_funky_syntax_highlight = 1

" Keymap tab
" let g:ctrlp_cmd = 'CtrlPMixed'
" let g:ctrlp_working_path_mode = 'a'

nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

" Keymap ctrl+s save file
nmap <C-s> :w!<cr>
imap <C-s> <esc>:w!<cr>

" KeyMap for multicursor
let g:multi_cursor_next_key='<C-d>'

" KeyMap for navigate tab
nmap <C-Right> :tabnext<CR>
nmap <C-Left> :tabprevious<CR>
nmap <C-Down> :tabclose<CR>
nmap <C-Up> :tabnew<CR>

" KeyMap for nerdtree
map <F2> :NERDTreeToggle<CR>

" KeyMap for tagbar
map <F3> :Tagbar<CR>

" KeyMap for choosewin
nmap <C-w> <Plug>(choosewin)

" TagBar settings
let g:tagbar_left = 1
let g:tagbar_autofocus = 1
let g:tagbar_compact=1

" Choosewin settings
let g:choosewin_overlay_enable = 1

let g:python3_host_prog="/usr/bin/python3"
let g:python_host_prog="/usr/bin/python2.7"

" ctrlp ignore pycache files
let g:ctrlp_custom_ignore = {
            \ 'dir': '__pycache__',
            \ 'file': '*pyc'
            \ }

" Block folding settings
set foldenable
set foldnestmax=1
set foldlevel=1
set foldmethod=syntax

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

set number

" stop omnifunc
set omnifunc=

set completeopt=longest,menuone
set noswapfile
