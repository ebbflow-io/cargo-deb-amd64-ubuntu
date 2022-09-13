#!/bin/sh -l
set -eux

VERSION=$(git describe)
tomato set package.version ${VERSION} Cargo.toml

# Taken from https://github.com/zhxiaogg/cargo-static-build, unsure if all needed or not

# hack, move home to $HOME(/github/home)
ln -s /root/.cargo $HOME/.cargo
ln -s /root/.rustup $HOME/.rustup

# go to the repo root
cd $GITHUB_WORKSPACE
sh -c "$*"
chmod 0777 ./target
