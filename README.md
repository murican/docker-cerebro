# Cerebro

Build a Cerebro Docker Image based on the official Alpine Base Image

The Image size is smaller than "yannart/cerebro"

Cerebro:
https://github.com/lmenezes/cerebro

Yannart:
https://hub.docker.com/r/yannart/cerebro/

Build:
```bash
$ docker build -t cerebro .
```

Run:
```bash
$ docker run --rm -d -p 9000:9000 cerebro
```

## Environment Variables

|         Env         |      Description           | Default       |
| ------------------- | -------------------------- | ------------- |
| `CEREBRO_VERSION`   | Cerebro Version to be build| 0.8.3         |
| `JAVA_ALPINE_VERSION` | Java Version for build   | 8.212.04-r0   |
