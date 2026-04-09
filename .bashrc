path=~/.config/bashrc/*.sh

for file in $path; do
	[ -r "$file" ] && source "$file"
done
