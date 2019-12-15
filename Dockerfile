FROM ubuntu:18.04

LABEL mantainer="Sebastian Fiorentino <sfiorentino@mobeats.io>"

WORKDIR /tmp/pythonbuild

RUN apt-get update
RUN apt-get -y install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget
RUN wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz
RUN tar -xf Python-3.7.4.tgz

WORKDIR /tmp/pythonbuild/Python-3.7.4 

RUN sh configure --enable-optimizations
RUN make -j 8
RUN make altinstall

EXPOSE 8000