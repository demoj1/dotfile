map <F1> <NOP>
imap <F1> <NOP>

" Plugin install
call plug#begin("~/.vim/plugged")
	Plug 'airblade/vim-gitgutter'
	Plug 'vim-airline/vim-airline'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'scrooloose/nerdtree'
	Plug 'davidhalter/jedi-vim'
	Plug 'ervandew/supertab'
	Plug 'majutsushi/tagbar'
	Plug 'easymotion/vim-easymotion'
	Plug 'scrooloose/syntastic'
	Plug 'gregsexton/gitv'
	Plug 'fatih/vim-go'
call plug#end()
" ==============


execute pathogen#infect()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'
syntax on
filetype plugin indent on

let g:go_fmt_command = "goimports"

" set number
set omnifunc=syntaxcomplete#Complete

" Highlight
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Go settings
let g:go_fmt_fail_silently = 1
let g:go_fmt_autosave = 1
let g:go_get_update = 1

set completeopt=longest,menuone

let g:SuperTabDefaultCompletionType = "<C-x><C-o>"

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active' }

let g:go_list_type = "quickfix"

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_enable_signs=1
"
" Whitespace
:set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
:set list

" Syntastic statusline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Jedi configure
let g:jedi#show_call_signatures = "1"

" SynaxChecker configure
let g:syntastic_python_checkers = ['pep8']

" Backspace fix
set backspace=2

syntax on
colorscheme atom-dark-256

" Don't show seperators
let g:airline_left_sep=''
let g:airline_right_sep=''

" Keymap tab
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

" KeyMap for multicursor
let g:multi_cursor_next_key='<C-d>'

" KeyMap for navigate tab
map <C-Right> :tabnext<CR>
map <C-Left> :tabprevious<CR>
map <C-Down> :tabclose<CR>
map <C-Up> :tabnew<CR>

" KeyMap for nerdtree
map <F2> :NERDTreeToggle<CR>

" KeyMap for tagbar
map <F3> :Tagbar<CR>

" TagBar settings
let g:tagbar_left = 1
let g:tagbar_autofocus = 1
let g:tagbar_compact=1

" KeyMap for easymotion
map <F1> <Plug>(easymotion-overwin-f2)
imap <F1> <Plug>(easymotion-overwin-f2)
