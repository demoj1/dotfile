# VS Code user settings
```
{
    "go.buildOnSave": true,
    "go.lintOnSave": true,
    "go.vetOnSave": true,
    "go.buildFlags": [],
    "go.lintFlags": [],
    "go.vetFlags": [],
    "go.coverOnSave": false,
    "go.useCodeSnippetsOnFunctionSuggest": true,
    "go.formatOnSave": true,
    "go.formatTool": "goreturns",
    "go.gocodeAutoBuild": true,

    "editor.cursorStyle": "line",
    "editor.renderWhitespace": true,

    "editor.fontFamily": "Fira Code",
    "editor.fontLigatures": true,
    "editor.fontSize": 16,

    "editor.mouseWheelScrollSensitivity": 5,
    "editor.roundedSelection": false,
    "editor.scrollBeyondLastLine": false,
    "files.trimTrailingWhitespace": true
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
