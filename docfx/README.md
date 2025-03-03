# DocFx Container

Official Web page DocFX can be found [here](https://dotnet.github.io/docfx/) .

**Generate static sites from Markdown and code files**

> [DocFX](https://dotnet.github.io/docfx/) can produce documentation from source
> code (including C#, F#, Visual Basic, REST, JavaScript, Java, Python and
> TypeScript) as well as raw Markdown files.

**Easily customize the output**

> [DocFX](https://dotnet.github.io/docfx/) provides a flexible way to customize
> templates and themes.

## Version

- Base image latest [mono](https://hub.docker.com/_/mono)
- [DocFX](https://dotnet.github.io/docfx/) Version 2.59.3

## Sources Container

- [GitHub Repository DocFX Container files](https://github.com/peterhee/DockerContainer/tree/master/docfx)

## Generate and run a DocFX website locally in a docker container

1. Fork & then clone the git repository
   [DocFx sample web](https://github.com/docascode/docfx-seed) on your computer.
2. Run the docker container.

```bash
   # amd64:
   docker run -it --rm --name docfx -p 8080:80 -v {DocFX website folder}:/source docker.io/pheese/generate-docfx:amd64

   # arm64:
   docker run -it --rm --name docfx -p 8080:80 -v {DocFX website folder}:/source docker.io/pheese/generate-docfx:arm64
```

3. Go into your browser and access http://localhost:8080
