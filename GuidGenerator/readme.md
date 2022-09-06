# Sample Container "Generate Random UUID"

## Deploy it in a swarm

Make sure you have minimum of two docker nodes running which have joind a swarm.

1. Pull Image from Repository

```bash
    docker pull docker.io/[YourName]/guidgenerator
```

2. Create service

```bash
    docker service create --name guid --publish 40000:40000 --replicas=3 docker.io/[YourName]/guidgenerator
```

3. Test container

```bash
    curl -4 -i localhost:40000/uuid
```

## Create the container using the source from the git repository

1. Create Image using the dockerfile, app.js and package.json

```bash
    docker build -t docker.io/[YourName]/guidgenerator .
```

2. Docker Tag

```bash
    docker tag guidgenerator docker.io/[YourName]/guidgenerator
```

3. Push Image into Repository

```bash
    docker push docker.io/[YourName]/guidgenerator
```
