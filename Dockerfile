FROM ubuntu:18.04

LABEL author="Daave" maintainer="daave@aaathats3as.com"

RUN apt -y update && apt -y install curl wget software-properties-common iproute2 libstdc++6 lib32stdc++6

RUN curl -s https://api.github.com/repos/Southclaws/sampctl/releases/latest | grep browser_download_url.*amd64\.deb | cut -d : -f 2,3 | tr -d \" | wget -qi - -O tmp.deb
RUN curl - s https://gitlab.com/snippets/1858355/raw >> /etc/services
RUN dpkg -i tmp.deb
RUN rm tmp.deb

RUN useradd -d /home/container -m container
USER container
ENV HOME /home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
