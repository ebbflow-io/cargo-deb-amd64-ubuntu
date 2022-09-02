FROM clux/muslrust

RUN rustup update stable && rustup default stable && rustup target add x86_64-unknown-linux-musl && cargo install cargo-deb

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
