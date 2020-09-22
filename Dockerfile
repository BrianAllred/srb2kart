FROM ubuntu:18.04

# Install required software and srb2kart
RUN apt update && apt install -y software-properties-common \
    && add-apt-repository -y ppa:kartkrew/srb2kart && apt update && apt install -y srb2kart \
    && apt clean
    
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

# TEMPORARY: Replace files with the ones for 1.3 from the KartKrew discord.
ADD https://cdn.discordapp.com/attachments/630697376474071040/754995998711087104/bonuschars.kart  \
    https://cdn.discordapp.com/attachments/630697376474071040/754996073294200882/patch.kart \
    /usr/games/SRB2Kart/

# Set working directory
WORKDIR /usr/games/SRB2Kart

# Run script
ENTRYPOINT ["srb2kart.sh"]
