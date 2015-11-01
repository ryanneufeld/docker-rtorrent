FROM debian:jessie

MAINTAINER cturra <cturra@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

EXPOSE 25001-25019

# install rtorrent & supervisord
RUN apt-get -qq update
RUN apt-get -yf install rtorrent supervisor

# make sure all the necessary directories are created
RUN mkdir /downloads /torrent /root/.rtorrent

# get the config files in place
ADD conf/rtorrent.rc      /root/.rtorrent.rc
ADD conf/supervisord.conf /etc/supervisor/conf.d/rtorrent.conf
#/usr/bin/screen -R rtorrent -d
# kick off supervisord+rtorrent
CMD ["/usr/bin/supervisord"]
