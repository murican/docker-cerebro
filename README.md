# Cerebro

Cerebro Container based on the official Alpine Base Image

This Image is smaller than the "yannart/cerebro" image

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
| `CEREBRO_VERSION`   | Cerebro Version to be build| 0.8.1         |
| `JAVA_VERSION`      | Java Version for build     | 8u171         |
| `JAVA_ALPINE_VERSION` | Java Version for build   | 8.171.11-r2 |
