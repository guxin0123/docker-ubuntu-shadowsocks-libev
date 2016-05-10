FROM ubuntu:trusty
MAINTAINER guxin0123 guxin0123@gmail.com


ENV SS_PASSWORD "password"
ENV SS_METHOD "aes-256-cfb"
ENV SS_PORT "8388"


RUN apt-get update && apt-get install -y wget
RUN wget -O- http://shadowsocks.org/debian/1D27208A.gpg | apt-key add -
RUN echo "deb http://shadowsocks.org/ubuntu trusty main"  | cat >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y shadowsocks-libev

ADD startServer.sh /startServer.sh
RUN chmod 755 /startServer.sh

EXPOSE $SS_PORT

CMD ["sh", "-c", "/startServer.sh"]

