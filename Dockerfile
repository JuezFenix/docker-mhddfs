FROM debian:stretch-slim
MAINTAINER JuezFenix

ENV OPTIONS="allow_other"
ENV FILESYSTEMS=
ENV OUT=

ADD http://launchpadlibrarian.net/139960431/mhddfs_0.1.39+nmu1ubuntu1_amd64.deb /tmp/mhddfs.deb
RUN apt-get update \
  && apt-get install -y \
    git \
    make \
    fuse \
    fuse-devel

RUN dpkg -i /tmp/mhddfs.deb \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY start.sh /
RUN chmod +x /start.sh

CMD ["/start.sh"]
