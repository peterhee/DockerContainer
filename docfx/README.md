# DOCFX Container

[DocFX](https://dotnet.github.io/docfx/) can produce documentation from source code (including C#, F#, Visual Basic, REST, JavaScript, Java, Python and TypeScript) as well as raw Markdown files. DocFX can run on Linux, macOS, and Windows. The generated static website can be deployed to any host such as GitHub Pages or Azure Websites with no additional configuration.

## Create the container using source from the git repository

1. Create Image using the dockerfile, app.js and package.josn
    > docker build -t docker.io/pheese/generate-docfx .

2. Docker Tag
    >docker tag generate-docfx docker.io/pheese/generate-docfx

3. Push Image into Repository
    >docker docker.io/pheese/generate-docfx

## Generate and run a DocFX website locally in a docker container

1. Clone the git repository [DocFx sample web](https://github.com/docascode/docfx-seed).
2. Run the build docker container.
    > docker run -it -p 8080:80 -v <DocFX website folder>:/source docker.io/pheese/generate-docfx