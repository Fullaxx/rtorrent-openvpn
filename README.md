# A small docker image running rtorrent with openvpn

## Base Docker Image
[Ubuntu](https://hub.docker.com/_/ubuntu) 18.04 (x64)

## Software
[rtorrent](https://rakshasa.github.io/rtorrent/) - An ncurses-based bittorrent application \
[openvpn](https://openvpn.net/)

## Get the image from Docker Hub
```
docker pull fullaxx/rtorrent-openvpn
```

## Required Volume Options
Input: Drop your torrents in /srv/docker/rtorrent/autoload/
```
-v /srv/docker/rtorrent/autoload:/rtorrent/autoload
```
Output: Your downloaded data will reside here
```
-v /srv/docker/rtorrent/torrents:/rtorrent/torrents
```

## Optional Volume Options
Configuration: Any .ovpn files or a custom rtorrent.rc can be placed in /srv/docker/rtorrent/config/
```
-v /srv/docker/rtorrent/config:/rtorrent/config
```
Session State: Use this to save your session for fast restore/resume
```
-v /srv/docker/rtorrent/session:/rtorrent/session
```

## Run the image
Run the image using the default port without OpenVPN
```
docker run -it \
-v /srv/docker/rtorrent/autoload:/rtorrent/autoload \
-v /srv/docker/rtorrent/torrents:/rtorrent/torrents \
-p 49164:49164 fullaxx/rtorrent-openvpn
```
Run the image using the default port with OpenVPN \
Make sure that your myconnection.ovpn exists in /srv/docker/rtorrent/config/
```
docker run -it --cap-add=NET_ADMIN --device /dev/net/tun \
-e OVPNCFG='myconnection.ovpn' \
-e OVPNSLEEPTIME='4' \
-v /srv/docker/rtorrent/autoload:/rtorrent/autoload \
-v /srv/docker/rtorrent/torrents:/rtorrent/torrents \
-v /srv/docker/rtorrent/config:/rtorrent/config \
-v /srv/docker/rtorrent/session:/rtorrent/session \
-p 49164:49164 fullaxx/rtorrent-openvpn
```

## Build it locally using the github repository
```
docker build -t="fullaxx/rtorrent-openvpn" github.com/Fullaxx/rtorrent-openvpn
```
