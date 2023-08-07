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

## Docker on Windows

If you have cloned the repository on your Windows Desktop. The files
automatically converted into the DOS format. You need to
[convert](https://ubuntugenius.wordpress.com/2010/10/26/how-to-convert-windowsdos-text-files-to-linuxunix-format/#:~:text=It's%20actually%20very%20easy%20to,Unix%2FLinux%20instead%20of%20Windows.)
the following files before you build the container image:

- .bashrc
- .bash_aliases

**Convert to Linux format**

```bash
fromdos .bashrc
fromdos .bash_aliases
```
