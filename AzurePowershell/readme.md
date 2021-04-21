## Create the container using source from the git repository

Check the current powershell version for Ubuntu Linux (Currently 7.0.3)
https://github.com/PowerShell/PowerShell/releases/tag/v7.0.3

Update the variable PS_VERSION=7.0.3 with current version of Powershell and rebuild the image.

1. Create Image using the dockerfile
    > docker build -t docker.io/pheese/powershell .

2. Docker Tag:
    >docker tag powershell-az-module docker.io/pheese/powershell

3. Push Image into Repository
    >docker push docker.io/pheese/powershell

4. Run the container
    >docker run -it --rm --name pwsh docker.io/pheese/powershell
