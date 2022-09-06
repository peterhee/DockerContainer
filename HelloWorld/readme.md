# Sample Container "Display Hello World"

## Deploy it in s swarm

Make sure you have a minimum of two docker nodes running which have joined a
swarm.

1. Pull Image from Repository

```bash
    docker pull docker.io/pheese/guidgenerator
```

2. Create service

```bash
    docker service create --name helloworld --publish 30000:30000 --replicas=3 docker.io/pheese/helloworld
```

3. Test container

```bash
    curl -4 -i localhost:30000/
```

## Create the container using the source from the git repository

1. Create image using the dockerfile, app.js and package.josn

```bash
    docker build -t docker.io/pheese/helloworld .
```

2. Add Docker Tag

```bash
    docker tag helloworld docker.io/pheese/helloworld:latest
```

3. Push Image into the repository

```bash
    docker push docker.io/pheese/helloworld
```
