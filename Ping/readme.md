# Sample Container "Ping test"

Create service
>sudo docker service create --name ping --replicas=3 docker.io/pheese/ping ping docker.com

Create Image
>sudo docker build -t docker.io/pheese/ping .

Push Image into Repository
>sudo docker push docker.io/pheese/ping

Push Image from Repository
>sudo docker pull docker.io/pheese/ping .

Test container
>docker logs $(sudo docker ps -aqf "name=ping*") | tail -n10

Docmentation Docker ps
    > f: Filter output based on conditions provided
    > q: Only display numeric container IDssudo docker logs <UID>
    > a: for all. works even if your container is not running

