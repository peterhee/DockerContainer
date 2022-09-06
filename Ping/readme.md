# Sample Container "Ping test"

Create service

```bash
sudo docker service create --name ping --replicas=3 docker.io/pheese/ping ping docker.com
```

Create Image

```bash
sudo docker build -t docker.io/pheese/ping .
```

Push Image into Repository

```bash
sudo docker push docker.io/pheese/ping
```

Push Image from Repository

```bash
sudo docker pull docker.io/pheese/ping .
```

Test container

```bash
docker logs $(sudo docker ps -aqf "name=ping*") | tail -n10
```

Documentation Docker ps

- f: Filter output based on conditions provided
- q: Only display numeric container IDs sudo docker logs <UID>
- a: for all. works even if your container is not running
