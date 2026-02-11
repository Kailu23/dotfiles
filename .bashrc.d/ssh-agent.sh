[[ $- != *i* ]] && return

SSH_ENV="$HOME/.ssh/agent-info"

start_agent(){
	eval "$(ssh-agent -s)" >/dev/null
	{
		echo "export SSH_AUTH_SOCK=$SSH_AUTH_SOCK"
		echo "export SSH_AGENT_PID=$SSH_AGENT_PID"
	} > "$SSH_ENV"
	chmod 600 "$SSH_ENV"
}

if [ -f "$SSH_ENV" ]; then
	source "$SSH_ENV" >/dev/null
fi

if ! ssh-add -l >/dev/null 2>&1; then
	start_agent
fi

ssh-add -l | grep -q id_rsa || \
ssh-add ~/Documents/Marin/GitHub/.ssh/id_rsa 
