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

function find_replace() {
  find ./ -type f -exec sed -i -e "s/$1/$2/g" {} \;
}
