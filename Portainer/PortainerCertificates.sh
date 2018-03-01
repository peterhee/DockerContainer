## Create SSL certificate for Portainer Portal
openssl genrsa -out ./portainer.key 2048
openssl ecparam -genkey -name secp384r1 -out ./portainer.key
openssl req -new -x509 -sha256 -key ./portainer.key -out ./portainer.crt -days 3650

## Create Docker Volume to store the certificates
docker volume create --name DataPortainer
docker volume create --name CertsPortainer

cp ./*.key /var/lib/docker/volumes/CertsPortainer/_data
cp ./*.crt /var/lib/docker/volumes/CertsPortainer/_data
