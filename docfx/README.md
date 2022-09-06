# DOCFX Container

[DocFX](https://dotnet.github.io/docfx/) can produce documentation from source
code (including C#, F#, Visual Basic, REST, JavaScript, Java, Python and
TypeScript) as well as raw Markdown files. DocFX can run on Linux, macOS, and
Windows. The generated static website can be deployed to any host such as GitHub
Pages or Azure Websites with no additional configuration.

## Create the container using source from the git repository

1. Create a Image using the dockerfile, app.js and package.json

```bash
   docker build -t docker.io/[YourName]/generate-docfx .
```

2. Push Image into Repository

```bash
    docker push docker.io/[YourName]/generate-docfx:latest
```

## Generate and run a DocFX website locally in a docker container

1. Fork & then clone the git repository
   [DocFx sample web](https://github.com/docascode/docfx-seed) on your computer.

2. Run the docker container.

```bash
   docker run -it --rm --name generate-docfx -p 8080:80 -v {DocFX website folder}:/source docker.io/{YourName}/generate-docfx
```

3. Go into your browser and access http://localhost:8080
