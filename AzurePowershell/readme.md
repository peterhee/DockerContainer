## Create the container using source from the git repository

Check the current powershell version for Ubuntu Linux (Currently 7.0.3)
https://github.com/PowerShell/PowerShell/releases/tag/v7.0.3

Update the variable PS_VERSION=7.0.3 with current version of Powershell and rebuild the image.

1. Create Image using the dockerfile
    > docker build -t docker.io/[YourName]/powershell .

2. Docker Tag:
    >docker tag powershell-az-module docker.io/[YourName]/powershell

3. Push Image into Repository
    >docker push docker.io/[YourName]/powershell

4. Run the container
    >docker run -it --rm --name-az pwsh docker.io/[YourName]/powershell

5. Run the container and save your state or share powershell scripts. Ensure that the directory "$HOME/DockerShare exists" on your computer.
    >docker run -it --rm --name pwsh-az -v $HOME/DockerShare:/root docker.io/pheese/powershell
