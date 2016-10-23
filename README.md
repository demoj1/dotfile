# VS Code user settings
```
{
    "go.buildOnSave": true,
    "go.lintOnSave": true,
    "go.vetOnSave": true,
    "go.coverOnSave": true,
    "go.useCodeSnippetsOnFunctionSuggest": true,
    "go.formatOnSave": true,
    "go.formatTool": "goreturns",
    "go.gocodeAutoBuild": true,

    "rust.formatOnSave": true, // Turn on/off autoformatting file on save (EXPERIMENTAL)
    "rust.checkOnSave": true, // Turn on/off `cargo check` project on save (EXPERIMENTAL)
    "rust.checkWith": "build", // Specifies the linter to use. (EXPERIMENTAL)

    "editor.cursorStyle": "line",
    "editor.renderWhitespace": true,

    "editor.fontFamily": "Consolas",
    "editor.fontLigatures": true,
    "editor.fontSize": 14,

    "editor.mouseWheelScrollSensitivity": 5,
    "editor.roundedSelection": true,
    "editor.scrollBeyondLastLine": false,
    "files.trimTrailingWhitespace": true,

    "editor.tabSize": 8,
    "editor.insertSpaces": false,
    "editor.wrappingColumn": 80,
    "editor.rulers": [
        80
    ],
    "editor.formatOnType": true,

    "files.associations": {
        "*.tpl": "html"
    },

    "omnisharp.path": "/home/dmr/downloads/omnisharp-ubuntu14-x64-netcoreapp1.0/OmniSharp",

    "projectManager.projectsLocation": "/home/dmr/go/src",
    "window.reopenFolders": "all"
}
```
# VS Code keybindings
```
[
    { "key": "ctrl+r",               "command": "editor.action.marker.next",
                                     "when": "editorFocus" }
]
```
# Docker-compose restart and git pulling
```
#!/bin/bash

localPATH=`pwd`
bg_green=$(tput setab 2)
bg_red=$(tput setab 1)
bg_res=$(tput sgr 0)

# Git repositoires paths.
# In ecah directory must be
# installed git upstream.
repo[0]=/catalog/repo

# Git pull.
for path in "${repo[@]}"
do
        current_path=$localPATH$path
        txt_len=${#current_path}
        ok_len=$(expr $(tput cols) - $txt_len + 4)
        err_len=$(expr $(tput cols) - $txt_len + 6)

        echo "Git pull from ${current_path}..."

        git -C $current_path pull
        if [ $? -eq 0 ]
        then
                printf '%s%*s\n' "${bg_green}${current_path}${bg_res}" "${ok_len}" "${bg_green}[OK]${bg_res}"
        else
                printf '%s%*s\n' "${bg_red}${current_path}${gb_res}" $err_len "${bg_red}[FAIL]${bg_res}"
        fi
done

# Docker restart.
docker-compose build 1> /dev/null
docker-compose down
docker-compose up -d
```

Vim
```vim
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
```
