OPAMDUNE = opam exec -- dune

.PHONY: utop
utop:
	eval $$(opam env) && utop

.PHONY: init
init: # TODO: haven't tested this yet
	opam switch create .
	eval $$(opam env) && install-dev-tools

.PHONY: install-dev-tools
install-dev-tools:
	opam install -y ocaml-lsp-server merlin ocamlformat utop

.PHONY: build
build:
	$(OPAMDUNE) build

.PHONY: watch
watch:
	$(OPAMDUNE) build -w