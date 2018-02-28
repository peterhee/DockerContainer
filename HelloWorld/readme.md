# Sample Container "Display Helllo World"

## Deploy it in s swarm
Make sure you have minimum of two docker nodes running which have joind a swarm.

1. Pull Image from Repository 
    >docker pull docker.io/pheese/guidgenerator

2. Create service 
    >docker service create --name helloworld --publish 30000:30000 --replicas=3 docker.io/pheese/helloworld

3. Test container
    >curl -4 -i localost:30000/

## Create the container using source from the git repository

1. Create Image using the dockerfile, app.js and package.josn
    > docker build -t docker.io/pheese/helloworld .

2. Docker Tag
    >docker tag helloworld docker.io/pheese/helloworld

3. Push Image into Repository
    >docker push docker.io/pheese/helloworld

