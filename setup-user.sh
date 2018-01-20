#!/usr/bin/env bash

set -v -e -x

# Install FStar.
wget https://github.com/FStarLang/FStar/releases/download/v0.9.5.0/fstar_0.9.5.0_Linux_x86_64.tar.gz
tar xvfz fstar_0.9.5.0_Linux_x86_64.tar.gz
mv fstar ~/bin/
rm fstar_0.9.5.0_Linux_x86_64.tar.gz

# Init OPAM.
opam init -a
cp ~/.profile ~/.bash_profile
. ~/.opam/opam-init/init.sh >/dev/null 2>/dev/null

# Install dependencies.
opam install ppx_deriving_yojson zarith pprint menhir ulex process fix wasm

# Install and build KreMLin.
git clone https://github.com/FStarLang/kremlin ~/bin/kremlin
cd ~/bin/kremlin
make
