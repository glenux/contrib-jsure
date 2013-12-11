# Makefile

.PHONY: all clean install tests jsure

PREFIX?=/usr/local
OCAML_DIR?=$(shell ocamlc -where)

all: jsure

jsure:
	ocamlbuild jsure.native -cflags -I,$(OCAML_DIR) -lflags -I,$(OCAML_DIR)

install: all
	install -m 0755 jsure.native $(PREFIX)/bin/jsure

clean:
	rm -rf _build _log jsure.native

tests: jsure
	@cd tests; ./test.sh
