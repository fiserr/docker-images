FROM ubuntu:14.04

RUN apt-get update && apt-get install -y \
    patch \
    gawk \
    g++ \
    gcc \
    make \
    autoconf \
    automake \
    libpcre3 \
    libpcre3-dev \
    zlibc \
    zlib1g \
    zlib1g-dev

ADD nginx-1.2.9.tar.gz /code/
ADD nginx-1.4.7.tar.gz /code/
ADD nginx-1.6.2.tar.gz /code/
ADD nginx-1.7.9.tar.gz /code/
ADD headers-more-nginx-module-0.25.tar.gz /code/

WORKDIR /code/nginx-1.2.9
RUN ./configure --prefix=/opt/nginx-1.2.9
RUN make install
RUN tar -cjf /code/nginx-1.2.9-bin.tar.gz2 /opt/nginx-1.2.9

WORKDIR /code/nginx-1.4.7
RUN ./configure --prefix=/opt/nginx-1.4.7
RUN make install
RUN tar -cjf /code/nginx-1.4.7-bin.tar.gz2 /opt/nginx-1.4.7

WORKDIR /code/nginx-1.6.2
RUN ./configure --prefix=/opt/nginx-1.6.2
RUN make install
RUN tar -cjf /code/nginx-1.6.2-bin.tar.gz2 /opt/nginx-1.6.2

WORKDIR /code/nginx-1.7.9
RUN ./configure --prefix=/opt/nginx-1.7.9 --add-module=/code/headers-more-nginx-module-0.25
RUN make install
RUN tar -cjf /code/nginx-1.7.9-bin.tar.gz2 /opt/nginx-1.7.9

WORKDIR /code
CMD ["/bin/bash"]
