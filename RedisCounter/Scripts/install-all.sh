docker pull docker.io/pheese/redis
docker network create --driver overlay --subnet 10.1.1.0/24 redisnet
docker service create --replicas=1 --network=redisnet --name redis docker.io/pheese/redis
docker service create --name=counter --replicas=3 --network=redisnet --publish=50000:50000 docker.io/pheese/rediscounter

