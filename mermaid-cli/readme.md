# [Mermaid](https://mermaid-js.github.io/mermaid/#/) Container

Official Web page about Mermaid can be found
[here](https://mermaid-js.github.io/mermaid/#/) .

Mermaid is a JavaScript based diagramming and charting tool that uses
Markdown-inspired text definitions and a renderer to create and modify complex
diagrams. The main purpose of Mermaid is to help documentation catch up with
development.

Diagramming and documentation costs precious developer time and gets outdated
quickly. But not having diagrams or docs ruins productivity and hurts
organisational learning. Mermaid addresses this problem by enabling users to
create easily modifiable diagrams, it can also be made part of production
scripts (and other pieces of code).

Mermaid allows even non-programmers to easily create detailed and diagrams
through the [Mermaid Live Editor](https://mermaid.live/). Tutorials has video
tutorials. Use Mermaid with your favorite applications, check out the list of
[Integrations and Usages of Mermaid](https://mermaid-js.github.io/mermaid/#/./integrations).

## Sources Container

- [GitHub Repository Mermaid Container files](https://github.com/peterhee/DockerContainer/tree/master/mermaid-cli)

## Generate and run a mermaid-cli.

1. Fork & then clone the git repository
   [Mermaid-Cli](https://github.com/mermaid-js/mermaid-cli) on your computer.

2. Pull the docker container

```bash
   # AMD64:
   docker pull docker.io/pheese/mermaid-cli:amd64

   # ARM64:
   docker pull docker.io/pheese/mermaid-cli:arm64
```

3. Run the docker container.

```bash
   # AMD64:
   docker run -it --rm --name mermaid-cli -v {Cloned Repo mermaid-cli}/test-positive:/data docker.io/pheese/mermaid-cli:amd64 -i state1.mmd -o state.svg -t transparent

   # ARM64:
   docker run -it --rm --name mermaid-cli -v {Cloned Repo mermaid-cli}/mermaid-cli/test-positive:/data docker.io/pheese/mermaid-cli:arm64 -i state1.mmd -o state.svg -t transparent
```

This generates a file state.svg (Graphic representation) based on the
instructions in state1.mmd.
