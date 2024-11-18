# Microsoft Powershell incl. Azure Module

## Version

- Ubuntu 22.04.4 LTS based image
- [Powershell v7.4.6](https://aka.ms/PowerShell-Release?tag=stable)
- [Azure Powershell Module AZ v11.5](https://learn.microsoft.com/en-us/powershell/azure/install-azure-powershell?view=azps-11.5.0)

## Sources

- [GitHub Repository Container Azure PWSH](https://github.com/peterhee/DockerContainer/tree/master/Azure-PWSH)

## Create a container

1. Download container

```bash
   # ARM64
   docker pull docker.io/pheese/azure-pwsh:arm64
```

```bash
   # AMD64/x64
   docker pull docker.io/pheese/azure-pwsh:amd64
```

2. Run the container

```bash
   # ARM64
   docker run -it --rm --name azure-pwsh docker.io/pheese/azure-pwsh:arm64
```

```bash
   # AMD64/x64
   docker run -it --rm --name azure-pwsh docker.io/pheese/azure-pwsh:amd64
```

3. Run the container and save your state or share powershell scripts. Ensure
   that the directory _$HOME/DockerShare_ exists on your computer.

```bash
   # ARM64
   docker run -it --rm --name azure-pwsh -v $HOME/DockerShare:/home/user docker.io/pheese/azure-pwsh:arm64
```

```bash
   # AMD64/x64
   docker run -it --rm --name azure-pwsh -v $HOME/DockerShare:/home/user docker.io/pheese/azure-pwsh:amd64
```
