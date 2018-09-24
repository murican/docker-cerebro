# Cerebro

Based on the official Alpine Base Image this Container Starts Cerebro listening on default port 9000

Cerebro:
https://github.com/lmenezes/cerebro

Build:
```bash
$ docker build -t cerebro .
```

Run:
```bash
$ docker run -p 9000:9000 -d cerebro
```

## Environment Variables

|         Env         |      Description           | Default       |
| ------------------- | -------------------------- | ------------- |
|`VERSION`            | The Cerebro Version        | 0.8.1         |
