docker service create \
    --name portainer \
    --publish 443:9000 \
    --constraint 'node.role == manager' \
    --mount type=bind,src=//var/run/docker.sock,dst=/var/run/docker.sock:z \
    --mount source=portainer,target=/data \
    --mount source=CertsPortainer,target=/certs \
    portainer/portainer --ssl --sslcert /certs/portainer.crt --sslkey /certs/portainer.key\
    -H unix:///var/run/docker.sock


