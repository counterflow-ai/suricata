# Suricata

Console:
```sh
docker run -it --name suricata --net=host -v $(pwd)/logs:/var/log/suricata suricata
```

Daemon:
```sh
docker run -d --name suricata --net=host -v $(pwd)/logs:/var/log/suricata suricata
```