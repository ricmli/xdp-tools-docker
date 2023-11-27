FROM ubuntu:22.04

LABEL maintainer="ricmli@outlook.com"

RUN apt-get update -y && \
    apt-get install -y git gcc pkg-config make m4 clang llvm zlib1g-dev libelf-dev libpcap-dev libcap-ng-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /root

# Build and install libbpf, libxdp and xdp-tools
RUN git clone --recurse-submodules https://github.com/xdp-project/xdp-tools.git && \
    cd xdp-tools && \
    ./configure && \
    make && \
    make install && \
    cd lib/libbpf/src && \
    make install

CMD ["/bin/bash"]
