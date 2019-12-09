FROM ubuntu
RUN apt update && apt install -y software-properties-common
RUN add-apt-repository -y ppa:kartkrew/srb2kart && apt update && apt install -y srb2kart
VOLUME /config
VOLUME /addons
RUN ln -sf /config/kartserv.cfg /usr/games/SRB2Kart/kartserv.cfg && ln -sf /addons /usr/games/SRB2Kart/addons
EXPOSE 5029/udp
WORKDIR /usr/games/SRB2Kart
CMD /usr/games/SRB2Kart/srb2kart -dedicated -config kartserv.cfg