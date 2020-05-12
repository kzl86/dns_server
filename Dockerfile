FROM ubuntu

LABEL maintainer="laszlo.zoltan.kiss@gmail.com"

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
apt-get update && apt-get upgrade -y && \
apt-get install -y unbound dnsutils && \
rm /etc/unbound/unbound.conf.d/qname-minimisation.conf && \
rm /etc/unbound/unbound.conf

EXPOSE 53/tcp
EXPOSE 53/udp

CMD /etc/init.d/unbound start && tail -f /dev/null
