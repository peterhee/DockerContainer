## Create the container using source from the git repository

Check the current powershell version for Ubuntu Linux (Currently 7.4.4)
https://github.com/PowerShell/PowerShell/releases/tag/v7.4.4

1. Create Image using the dockerfile

   1. Create Image using dockerfile (ARM64)

   ```bash
   # cpu=amd64
   cpu=arm64
   docker build -t docker.io/[YourName]/azure-pwsh \
         -f dockerfile.$cpu .
   ```

   3. Create Image using dockerfile and specify Powershell version (ARM64)

   ```bash
   # cpu=amd64
   cpu=arm64
   docker build -t docker.io/[YourName]/azure-pwsh \
         --build-arg PS_VERSION="7.4.4"  \
         -f dockerfile.$cpu .
   ```

   3. Create Image using dockerfile with specific user and group (ARM64)

   ```bash
   # cpu=amd64
   cpu=arm64
   docker build -t docker.io/[YourName]/azure-pwsh \
         --build-arg USER_ID=1000 --build-arg GROUP_ID=1000 \
         -f dockerfile.user.$cpu .
   ```

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
      docker run -it --rm --name azure-pwsh docker.io/[YourName]/azure-pwsh
   ```

5. Run the container and save your state or share powershell scripts. Ensure
   that the directory _$HOME/DockerShare_ exists on your computer.

   ```bash
      docker run -it --rm --name azure-pwsh -v $HOME/DockerShare:/root docker.io/pheese/azure-pwsh
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
