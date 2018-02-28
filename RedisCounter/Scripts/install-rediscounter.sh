docker service create --name=counter --replicas=3 --network=redisnet --publish=50000:50000 docker.io/pheese/rediscounter

