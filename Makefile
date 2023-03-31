OPAMDUNE = opam exec -- dune

.PHONY: utop
utop:
	$(OPAMDUNE) utop .

.PHONY: install-dev-tools
install-dev-tools:
	opam install -y merlin ocamlformat utop

.PHONY: build
build:
	$(OPAMDUNE) build

.PHONY: watch
watch:
	dune build -w