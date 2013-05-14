#!/bin/bash

#set -x

oasis setup
ocaml setup.ml -configure
ocaml setup.ml -build
ocaml setup.ml -install

# # commands for qtest
# qtest -o test.ml extract vector3.ml
# ocamlbuild -cflags -warn-error,+26 -use-ocamlfind -pkg oUnit,QTest2Lib \
# test.native
# ./test.native
