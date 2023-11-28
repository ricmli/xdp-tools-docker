# Stage 1: Build
FROM ubuntu:22.04 AS builder

LABEL maintainer="ricmli@outlook.com"

# Install build dependencies
RUN apt-get update -y && \
    apt-get install -y git gcc pkg-config make m4 clang llvm zlib1g-dev libelf-dev libpcap-dev libcap-ng-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Clone and build libbpf, libxdp and xdp-tools
RUN git clone --recurse-submodules https://github.com/xdp-project/xdp-tools.git && \
    cd xdp-tools && \
    ./configure && \
    make && \
    DESTDIR=/install make install

# Stage 2: Setup minimal production image
FROM ubuntu:22.04

# Install runtime dependencies
RUN apt-get update && \
    apt-get install -y libelf-dev libpcap-dev libcap-ng-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /install /

CMD ["/bin/bash"]