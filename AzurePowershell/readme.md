## Create the container using source from the git repository

Check the current powershell version for Ubuntu Linux (Currently 7.2.6)
https://github.com/PowerShell/PowerShell/releases/tag/v7.2.6

Update the variable PS_VERSION=7.0.3 with current version of Powershell and
rebuild the image.

1. Create Image using the dockerfile

```bash
   docker build -t docker.io/[YourName]/azure-pwsh .
```

2. Docker Tag:

```bash
   # ARM64
   docker tag docker.io/[YourName]/azure-pwsh docker.io/[YourName]/azure-pwsh:arm64
```

```bash
   # AMD64
   docker tag docker.io/[YourName]/azure-pwsh docker.io/[YourName]/azure-pwsh:amd64
```

3. Push Image into Repository

```bash
   # ARM64
   docker push docker.io/[YourName]/azure-pwsh:arm64
```

```bash
   # AMD64
   docker push docker.io/[YourName]/azure-pwsh:amd64
```

4. Run the container

```bash
   # ARM64
   docker run -it --rm --name azure-pwsh docker.io/[YourName]/azure-pwsh:arm64
```

```bash
   # AMD64
   docker run -it --rm --name azure-pwsh docker.io/[YourName]/azure-pwsh:amd64
```

5. Run the container and save your state or share powershell scripts. Ensure
   that the directory _$HOME/DockerShare_ exists on your computer.

```bash
   # ARM64
   docker run -it --rm --name azure-pwsh -v $HOME/DockerShare:/root docker.io/pheese/azure-pwsh:arm64
```

```bash
   # AMD64
   docker run -it --rm --name azure-pwsh -v $HOME/DockerShare:/root docker.io/pheese/azure-pwsh:amd64
```
