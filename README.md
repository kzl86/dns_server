# dns_server
Unbound DNS server with advertisement blocking

### Create folders for config files in your native system:

sudo mkdir /etc/unbound

sudo cp unbound.conf /etc/unbound

sudo cp ads.conf /etc/unbound

### Build image:

docker build -t dns_server .

### Run container:

docker run -d -p 53:53/tcp -p 53:53/udp \
--dns=127.0.0.1 \
--mount type=bind,source=/etc/unbound/unbound.conf,target=/etc/unbound/unbound.conf  \
--mount type=bind,source=/etc/unbound/ads.conf,target=/etc/unbound/ads.conf  \
--name dns_server-1 \
--restart always \
dns_server
