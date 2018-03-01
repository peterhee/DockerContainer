# Sample Container "Generate Random UUID"

## Deploy it in a swarm
Make sure you have minimum of two docker nodes running which have joind a swarm.

1) Pull Image from Repository 
    >docker pull docker.io/pheese/guidgenerator

2. Create service 
    >docker service create --name guid --publish 40000:40000 --replicas=3 docker.io/pheese/guidgenerator

3. Test container
    >curl -4 -i localhost:40000/uuid

## Create the container using source from the git repository

1. Create Image using the dockerfile, app.js and package.josn
    > docker build -t docker.io/pheese/guidgenerator .

2. Docker Tag
    >docker tag guidgenerator docker.io/pheese/guidgenerator

3. Push Image into Repository
    >docker push docker.io/pheese/guidgenerator

