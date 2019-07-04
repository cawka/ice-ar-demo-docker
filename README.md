# Docker automation for ICE-AR demo (server-side)

`docker-compose.yml` defines everything necessary to build and start two server-side services: discovery daemon (to respond for `/localhop/nfd-autoconf/CA` interests) and ndncert daemon (to respond to NDNCERT and challenge interests).

To see which services are defined:

    docker-compose config

To build and start service, e.g., `ndncert1`:

    docker-compose up -d ndncert1

Note that it is necessary to include `-d` flag to ensure service is started in the background mode.

To see logs of the service, you can use standard docker routines:

    docker logs -f <container-id>
