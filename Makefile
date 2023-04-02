OPAMDUNE = opam exec -- dune

.PHONY: utop
utop:
	eval $$(opam env) && utop

.PHONY: init
init: create-switch install install-dev-tools

.PHONY: install
install:
	opam install -y . --deps-only

.PHONY: install-dev-tools
install-dev-tools:
	opam install -y ocaml-lsp-server ocamlformat utop

.PHONY: create-switch
create-switch:
	opam switch create . -y

.PHONY: build
build:
	$(OPAMDUNE) build

.PHONY: watch
watch:
	$(OPAMDUNE) build -w