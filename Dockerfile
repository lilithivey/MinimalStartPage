FROM caddy:2.6.20-alpine
MAINTAINER LilithIvey <me@lilithivey.co>

# Upgrade apk and install GIT
RUN apk upgrade
RUN apk add git

# Configure caddy
COPY Caddyfile /etc/caddy/Caddyfile
COPY site /srv
RUN cd /srv
RUN git clone https://github.com/sadparadiseinhell/null.git
RUN mv null/* * && rm -r null
EXPOSE 8081
RUN reboot