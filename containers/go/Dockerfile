FROM ubuntu:16.04

WORKDIR /root

RUN apt update
RUN apt -y install software-properties-common python-software-properties
RUN add-apt-repository ppa:gophers/archive
RUN add-apt-repository ppa:jonathonf/vim
RUN apt update
RUN apt -y install wget curl git vim golang-1.9-go
RUN ln -s /usr/lib/go-1.9 /usr/local/go

ENV GOROOT /usr/local/go
ENV GOPATH /home/shep/go
ENV PATH /bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$GOROOT/bin:$GOPATH/bin
