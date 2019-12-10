# srb2kart

Docker container for running a Sonic Robo Blast 2 Kart dedicated server.

## Usage

### Basic

At a minumum, UDP port 5029 must be exposed.

`docker run -d --name srb2kart -p 5029:5029/udp brianallred/srb2kart`

You may choose a different host port, just note that players joining your server must specify the port number if it deviates from the default.

### Advanced

#### Configuration

In order to configure server variables, bind the `/config` volume to a host directory, create `kartserv.cfg`, and edit it. Documentation [here](https://wiki.srb2.org/wiki/Console/Variables).

`docker run -d --name srb2kart -p 5029:5029/udp -v /path/on/host/config:/config brianallred/srb2kart`

`$ sudo vim /path/on/host/config/kartserv.cfg`

#### Addons

In order to load addons, bind the `/addons` volume to a host directory and copy them there.

`docker run -d --name srb2kart -p 5029:5029/udp -v /path/on/host/addons:/addons brianallred/srb2kart`

Note that if you're unable to join the server after adding an addon, make sure the addon was loaded correctly (`docker logs srb2kart` is a great place to start).

#### Persistent Data

In order to persist data through server shutdowns, bind the '/data' volume to a host directory.

`docker run -d --name srb2kart -p 5029:5029/udp -v /path/on/host/data:/data brianallred/srb2kart`
