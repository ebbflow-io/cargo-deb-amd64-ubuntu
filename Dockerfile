FROM clux/muslrust:1.61.0
LABEL maintainer="jan.starke@t-systems.com"

RUN cargo install cargo-deb; \
    rustup update stable; \
    rustup default stable; \
    rustup target add x86_64-unknown-linux-musl; 

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
