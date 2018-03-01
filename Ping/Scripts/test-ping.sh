docker logs $(sudo docker ps -aqf "name=ping*") | tail -n10
