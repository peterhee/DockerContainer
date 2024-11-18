# Microsoft Azure CLI

## Version

- Ubuntu 22.04.4 LTS based image
- Azure-CLI 2.65.0

## Sources

- [GitHub Repository Container Azure CLI](https://github.com/peterhee/DockerContainer/tree/master/Azure-Cli)

## Create a container

1. Download container

```bash
   # ARM64
   docker pull docker.io/pheese/azure-cli:arm64
```

```bash
   # AMD64/x64
   docker pull docker.io/pheese/azure-cli:amd64
```

2. Run the container

```bash
   # ARM64
   docker run -it --rm --name azure-cli docker.io/pheese/azure-cli:arm64
```

```bash
   # AMD64/x64
   docker run -it --rm --name azure-cli docker.io/pheese/azure-cli:amd64
```

3. Run the container and save your state or share scripts. Ensure that the
   directory _$HOME/DockerShare/.azure_ and _$HOME/DockerShare/scripts_ exists
   on your computer.

```bash
   # ARM64
   docker run -it --rm --name azure-cli \
      -v $HOME/DockerShare/.azure:/home/user/.azure \
      -v $HOME/DockerShare/scripts:/home/user/scripts \
      docker.io/pheese/azure-cli:arm64
```

```bash
   # AMD64/x64
   docker run -it --rm --name azure-cli \
      -v $HOME/DockerShare/.azure:/home/user/.azure \
      -v $HOME/DockerShare/scripts:/home/user/scripts \
      docker.io/pheese/azure-cli:AMD64
```

## Docker on Windows

If you have cloned the repository on your Windows Desktop. The files
automatically converted into the DOS format. You need to
[convert](https://ubuntugenius.wordpress.com/2010/10/26/how-to-convert-windowsdos-text-files-to-linuxunix-format/#:~:text=It's%20actually%20very%20easy%20to,Unix%2FLinux%20instead%20of%20Windows.)
the following files before you build the container image:

- .bashrc
- .bash_aliases
- install.sh

**Convert to Linux format**

```bash
fromdos .bashrc
fromdos .bash_aliases
fromdos install.sh
```
