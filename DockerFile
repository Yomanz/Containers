FROM node:8.9.1-alpine


MAINTAINER Daave, <daave@aaathats3as.com>

RUN apk update \
    && apk upgrade \
    && adduser -D -h /home/container container

USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
