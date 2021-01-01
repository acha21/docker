FROM nvidia/cuda:9.0-devel-ubuntu16.04

MAINTAINER Yeonchan Ahn <acha21@europa.snu.ac.kr>

RUN sed -i 's/archive.ubuntu.com/ftp.daumkakao.com/g' /etc/apt/sources.list && \
    sed -i 's/security.ubuntu.com/ftp.daumkakao.com/g' /etc/apt/sources.list && \
    sed -i 's/extras.ubuntu.com/ftp.daumkakao.com/g' /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    vim \
    openssh-server \
    unzip \
    curl \
    wget \
    sudo \
    libexpat1-dev \
    net-tools \
    p7zip-full \
    tmux \
    ant \
    openjdk-8-jdk \
    ca-certificates-java \
    locales \
 && rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

# Setup timezone
ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Fix certificate issues
RUN update-ca-certificates -f;

# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

#set password
RUN echo 'root:root' |chpasswd

#replace sshd_config
RUN mkdir /var/run/sshd
RUN mkdir /root/.ssh
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

EXPOSE 22

ARG USER_ID
ARG GROUP_ID
ARG USER_NAME

RUN addgroup -gid $GROUP_ID $USER_NAME
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID $USER_NAME

RUN echo "$USER_NAME:$USER_NAME" | chpasswd
RUN usermod -aG sudo $USER_NAME

ENV HOME=/root
