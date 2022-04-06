# Cerebro

Build a Cerebro Docker Image based on the official Alpine Base Image

The Image size is smaller than "yannart/cerebro"

Cerebro:
https://github.com/lmenezes/cerebro


Build:
```bash
$ docker build -t cerebro .
```

Run:
```bash
$ docker run --rm -d -p 9000:9000 cerebro
```
