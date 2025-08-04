-- pacman -S lua-language-server
return {
	filetypes = {'python'},
	cmd = {'ruff', 'server'},
	root_markers = {'pyproject.toml', 'requirements.txt', 'uv.lock'}
}
