FROM debian:buster

MAINTAINER Felix Hopfauf "https://github.com/felixhopfauf"

RUN apt update && apt install -y wget
RUN wget https://svn.fhem.de/trac/export/HEAD/trunk/fhem/contrib/PRESENCE/deb/collectord-1.8.deb
RUN apt install -y ./collectord-1.8.deb
RUN apt clean
EXPOSE 5222

ENTRYPOINT ["collectord"]

CMD ["-vv", "-c", "/etc/collectord.conf"]
