FROM        alpine:edge

MAINTAINER  Daave, <daave@hitler.rocks>

RUN         apk update \
            && apk upgrade \
            && apk update \
            && apk add --no-cache mono --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
            && adduser -D -h /home/container container
RUN 
USER        container
ENV         HOME=/home/container USER=container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/ash", "/entrypoint.sh"]
