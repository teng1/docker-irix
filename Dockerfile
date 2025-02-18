# Dockerfile
FROM docker.io/library/debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
  bootp \
  net-tools \
  mksh \
  busybox \
  build-essential \ 
  xinetd \
  rsh-redone-server \
  rsh-redone-client \
  bash \
  tftpd-hpa \
  supervisor \
  dnsmasq \
  dhcping \
  tcpdump \
  procps \
  vim \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean

# COPY src/debian/inetd.conf /etc/inetd.conf
COPY src/xinetd.d/ /etc/xinetd.d/
COPY src/supervisord.conf /etc/supervisord.conf


# Setup irix account for remote shell 
RUN adduser --home /home/irix --shell /bin/mksh --system --group --disabled-password --gecos 'SGI IRIX' irix && \
  echo '+ root' > /home/irix/.rhosts

# RUN echo  'client root' > /etc/hosts.equiv
#  tftpd will need o+rw on dir to write files 

# Configure SGI client machine hostame and IP address  
RUN echo 'iris:ip=192.168.9.1' >> /etc/bootptab

COPY src/bootptab /etc/bootptab



# Enable SGI client to bypass pam.d
RUN echo '# disable ' > /etc/pam.d/rsh

# add docker-entrypoint.sh
COPY docker-entrypoint.sh /
RUN ["chmod", "+x", "/docker-entrypoint.sh"]

USER root
ENTRYPOINT ["/docker-entrypoint.sh"]
#CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
