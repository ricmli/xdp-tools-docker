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
