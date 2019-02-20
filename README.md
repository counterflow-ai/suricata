# Suricata

## Start

Console:
```sh
docker run -it --name suricata --net=host suricata
```

Daemon:
```sh
docker run -d --name suricata --net=host suricata
```

## Persistent Volume

To persist the volume to your local filesystem, add `-v $(pwd)/<directory>:/var/log/suricata`.