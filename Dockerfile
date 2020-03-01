FROM node:12.14.0
WORKDIR /
RUN apt-get update 
RUN apt-get -y install apt-utils
RUN apt-get -y install nginx
RUN set -x && npm install node-raumserver
COPY ./manifest/ .

RUN chmod +x init

RUN set -x && cd /node_modules && patch -p1 < /config/setUriMetadata_fix_path.patch

EXPOSE 3535

ENTRYPOINT ["/init"]