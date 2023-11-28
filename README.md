# xdp-tools-docker

Run libxdp/libbpf based application inside privileged docker container.

Build:

```bash
docker build -t xdp-tools:latest .
```

Run:

```bash
docker run --rm -it --net=host --privileged -v /sys/fs/bpf:/sys/fs/bpf xdp-tools:latest bash

xdp-loader status
```

Pull the image from Github and run:

```bash
# docker pull ghcr.io/ricmli/xdp-tools-docker:main
docker run --rm -it --net=host --privileged -v /sys/fs/bpf:/sys/fs/bpf ghcr.io/ricmli/xdp-tools-docker:main bash
# xdp-loader status
# xdpdump -i ens785f0 --load-xdp-program
```
