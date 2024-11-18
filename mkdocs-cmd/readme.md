# MKDOCS-CMD Container

Official Web page MKDOCS can be found [here](https://www.mkdocs.org) .

**Generate static sites from Markdown files**

## Sources Container

- [GitHub Repository mkdocs-cmd Container files](https://github.com/peterhee/DockerContainer/tree/master/mkdocs-cmd)

## Generate and run a MKDOCS website locally in a docker container

1. Fork & then clone the git repository
   [mkdocs sample web](git@github.com:martinlingstuyl/blimped-mkdocs.git) on
   your computer.
2. Run the docker container.

```bash
   # amd64:
   docker run -it --rm --name docfx -p 8080:8000 -v {mkdocs website folder}:/site docker.io/pheese/mkdocs:amd64

   # arm64:
   docker run -it --rm --name docfx -p 8080:8000 -v {mkdocs website folder}:/site docker.io/pheese/mkdocs:arm64
```

3. Now you can run mkdocs command in the directory /site.

```bash

# Create a new mkdocs site
mkdocs new

# Build static site
mkdocs build

# Start web server
mkdocs serve --dev-addr 0.0.0.0:8000

#  /script/entrypoint.sh builds site and starts web server (Also fixes permission issue running the first time)
/script/entrypoint.sh
```
