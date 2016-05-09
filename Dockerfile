FROM ubuntu:trusty
MAINTAINER guxin0123 guxin0123@gmail.com



RUN apt-get update && apt-get install -y wget
RUN wget -O- http://shadowsocks.org/debian/1D27208A.gpg | apt-key add -
RUN echo "deb http://shadowsocks.org/ubuntu trusty main"  | cat >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y shadowsocks-libev
RUN echo '{"server":"0.0.0.0","server_port":8388,"local_port":1080,"password":"password","timeout":60,"method":"aes-256-cfb"}' > /etc/shadowsocks-libev/config.json


EXPOSE 8388
CMD ss-server -c /etc/shadowsocks-libev/config.json
