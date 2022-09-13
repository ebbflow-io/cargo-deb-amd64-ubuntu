#!/bin/sh -l
set -xeuo pipefail

if [ -z "$GITHUB_REF" ]; then
    git config --global --add safe.directory "$GITHUB_WORKSPACE"
    VERSION=$(git describe)
else
    VERSION="$GITHUB_REF"
fi

tomato set package.version ${VERSION} Cargo.toml

# Taken from https://github.com/zhxiaogg/cargo-static-build, unsure if all needed or not

# hack, move home to $HOME(/github/home)
ln -s /root/.cargo $HOME/.cargo
ln -s /root/.rustup $HOME/.rustup

# go to the repo root
cd $GITHUB_WORKSPACE
sh -c "$*"
chmod 0777 ./target
