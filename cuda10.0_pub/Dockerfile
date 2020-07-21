
FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu16.04

MAINTAINER Yeonchan Ahn <acha21@europa.snu.ac.kr>

# Set the locale
RUN apt-get clean && apt-get update && apt-get install -y \
    locales

RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  

RUN sed -i 's/kr.archive.ubuntu.com/ftp.daumkakao.com/g' /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    vim \
    openssh-server \
    unzip \
    curl \
    wget \
    htop \
    sudo \
    zsh \
 && rm -rf /var/lib/apt/lists/*




