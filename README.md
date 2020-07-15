# `cargo deb` Build Environment (ubuntu amd64)

Provides a build environment for executing `cargo deb` [1] and producing statically linked binaries for the built Debian (`.deb`) package.

[1] Cargo Deb provided by mmstick
- https://github.com/mmstick/cargo-deb
- https://crates.io/crates/cargo-deb

**NOTE**: This package may fail to build your project if your build links against other OS-provided libraries. The underlying OS image is provided by [muslrust](https://github.com/clux/muslrust) and if additional packages are needed, please follow up with that project.

## Inputs

`cmd` - The command to be executed inside the container. Defaults to `cargo deb --target=x86_64-unknown-linux-musl`

## Outputs

None, besides the `deb` package that is built. The built `.deb` will be located in `target/x86_64-unknown-linux-musl/debian/<DEB>`.

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
      uses: ebbflow-io/cargo-deb-amd64-ubuntu@1.0
```

A working example can be found in use by Ebbflow to build its client package for various OS and CPU architectures [here](https://github.com/ebbflow-io/ebbflow/blob/master/.github/workflows/continuous-integration.yml).
