# Fix access denied issue in Centos for docker.sock

## Install sealert to convert log into readable format

```bash
yum install setroubleshoot-server

# Run as root
sudo sealert /var/logs/audit/audit.log /var/logs/audit/audit-readable.log
```

```bash
# Fix access denied based on info from audit log (sample)

sudo ausearch -c 'portainer' --raw | audit2allow -M my-portainer
sudo semodule -i my-portainer.pp
```

## Deploy Portainer using SSL

### Create SSL certificate for Portainer Portal

```bash
openssl genrsa -out ./portainer.key 2048
openssl ecparam -genkey -name secp384r1 -out ./portainer.key
openssl req -new -x509 -sha256 -key ./portainer.key -out ./portainer.crt -days 3650
```

### Create Docker Volume to store persistent the certs and configuration data

Create docker volumes

```bash
docker volume create --name DataPortainer
docker volume create --name CertsPortainer
```

Copy the certs into the volume, so Portainer can use them later on

```bash
cp ./*.key /var/lib/docker/volumes/CertsPortainer/_data
cp ./*.crt /var/lib/docker/volumes/CertsPortainer/_data
```

## Deploy Portainer on management node in docker swarm

Create docker service for container

```bash
docker service create \
    --name portainer \
    --publish 443:9000 \
    --constraint 'node.role == manager' \
    --mount type=bind,src=//var/run/docker.sock,dst=/var/run/docker.sock:z \
    --mount source=portainer,target=/data \
    --mount source=CertsPortainer,target=/certs \
    portainer/portainer --ssl --sslcert /certs/portainer.crt --sslkey /certs/portainer.key\
    -H unix:///var/run/docker.sock
```
