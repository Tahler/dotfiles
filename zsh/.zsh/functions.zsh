function mkcd() {
	mkdir -p "$1"
	cd "$1"
}

function rm() {
	if [ -x "$(command -v trash-put)" ]; then
		trash-put $@
	else
		command rm $@
	fi
}
