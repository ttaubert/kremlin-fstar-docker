#!/usr/bin/env bash

set -v -e -x

# Init OPAM.
opam init -a
cp ~/.profile ~/.bash_profile
. ~/.opam/opam-init/init.sh >/dev/null 2>/dev/null

# Install dependencies and F*.
opam install ppx_deriving_yojson zarith pprint menhir ulex process fix wasm
opam pin add fstar --dev-repo

# Install and build KreMLin.
git clone https://github.com/FStarLang/kremlin ~/bin/kremlin
cd ~/bin/kremlin
make
