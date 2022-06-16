# extract test code then run it
\rm -f test.native
qtest -o test.ml extract src/vector3.ml
ocamlbuild test.native -pkgs vector3,oUnit,qcheck
./test.native
