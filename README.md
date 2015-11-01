Building the container:
-----------------------

There's nothing special about how to build this container.
```
 $ docker build -t cturra/rtorrent .
```


Running the container:
----------------------

The following outlines the docker run options to kick off this container.
```
$ docker run --name rtorrent --restart=always  \
  -v /home/cturra/Dropbox/torrent:/rtorrent:ro \
  -v /data/downloads:/downloads:rw -d cturra/rtorrent
```

There are two shared volumes in the above command: 
* /rtorrent - is the location .torrent files can be found in
* /downloads - the directory for active/complete download files
