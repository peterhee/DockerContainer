## Create the container using source from the git repository

Check the current powershell version for Ubuntu Linux (Currently 7.0.3)
https://github.com/PowerShell/PowerShell/releases/tag/v7.0.3

Update the variable PS_VERSION=7.0.3 with current version of Powershell and
rebuild the image.

1. Create Image using the dockerfile

   > docker build -t docker.io/[YourName]/azure-pwsh .

2. Docker Tag:

   For ARM64

```bash
   docker tag docker.io/[YourName]/azure-pwsh docker.io/[YourName]/azure-pwsh:arm64
```

For AMD64

```bash
   docker tag docker.io/[YourName]/azure-pwsh docker.io/[YourName]/azure-pwsh:amd64
```

3. Push Image into Repository

   For ARM64

```bash
   docker push docker.io/[YourName]/azure-pwsh:arm64
```

For AMD64

```bash
   docker push docker.io/[YourName]/azure-pwsh:amd64
```

4. Run the container

```bash
   docker run -it --rm --name-az pwsh docker.io/[YourName]/azure-pwsh
```

5. Run the container and save your state or share powershell scripts. Ensure
   that the directory _$HOME/DockerShare_ exists on your computer.

```bash
   docker run -it --rm --name pwsh-az -v $HOME/DockerShare:/root docker.io/pheese/azure-pwsh
```
