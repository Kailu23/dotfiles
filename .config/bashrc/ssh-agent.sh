if [[ $OSTYPE == msys* || $OSTYPE == cygwin* ]]; then
    export PATH="/c/Windows/System32/OpenSSH:$PATH"
fi
