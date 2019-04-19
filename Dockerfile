FROM ubuntu:18.04

ENV GSNAP_VERSION 2019-03-15
RUN apt update \
  && apt install --yes \
    make \
    g++ \
    zlib1g-dev \
    libbz2-dev \
    wget \
    perl \
  && wget http://research-pub.gene.com/gmap/src/gmap-gsnap-${GSNAP_VERSION}.tar.gz \
  && tar xzvf gmap-gsnap-${GSNAP_VERSION}.tar.gz \
  && cd gmap-${GSNAP_VERSION} \
  && ./configure --prefix=/usr/local --with-simd-level=sse42 \
  && make \
  && make check \
  && make install \
  && rm -rf /tmp/* \
  && apt remove --purge --yes \
    make \
    g++ \
    wget \
  && apt autoremove --purge --yes
