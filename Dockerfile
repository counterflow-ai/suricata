FROM debian:stretch

USER root

RUN apt update

RUN apt -y install libpcre3 libpcre3-dbg libpcre3-dev build-essential libpcap-dev   \
  libnet1-dev libyaml-0-2 libyaml-dev pkg-config zlib1g zlib1g-dev \
  libcap-ng-dev libcap-ng0 make libmagic-dev libjansson-dev        \
  libnss3-dev libgeoip-dev liblua5.1-dev libhiredis-dev libevent-dev \
  python-yaml rustc cargo wget curl

WORKDIR /tmp

RUN wget https://www.openinfosecfoundation.org/download/suricata-4.1.2.tar.gz

RUN tar xzf ./suricata-4.1.2.tar.gz

WORKDIR /tmp/suricata-4.1.2

RUN ./configure --prefix=/usr/ --sysconfdir=/etc --localstatedir=/var --disable-gccmarch-native --enable-lua --enable-geopip
RUN make
RUN make install-full

RUN /usr/bin/suricata -V

WORKDIR /etc/suricata

RUN chmod 755 /var/log/suricata
VOLUME /var/log/suricata

COPY ./docker-entrypoint.sh /opt/docker-entrypoint.sh

CMD /opt/docker-entrypoint.sh
