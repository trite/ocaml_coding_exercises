OPAMDUNE = opam exec -- dune

.PHONY: utop
utop:
	eval $$(opam env) && utop

.PHONY: init
init: # TODO: this works overall, but the `install` line isn't tested yet
	opam switch create . -y
	eval $$(opam env) && install
	eval $$(opam env) && install-dev-tools

.PHONY: install
install:
	opam install -y . --deps-only

.PHONY: install-dev-tools
install-dev-tools:
	opam install -y ocaml-lsp-server ocamlformat utop

.PHONY: build
build:
	$(OPAMDUNE) build

.PHONY: watch
watch:
	$(OPAMDUNE) build -w