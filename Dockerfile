FROM mrakitin/debian-with-miniconda

MAINTAINER Maksim Rakitin <mrakitin@bnl.gov>

RUN apt-get update && \
    apt-get install -y xfce4 xfce4-goodies && \
    apt-get install -y tightvncserver

RUN cd && git clone https://github.com/mrakitin/noVNC

ENV USER vncuser

RUN mkdir --mode=700 ~/.vnc
RUN echo 'vncuser' | vncpasswd -f > ~/.vnc/passwd
RUN chmod 600 ~/.vnc/passwd
