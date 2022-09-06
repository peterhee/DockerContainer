# Sample Container "Ping test"

## Deploy it in a docker swarm

Make sure you have minimum of two docker nodes running which have joined a
docker swarm.

1. Create Image

```bash
sudo docker build -t docker.io/pheese/ping .
```

2. Push Image into Repository

```bash
sudo docker push docker.io/pheese/ping
```

3. Pull Image from Repository

```bash
sudo docker pull docker.io/pheese/ping .
```

4. Create service

```bash
sudo docker service create --name ping --replicas=3 docker.io/pheese/ping ping docker.com
```

5. Test container

```bash
docker logs $(sudo docker ps -aqf "name=ping*") | tail -n10
```

Documentation Docker ps

- f: Filter output based on conditions provided
- q: Only display numeric container IDs sudo docker logs <UID>
- a: for all. works even if your container is not running
