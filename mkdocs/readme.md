# MKDOCS Container

Official Web page MKDOCS can be found [here](https://www.mkdocs.org) .

**Generate static sites from Markdown files**

## Sources Container

- [GitHub Repository mkdocs Container files](https://github.com/peterhee/DockerContainer/tree/master/mkdocs)

## Generate and run a MKDOCS website locally in a docker container

1. Fork & then clone the git repository
   [mkdocs sample web](git@github.com:martinlingstuyl/blimped-mkdocs.git) on
   your computer.
2. Run the docker container.

```bash
   # amd64:
   docker run -it --rm --name mkdocs -p 8080:8000 -v {mkdocs sample web folder}:/site docker.io/pheese/mkdocs:amd64

   # arm64:
   docker run -it --rm --name mkdocs -p 8080:8000 -v {mkdocs sample web folder}:/site docker.io/pheese/mkdocs:arm64
```

3. Go into your browser and access http://localhost:8080
