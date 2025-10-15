FROM debian:bookworm AS builder
RUN apt-get update && apt-get install -y \
  build-essential \
  git \
  sudo

WORKDIR /app
RUN git clone -b debian https://github.com/knxd/knxd.git && \
    sh knxd/install-debian.sh

FROM debian:bookworm-slim AS final
RUN apt-get update && apt-get install -y libusb-1.0-0 libev4 libfmt9 libinih1 \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY --from=builder /app/*.deb /app/
RUN dpkg -i /app/knxd_*.deb /app/knxd-tools_*.deb \
    && apt-get -y -f install \
    && rm *.deb

USER nobody
ENTRYPOINT [ "/usr/bin/knxd" ]
