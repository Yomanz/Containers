FROM node:8.9.1-alpine

MAINTAINER Daave, <daave@aaathats3as.com>
ENV DEBIAN_FRONTEND noninteractive

RUN

USER        container
ENV         HOME /home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD ["/bin/ash", "/entrypoint.sh"]
