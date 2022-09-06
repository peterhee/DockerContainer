# Sample Container "Redis Counter"

## Deploy it in a docker swarm

Make sure you have minimum of two docker nodes running which have joined a
swarm.

Make sure that you have a overlay network redisnet deployed and a redis cache
deployed in the network.

1. Pull Image from Repository

```bash
    docker pull docker.io/pheese/rediscounter
```

2. Create service

```bash
    docker service create --name=counter --replicas=3 --network=redisnet --publish=50000:50000 docker.io/pheese/rediscounter
```

3. Test container

```bash
   curl -4 -i localhost:50000/
```

## Create the container using source from the git repository

1. Create Image using the dockerfile, app.js and package.josn

```bash
     docker build -t docker.io/{YourName}/rediscounter .
```

2. Docker Tag

```bash
    docker tag rediscounter docker.io/{YourName}/rediscounter
```

3. Push Image into Repository

```bash
    docker push docker.io/{YourName}/rediscounter
```
