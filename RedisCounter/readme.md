# Sample Container "Redis Counter"

## Deploy it in s swarm
Make sure you have minimum of two docker nodes running which have joind a swarm.

Make sure that you have a overlay network redisnet deployed and a redis in the network.

1) Pull Image from Repository 
    >docker pull docker.io/pheese/rediscounter

2. Create service 
    >docker service create --name=counter --replicas=3 --network=redisnet --publish=50000:50000 docker.io/pheese/rediscounter

3. Test container
    >curl -4 -i localost:50000/

## Create the container using source from the git repository

1. Create Image using the dockerfile, app.js and package.josn
    > docker build -t docker.io/pheese/rediscounter .

2. Docker Tag
    >docker tag rediscounter docker.io/pheese/rediscounter

3. Push Image into Repository
    >docker push docker.io/pheese/rediscounter

