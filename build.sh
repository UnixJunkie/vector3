#!/bin/bash

#set -x

oasis setup
ocaml setup.ml -configure --enable-tests --prefix `opam config var prefix`
ocaml setup.ml -build
./test.native && ocaml setup.ml -install
