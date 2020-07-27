
FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu16.04

MAINTAINER Yeonchan Ahn <acha21@europa.snu.ac.kr>

RUN sed -i 's/archive.ubuntu.com/ftp.daumkakao.com/g' /etc/apt/sources.list
RUN sed -i 's/security.ubuntu.com/ftp.daumkakao.com/g' /etc/apt/sources.list
RUN sed -i 's/extras.ubuntu.com/ftp.daumkakao.com/g' /etc/apt/sources.list

# Set the locale
RUN apt-get clean && apt-get update && apt-get install -y \
    locales

RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  


RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    vim \
    openssh-server \
    unzip \
    curl \
    wget \
    htop \
    tmux \
    sudo \
    zsh \
 && rm -rf /var/lib/apt/lists/*


# grab gosu for easy step-down from root
ARG GOSU_VERSION=1.10
RUN dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')" \
 && wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch" \
 && chmod +x /usr/local/bin/gosu \
 && gosu nobody true 

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN echo "root:Docker!" | chpasswd

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

