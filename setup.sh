#!/usr/bin/env bash

set -v -e -x

# Update packages.
export DEBIAN_FRONTEND=noninteractive
apt-get -y update && apt-get -y upgrade

apt_packages=()
apt_packages+=('build-essential')
apt_packages+=('git')
apt_packages+=('mercurial')
apt_packages+=('libgmp-dev')
apt_packages+=('locales')
apt_packages+=('m4')
apt_packages+=('opam')
apt_packages+=('silversearcher-ag')
apt_packages+=('vim')
apt_packages+=('wget')
apt_packages+=('z3')

# Install packages.
apt-get install -y ${apt_packages[@]}

locale-gen en_US.UTF-8
dpkg-reconfigure locales

# Cleanup.
rm -rf ~/.ccache ~/.cache
apt-get autoremove -y
apt-get clean
apt-get autoclean
rm $0
