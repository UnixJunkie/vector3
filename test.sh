#!/bin/bash

# commands for qtest
qtest -o test.ml extract vector3.ml
ocamlbuild -cflags -warn-error,+26 -use-ocamlfind -pkg oUnit,QTest2Lib \
test.native
./test.native
