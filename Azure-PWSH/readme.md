## Create the container using source from the git repository

Check the current powershell version for Ubuntu Linux (Currently 7.4.5)
[Powershell Releases](https://github.com/PowerShell/PowerShell/releases)

Module installed

- Microsoft Graph
- Microsoft Azure

1. Create Image using the dockerfile

   1. Create Image using dockerfile (ARM64)

   ```bash
      # ARM64
      docker build -t docker.io/[YourName]/azure-pwsh \
            -f dockerfile.arm64 .

      # AMD64/x64
      docker build -t docker.io/[YourName]/azure-pwsh \
            -f dockerfile.amd64 .
   ```

   2. Create Image using dockerfile and specify Powershell version (ARM64)

   ```bash
      # ARM64
      docker build -t docker.io/[YourName]/azure-pwsh \
            --build-arg PS_VERSION="7.4.5"  \
            -f dockerfile.arm64 .

      # AMD64/x64
      docker build -t docker.io/[YourName]/azure-pwsh \
            --build-arg PS_VERSION="7.4.5"  \
            -f dockerfile.amd64 .
   ```

   3. Create Image using dockerfile with specific user and group (ARM64)

   ```bash
      # Container using a non-root user
      # ARM64
      docker build -t docker.io/[YourName]/azure-pwsh \
            --build-arg USER_ID=1000 --build-arg GROUP_ID=1000 \
            -f dockerfile.user.arm64 .

      # AMD64/x64
      docker build -t docker.io/[YourName]/azure-pwsh \
            --build-arg USER_ID=1000 --build-arg GROUP_ID=1000 \
            -f dockerfile.user.amd64 .
   ```

2. Docker Tag:

   ```bash
      # ARM64
      docker tag docker.io/[YourName]/azure-pwsh docker.io/[YourName]/azure-pwsh:arm64

      # AMD64/x64
      docker tag docker.io/[YourName]/azure-pwsh docker.io/[YourName]/azure-pwsh:amd64
   ```

3. Push Image into Repository

   ```bash
      # ARM64
      docker push docker.io/[YourName]/azure-pwsh:arm64

      # AMD64/x64
      docker push docker.io/[YourName]/azure-pwsh:amd64
   ```

4. Run the container

   ```bash
      # ARM64
      docker run -it --rm --name azure-pwsh \
            docker.io/[YourName]/azure-pwsh:arm64

      # AMD64/x64
      docker run -it --rm --name azure-pwsh \
            docker.io/[YourName]/azure-pwsh:amd64

   ```

5. Run the container and save your state on your computer.

   ```bash
      # ARM64
      docker run -it --rm --name azure-pwsh \
            -v [YourPath]:/root/.Azure \              # Path to Azure PS extension state
            -v [YourPath]:/root/.dotnet \             # Path to x509 Certificate store
            -v [YourPath]:/root/.config/powershell \  # Path to Powershell profile
            docker.io/[YourName]/azure-pwsh:arm64

      # AMD64/x64
      docker run -it --rm --name azure-pwsh \
            -v [YourPath]:/root/.Azure \              # Path to Azure PS extension state
            -v [YourPath]:/root/.dotnet \             # Path to x509 Certificate store
            -v [YourPath]:/root/.config/powershell \  # Path to Powershell profile
            docker.io/[YourName]/azure-pwsh:amd64

      # Container using a non-root user
      # ARM64
      docker run -it --rm --name azure-pwsh \
            -v [YourPath]:/home/user/.Azure \              # Path to Azure PS extension state
            -v [YourPath]:/home/user/.dotnet \             # Path to x509 Certificate store
            -v [YourPath]:/home/user/.config/powershell \  # Path to Powershell profile
            docker.io/[YourName]/azure-pwsh:arm64

      # AMD64/x64
      docker run -it --rm --name azure-pwsh \
            -v [YourPath]:/home/user/.Azure \              # Path to Azure PS extension state
            -v [YourPath]:/home/user/.dotnet \             # Path to x509 Certificate store
            -v [YourPath]:/home/user/.config/powershell \  # Path to Powershell profile
            docker.io/[YourName]/azure-pwsh:amd64
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
