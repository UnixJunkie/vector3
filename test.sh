# extract test code then run it
qtest -o test.ml extract vector3.ml
ocamlbuild test.native -pkgs vector3,oUnit,QTest2Lib
