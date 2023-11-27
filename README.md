# xdp-tools-docker

Run libxdp/libbpf based application inside privileged docker container.

Build:

```bash
docker build -t xdp-tools:latest .
# docker build -t xdp-tools:latest --build-arg HTTP_PROXY=$http_proxy --build-arg HTTPS_PROXY=$https_proxy .
```

Run:

```bash
docker run --rm -it --net=host --privileged xdp-tools:latest bash

xdp-loader status
```

TODO

* mount bpffs?
