FROM ubuntu:latest

LABEL maintainer="ricmli@outlook.com"

RUN apt-get update -y

RUN apt-get install -y git gcc pkg-config make m4 clang llvm zlib1g-dev libelf-dev libpcap-dev

RUN apt clean all

WORKDIR /root

RUN git clone --recurse-submodules https://github.com/xdp-project/xdp-tools.git

# Build and install libbpf, libxdp and xdp-tools
RUN cd xdp-tools && ./configure && make && make install

CMD ["/bin/bash"]
