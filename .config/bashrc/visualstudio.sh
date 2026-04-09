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
            echo "No .sln or slnx file found in current directory"
        fi
    else
         cmd //c start "" "$devenv" "$(cygpath -w "$1")"
    fi
}

