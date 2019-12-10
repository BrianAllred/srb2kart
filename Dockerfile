FROM ubuntu

# Install required software and srb2kart
RUN apt update && apt install -y software-properties-common
RUN add-apt-repository -y ppa:kartkrew/srb2kart && apt update && apt install -y srb2kart

# Setup volumes
VOLUME /config
VOLUME /addons
VOLUME /data

# Symlink for config
RUN ln -sf /config/kartserv.cfg /usr/games/SRB2Kart/kartserv.cfg && ln -sf /addons /usr/games/SRB2Kart/addons

# Expose network port
EXPOSE 5029/udp

# Copy bash script and fix execute permission
COPY srb2kart.sh /usr/bin/srb2kart.sh
RUN chmod a+x /usr/bin/srb2kart.sh

# Set working directory
WORKDIR /usr/games/SRB2Kart

# Run script
ENTRYPOINT srb2kart.sh