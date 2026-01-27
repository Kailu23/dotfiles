if [ -z "$SSH_AUTH_SOCK" ]; then
	if [ -f "$HOME/.ssh/agent-info" ]; then
		source "$HOME/.ssh/agent-info"
	else
		eval "$(ssh-agent -s)"
		echo "export SSH_AUTH_SOCK=$SSH_AUTH_SOCK" > "$HOME/.ssh/agent-info"
		echo "export SSH_AGENT_PID=$SSH_AGENT_PID" >> "$HOME/.ssh/agent-info"
	fi
fi

ssh-add -q ~/Documents/Marin/GitHub/.ssh/id_rsa 2>/dev/null
