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

- [GitHub Repository DocFX Container Files](https://github.com/peterhee/DockerContainer/tree/master/docfx-cmd)

## Generate and run a DocFX website locally in a docker container

1. Fork & then clone the git repository
   [DocFx sample web](https://github.com/docascode/docfx-seed) on your computer.
2. Run the docker container.

```bash
   # amd64:
   docker run -it --rm --name docfx -p 8080:80 -v {DocFX website folder}:/source docker.io/pheese/cmd-docfx:amd64

   # arm64:
   docker run -it --rm --name docfx -p 8080:80 -v {DocFX website folder}:/source docker.io/pheese/cmd-docfx:arm64
```

3. Execute in the container

```bash
   # Start nginx server
   nginx
   sleep 5

   # Compile DocFX Site
   docfx docfx.json

   # Host web site on port 8080
   docfx serve /source/_site
```

4. Go into your browser and access http://localhost:8080
