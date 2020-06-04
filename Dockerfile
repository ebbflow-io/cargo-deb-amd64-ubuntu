FROM clux/muslrust

RUN cargo install cargo-deb

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
