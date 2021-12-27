start:
	@pongo down
	@pongo run
	@pongo expose
	@pongo shell
	@kong migrations bootstrap --force
	@kong start

