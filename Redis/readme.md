# Sample Container "Redis Cache"

## Deploy it in a docker swarm

Make sure you have minimum of two docker nodes running which have joined a
swarm. Make sure that you have a overlay network redisnet deployed.

1. Pull Image from Repository

```bash
    docker pull docker.io/pheese/redis
```

2. Create overlay network

```bash
    docker network create --driver overlay --subnet 10.1.1.0/24 redisnet
```

3. Create service RedisCache

```bash
    docker service create --replicas=1 --network=redisnet --name redis docker.io/pheese/redis
```

## Create the container using source from the git repository

1. Create Image using the dockerfile, app.js and package.josn

```bash
    docker build -t docker.io/{YourName}/redis .
```

2. Docker Tag

```bash
    docker tag redis docker.io/{YourName}/redis
```

3. Push Image into Repository

```bash
    docker push docker.io/{YourName}/redis
```
