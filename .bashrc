if [ -z "$SSH_AGENT_PID" ]; then
    eval "$(ssh-agent -s)"
fi

ssh-add -q ~/Documents/Marin/GitHub/.ssh/id_rsa 2>/dev/null

studioPath="C:/Program Files/Android/Android Studio/bin/studio64.exe"
vsCodePath="C:/Users/Marin/AppData/Local/Programs/Microsoft VS Code/Code.exe"

alias studio='cmd //c start "" "$studioPath"'

alias code='cmd //c start "" "$vsCodePath"'

function vs() {
    local devenv="C:/Program Files/Microsoft Visual Studio/18/Community/Common7/IDE/devenv.exe"

    if [ -z "$1" ]; then
         cmd //c start "" "$devenv"
    elif [ "$1" = "." ]; then
         local sln=$(find . -maxdepth 1 -name "*.sln" | head -n 1)
         local slnx=$(find . -maxdepth 1 -name "*.slnx" | head -n 1)
        if [ -n "$sln" ]; then
            cmd //c start "" "$devenv" "$(cygpath -w "$sln")"
	elif [ -n "$slnx" ]; then
            cmd //c start "" "$devenv" "$(cygpath -w "$slnx")"
        else
            echo "No .sln file found in current directory"
        fi
    else
         cmd //c start "" "$devenv" "$(cygpath -w "$1")"
    fi
}
