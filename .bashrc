for file in ~/.bashrc.d/*.sh; do
	[ -r "$file" ] && source "$file"
done
