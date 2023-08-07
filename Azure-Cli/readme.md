## Create the container

Create a container using the documentation on Microsoft
[_"Install the Azure CLI on Linux"_](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=script).

Download the script _"install.py"_.

The script _"install.py"_

```bash
#---------------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License.txt in the project root for license information.
#---------------------------------------------------------------------------------------------

#
# Bash script to install the Azure CLI
#
INSTALL_SCRIPT_URL="https://azurecliprod.blob.core.windows.net/install.py"
INSTALL_SCRIPT_SHA256=7869d3c46992852525b8f9e4c63e34edd2d29cafed9e16fd94d5356665eefdfd
_TTY=/dev/tty

....

def get_install_dir():
    install_dir = None
    while not install_dir:
        prompt_message = 'In what directory would you like to place the install?'
        # **enable unattended**
        # install_dir = prompt_input_with_default(prompt_message, DEFAULT_INSTALL_DIR)
        install_dir = DEFAULT_INSTALL_DIR
        # *******************
....

```

is modified to run unattended by accepting the defaults provided in the script.
Search for "enable unattended" in the updated script in this repository. You
will find the original line of code and the change to enable unattended
installation. In the original script you have to search for prompt to identify
sections to be updated to enable unattended installation.

1. Create Image using the dockerfile

```bash
   docker build -t docker.io/[YourName]/azure-cli .
```

2. Docker Tag:

```bash
   # ARM64
   docker tag docker.io/[YourName]/azure-cli docker.io/[YourName]/azure-cli:arm64
```

```bash
   # AMD64
   docker tag docker.io/[YourName]/azure-cli docker.io/[YourName]/azure-cli:amd64
```

3. Push Image into Repository

```bash
   # ARM64
   docker push docker.io/[YourName]/azure-cli:arm64
```

```bash
   # AMD64
   docker push docker.io/[YourName]/azure-cli:amd64
```

4. Run the container

```bash
   # ARM64
   docker run -it --rm --name azure-cli docker.io/[YourName]/azure-cli:arm64
```

```bash
   # AMD64
   docker run -it --rm --name azure-cli docker.io/[YourName]/azure-cli:amd64
```

5. Run the container and save your state or share scripts. Ensure that the
   directory _$HOME/DockerShare/.azure_ and _$HOME/DockerShare/scripts_ exists
   on your computer.

```bash
   # ARM64
   docker run -it --rm --name azure-cli \
      -v $HOME/DockerShare/.azure:/root/.azure \
      -v $HOME/DockerShare/scripts:/root/scripts \
      docker.io/pheese/azure-cli:arm64
```

```bash
   # AMD64
   docker run -it --rm --name azure-cli \
      -v $HOME/DockerShare/.azure:/root/.azure \
      -v $HOME/DockerShare/scripts:/root/scripts \
      docker.io/pheese/azure-cli:AMD64
```

## Docker on Windows

If you have cloned the repository on your Windows Desktop. The files
automatically converted into the DOS format. You need to convert the following
files before you build the container image:

- .bashrc
- .bash_aliases
- install.sh

**Convert to Linux format**

```bash
fromdos .bashrc
fromdos .bash_aliases
fromdos install.sh
```
