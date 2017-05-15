FROM node:7.10.0-alpine
RUN apk add --update --virtual .build-dependencies git make gcc g++ python \
    && npm --ws:verbose install thomsch98/markserv -g \
    && apk del .build-dependencies
VOLUME ["/data"]
CMD ["markserv", "-x", "-a", "0.0.0.0", "-p", "80", "-l", "8123", "-d", "/data"]