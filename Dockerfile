FROM ubuntu:18.04
# install add-apt-repository
#RUN apt-get install software-properties-common

# update source and install git 
RUN apt-get --silent update
RUN apt-get install git wget autoconf automake g++ gcc gettext intltool libcurl4-openssl-dev libevent-dev libglib2.0-dev libssl-dev libtool make pkg-config xz-utils zlib1g-dev -y
# copy exists transmission config to containers
RUN mkdir -p  /etc/transmission/config/

# clone transmission and building
RUN git clone https://github.com/ronggang/transmission-web-control.git /tmp/twc/
RUN wget https://github.com/transmission/transmission-releases/raw/master/transmission-3.00.tar.xz
RUN tar xf transmission-3.00.tar.xz
WORKDIR "transmission-3.00/"
RUN ./configure && make && make install 
#WORKDIR "~"
RUN mv /usr/local/share/transmission/web/index.html /usr/local/share/transmission/web/index.original.html
RUN mv /tmp/twc/src/* /usr/local/share/transmission/web/
#RUN bash /transmission.sh
RUN apt-get purge --remove autoconf automake g++ gcc gettext intltool libcurl4-openssl-dev libevent-dev libglib2.0-dev libssl-dev libtool make pkg-config xz-utils zlib1g-dev -y
ENTRYPOINT ["transmission-daemon","-f","--log-error","--config-dir=/etc/transmission/config"]
#CMD ["supervisord"]
