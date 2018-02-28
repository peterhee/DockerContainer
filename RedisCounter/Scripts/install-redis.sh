docker pull docker.io/pheese/redis
docker network create --driver overlay --subnet 10.1.1.0/24 redisnet
docker service create --replicas=1 --network=redisnet --name redis docker.io/pheese/redis

