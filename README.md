# `cargo deb` Build Environment (ubuntu amd64)

Provides a build environment for executing `cargo deb` [1] and producing
statically linked binaries for the built Debian (`.deb`) package.

[1] Cargo Deb provided by mmstick
- https://github.com/mmstick/cargo-deb
- https://crates.io/crates/cargo-deb

**NOTE**: This package may fail to build your project if your build links
against other OS-provided libraries. The underlying OS image is provided by
[muslrust](https://github.com/clux/muslrust) and if additional packages are
needed, please follow up with that project.

Uses [tomato-toml](https://github.com/ceejbot/tomato) to update Cargo.toml with
a version from the build tag.  The version update is **not** commited back to
the repo. If you want to do that, you can include the `commit` action on
Cargo.toml.

cargo doesn't like versions that don't use semver components, like date
formatted version strings.

## Inputs

`cmd` - The command to be executed inside the container. Defaults to `cargo deb
--target=x86_64-unknown-linux-musl`

`toml_path` - the (relative) path to the `Cargo.toml` file to modify with the
git tag

## Outputs

None, besides the `deb` package that is built. The built `.deb` will be located
in `target/x86_64-unknown-linux-musl/debian/<DEB>`.

## Example Usage

```yaml
name: Deb Static Build

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master

    - name: Deb Build
      uses: novalabsxyz/cargo-deb-amd64-ubuntu@2.7
      with:
        - toml_path: some/path
```
