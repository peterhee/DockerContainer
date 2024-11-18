# Hugo

## Version

- Ubuntu 22.04.4 LTS based image
- Hugo.v0.125.1

## Sources

- [GitHub Repository Container Hugo](https://github.com/peterhee/DockerContainer/tree/master/Hugo)

## Create a container

1. Download container

```bash
   # ARM64
   docker pull docker.io/pheese/hugo:arm64
```

```bash
   # AMD64/x64
   docker pull docker.io/pheese/hugo:amd64
```

2. Run the container

```bash
   # ARM64
   docker run -it --rm --name hugo docker.io/pheese/hugo:arm64
```

```bash
   # AMD64/x64
   docker run -it --rm --name hugo docker.io/pheese/hugo:amd64
```

3. Run the container and provide hugo website repository.

```bash
   # ARM64
   docker run -it --rm --name hugo \
      -v $HOME/website:/site \
      docker.io/pheese/hugo:arm64
```

```bash
   # AMD64/x64
   docker run -it --rm --name hugo \
      -v $HOME/website:/site \
      docker.io/pheese/hugo:amd64
```
