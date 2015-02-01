#!/bin/sh

tag=fiserr/nginx-build
folder=$(dirname $(readlink -f $0))

download() {
    ver=$1
    if [ ! -e nginx-$ver.tar.gz ]; then
        wget http://nginx.org/download/nginx-$ver.tar.gz
    fi
}
createImage() {
    ver=$1
    cat > tmp/Dockerfile << EOF
FROM ubuntu:14.04
ADD nginx-$ver-bin.tar.gz2 /
RUN ln -s /opt/nginx-$ver /opt/nginx
CMD ["/opt/nginx/sbin/nginx", "-g", "daemon off;"]
EOF
    docker build -t fiserr/nginx:$ver tmp
}

download 1.2.9
download 1.4.7
download 1.6.2
download 1.7.9

if [ ! -e headers-more-nginx-module-0.25.tar.gz ]; then
    wget https://github.com/openresty/headers-more-nginx-module/archive/v0.25.tar.gz -O headers-more-nginx-module-0.25.tar.gz
fi

# build binaries
docker build -t $tag .

# extract binaries
mkdir -p tmp
docker run --rm -v $folder:/out $tag /bin/bash -c "cp /code/*.tar.gz2 /out/tmp"

# create images
createImage 1.2.9
createImage 1.4.7
createImage 1.6.2
createImage 1.7.9

exit 0;
